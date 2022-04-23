import 'package:flutter_test/flutter_test.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/services/http_server.dart';

// main
void main() async {
  var p = Post(1, "title", "body", 1);

  group("rest api test for (POST PUT GET) method ==> ", () {
    test("Get method", () async {
      var _create = await Rest_APi.GET_POST(id: "1");
      expect(_create.length, 1);
    });

    test("post method", () async {
      var _create = await Rest_APi.POST_Create(p);
      expect(_create.contains('1'), true);
    });

    test("put method", () async {
      var _update = await Rest_APi.PUT_Update(p);
      expect(_update.length, greaterThan(10));
      expect(_update.length, equals(68));
      expect(_update.length, 68);
    });

    test("delete method", () async {
      var _delete = await Rest_APi.DEL(p);
      expect(_delete, true); // true == true
      expect(_delete, isTrue); // true == true
    });
  });
}
