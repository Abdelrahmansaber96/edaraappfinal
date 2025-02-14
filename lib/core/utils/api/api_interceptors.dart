import 'package:dio/dio.dart';
import 'package:edaraappfinal/core/utils/api/Endpoints.dart';
import 'package:edaraappfinal/core/utils/database/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? 'Bearer ${CacheHelper().getData(key: ApiKey.token)}'
            : null;
    options.headers['accept'] = '*/*';
    super.onRequest(options, handler);
  }
}
