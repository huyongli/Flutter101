import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:laohu_kit/request/factory/request_client.dart';
import 'package:laohu_kit/request/request.dart';

class MockClient extends RequestClient {

  @override
  Future<dynamic> execute(Request request) async {
    String path = request.path.split('/').last ?? '';
    String content = await rootBundle.loadString('assets/mocks/$path.json');
    var response = json.decode(content);
    return response;
  }

  @override
  void cancel() {

  }
}