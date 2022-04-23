import 'package:flutter/foundation.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/services/http_server.dart';

class Ditails_view_model extends ChangeNotifier {
  Future<List<Post>> getData(String id) async {
    var data = await Rest_APi.GET_POST(id: id);
    return data;
  }
}
