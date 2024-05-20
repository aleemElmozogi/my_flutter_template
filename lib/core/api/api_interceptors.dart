import 'package:my_flutter_template/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:my_flutter_template/core/di/injection.dart' as di;


class AppInterceptors extends Interceptor {
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 ||err.response?.statusCode ==  403) {
      //TODO: This needs to be tested
      await di.getIt<AuthCubit>().onForceLogout();
    }
    super.onError(err, handler);
  }
}
