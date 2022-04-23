import 'dart:convert';

import 'package:http/http.dart';
import 'package:patterns_provider/models/post_model.dart';

class Rest_APi {
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* Http Apis */

  static String API_GET = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}

  /* Http Requests */

  static Future<List<Post>> GET_POST({String id = ''}) async {
    var uri = Uri.https(
        BASE, id.isNotEmpty ? "$API_GET/$id" : API_GET); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      print('Create \n');
      print("response body is so long");
      print("status code = ${response.statusCode}");
      print('\n');
      return id.isNotEmpty
          ? [Post.fromJson(jsonDecode(response.body))]
          : List<Post>.from(
              jsonDecode(response.body).map((e) => Post.fromJson(e)));
    }
    return [];
  }

  static Future<String> POST_Create(Post params) async {
    var uri = Uri.https(BASE, API_CREATE); // http or https
    var response = await post(uri,
        headers: headers, body: jsonEncode(paramsCreate(params)));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Create \n');
      print("response body = ${response.body}");
      print("status code = ${response.statusCode}");
      print('\n');
      return response.body;
    }
    return "";
  }

  static Future<String> PUT_Update(Post params) async {
    var uri = Uri.https(BASE, API_UPDATE + "/${params.id}"); // http or https
    var response = await put(uri,
        headers: headers, body: jsonEncode(paramsUpdate(params)));
    if (response.statusCode == 200) {
      print('Updated \n');
      print("response body = ${response.body}");
      print("status code = ${response.statusCode}");
      print('\n');
      return response.body;
    }
    return "";
  }

  static Future<bool> DEL(Post p) async {
    var uri = Uri.https(BASE, API_DELETE + '/${p.id}'); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      print('Deleted \n');
      print("response body = ${response.body}");
      print("status code = ${response.statusCode}");
      print('\n');
      return response.statusCode == 200;
    }
    return response.statusCode == 200;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() => {};

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'id': post.id.toString(),
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString(),
    });
    return params;
  }
}
