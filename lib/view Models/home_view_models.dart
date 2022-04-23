import 'package:flutter/foundation.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/services/http_server.dart';

class Home_view_models extends ChangeNotifier {
  Future<List<Post>>? future;
  bool isloading = false;

  Home_view_models() {
    initialize_future();
  }

  initialize_future() {
    isloading = true;
    notifyListeners();
    future = Rest_APi.GET_POST();
    isloading = false;
    notifyListeners();
  }

  Delete(Post p) async {
    isloading = true;
    notifyListeners();
    await Rest_APi.DEL(p).then((value) {
      if (value) {
        initialize_future();
      }
    });
  }
}
