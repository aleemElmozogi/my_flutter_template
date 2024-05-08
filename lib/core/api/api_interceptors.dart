import 'package:my_flutter_template/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:my_flutter_template/core/di/injection.dart' as di;


class AppIntercepters extends Interceptor {
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 ||err.response?.statusCode ==  403) {
      await di.getIt<AuthCubit>().logOut();
    }

    super.onError(err, handler);
  }
}
