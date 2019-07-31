

import 'package:openapi_dart_common/openapi.dart';
import 'package:openapi_dart_common/openapi_cli_api.dart';

import 'package:counterapi/api.dart';

class Common {
  final ApiClient _apiClient;
  CounterServiceApi counterServiceApi;

  Common() :
      _apiClient = ApiClient(
        basePath: "http://localhost:8076",
        deserializeDelegate: LocalApiClient(),
        apiClientDelegate: CliApiClientDelegate()) {
    counterServiceApi = CounterServiceApi(_apiClient);
  }
}
