import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String? id;
  String? name;
  String? job;
  String? created;

  PostResult({this.id, this.name, this.job, this.created});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object["id"],
      name: object["name"],
      job: object["job"],
      created: object["createdAt"],
    );
  }

  static Future<PostResult> formCreated(String name, String job) async {
    String apiURL = "http://reqres.in/api/users";
    var apiResult = await http.post(apiURL as Uri, body: {
      "name": name,
      "job": job,
    });
    var jsonObject = jsonDecode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
