import 'package:http/http.dart' as http;

import '../model/user_data.dart';

class RemoteService {
  RemoteService();
  Future<ResultRemoteService> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      //return userDataFromJson(json);
      final res = userDataFromJson(json);
      return ResultRemoteService(datas: res);
    }

    return ResultRemoteService(errorMessage: 'error ');
  }
}

class ResultRemoteService {
  final String? errorMessage;
  final List<UserData>? datas;

  ResultRemoteService({
    this.errorMessage,
    this.datas,
  });
}
