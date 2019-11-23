import 'package:openapi_dart_common/openapi.dart';
import 'package:counterapi/api.dart';

class Client {
  ApiClient _apiClient;
  CounterServiceApi _counterServiceApi;

  CounterServiceApi get counterServiceApi => _counterServiceApi;

  Client() {
    _apiClient = ApiClient(
        basePath: "http://localhost:8076",
        deserializeDelegate: LocalApiClient());
    _counterServiceApi = CounterServiceApi(_apiClient);
  }
}
