import 'package:flutter_test/flutter_test.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/view%20Models/update_view_model.dart';

void main() {
  test("create page", () async {
    var post = Post(1, 'title', 'body', 1);
    var updata = Update_view_model(post: post);

    expect(updata.control1.text, equals(post.title));
    expect(updata.control2.text.length, post.body.length);
  });
}
