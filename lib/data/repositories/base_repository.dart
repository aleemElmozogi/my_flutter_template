import 'package:dartz/dartz.dart';
import 'package:my_flutter_template/core/api/api_consumer.dart';
import 'package:my_flutter_template/core/error/exceptions.dart';
import 'package:my_flutter_template/core/error/failures.dart';
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';
import 'package:my_flutter_template/core/models/message_model.dart';
import 'package:my_flutter_template/core/network/netwok_info.dart';
import 'package:my_flutter_template/generated/l10n.dart';

abstract class BaseRepository {
  final LocalStorage localStorage;
  final ApiConsumer apiConsumer;
  final NetworkInfo networkInfo;

  BaseRepository({
    required this.localStorage,
    required this.apiConsumer,
    required this.networkInfo,
  });

  /// Handles network checks, API requests, and exceptions.
  Future<Either<Failure, ResultType>> executeRequest<T, ResultType>({
    required Future<T> Function() requestFunction,
    required Future<ResultType> Function(T response) onSuccess,
  }) async {
    // Check network connection before executing the request
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure(S.current.noInternetConnection));
    }

    try {
      // Execute the API request
      final T response = await requestFunction();

      // Handle successful response
      final ResultType result = await onSuccess(response);
      return Right(result);
    } on ApiException catch (e) {
      // Handle API-specific errors
      return Left(
        ApiFailure.withMessage(e.message ?? S.current.errorDuringCommunication),
      );
    } on FetchDataException catch (e) {
      // Handle fetch data errors
      return Left(
        FetchErrorFailure.withMessage(
          e.message ?? S.current.errorDuringCommunication,
        ),
      );
    } on EmptyResponseException catch (e) {
      // Handle cases of empty response
      return Left(
        FetchErrorFailure.withMessage(
          e.message ?? S.current.noDataOrContentAvailable,
        ),
      );
    } on BadRequestException catch (e) {
      // Handle bad request errors
      return Left(
        ServerFailure.withMessage(e.message ?? S.current.invalidRequest),
      );
    } on BadResponseException catch (e) {
      // Handle invalid response errors
      return Left(
        ServerFailure.withMessage(e.message ?? S.current.invalidResponse),
      );
    } on UnauthorizedException catch (e) {
      // Handle unauthorized errors
      return Left(AuthFailure.withMessage(e.message ?? S.current.unauthorized));
    } on NotFoundException catch (e) {
      // Handle not found errors
      return Left(
        ServerFailure.withMessage(
          e.message ?? S.current.informationNotAvailable,
        ),
      );
    } on ConflictException catch (e) {
      // Handle conflict errors
      return Left(
        ServerFailure.withMessage(e.message ?? S.current.conflictOccurred),
      );
    } on InternalServerErrorException catch (e) {
      // Handle internal server errors
      return Left(
        ServerFailure.withMessage(e.message ?? S.current.internalServerError),
      );
    } on NoInternetConnectionException catch (e) {
      // Handle no internet connection errors
      return Left(
        NetworkFailure.withMessage(e.message ?? S.current.noInternetConnection),
      );
    } on CacheException catch (e) {
      // Handle cache errors
      return Left(
        CacheFailure.withMessage(
          e.message ?? S.current.noDataOrContentAvailable,
        ),
      );
    } on Failure catch (failure) {
      // Preserve explicitly thrown domain failures from repository success handlers.
      return Left(failure);
    } on ServerException catch (e) {
      // Handle general server exceptions
      return Left(
        ServerFailure.withMessage(
          e.message ?? S.current.errorDuringCommunication,
        ),
      );
    } on Exception catch (e) {
      // Handle all other unhandled exceptions
      return Left(FetchErrorFailure.withMessage(e.toString()));
    } catch (e) {
      // Handle all other unhandled exceptions
      return Left(
        FetchErrorFailure.withMessage(S.current.errorDuringCommunication),
      );
    }
  }

  Future<Either<Failure, String>> executeMessageRequest({
    required Future<MessageModel> Function() requestFunction,
  }) {
    return executeRequest<MessageModel, String>(
      requestFunction: requestFunction,
      onSuccess: (response) async => response.data ?? '',
    );
  }

  Future<Either<Failure, void>> executeVoidMessageRequest({
    required Future<MessageModel> Function() requestFunction,
  }) {
    return executeRequest<MessageModel, void>(
      requestFunction: requestFunction,
      onSuccess: (_) async {},
    );
  }
}
