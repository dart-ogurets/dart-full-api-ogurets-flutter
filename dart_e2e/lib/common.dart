
import 'package:openapi_dart_common/openapi.dart';
import 'package:counterapi/api.dart';

class Common {
  ApiClient _apiClient;
  CounterServiceApi counterServiceApi;

  Common() {
    _apiClient = ApiClient(
      basePath: "http://localhost:8076",
      deserializeDelegate: LocalApiClient());
      counterServiceApi = CounterServiceApi(_apiClient);
    }
  }

