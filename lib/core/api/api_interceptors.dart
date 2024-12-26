import 'package:dio/dio.dart';
import 'package:ansaap_app/core/di/injection.dart' as di;
import 'package:ansaap_app/features/authentication/auth/presentation/cubit/auth_cubit.dart';


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
