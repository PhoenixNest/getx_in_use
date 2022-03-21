import 'package:get/get.dart';
import 'package:getx_e_commerce_app/common/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.appBaseUrl,
  }) {
    baseUrl = appBaseUrl;
    token = AppConstants.TOKEN;
    timeout = const Duration(seconds: 30);

    // Post request header
    _mainHeaders = {
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (exception) {
      return Response(statusCode: 1, statusText: exception.toString());
    }
  }
}
