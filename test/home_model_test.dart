import 'package:flutter_test/flutter_test.dart';
import 'package:patterns_provider/view%20Models/home_view_models.dart';

void main() {
  test("home model", () async {
    var home_model = Home_view_models();
    await Future.delayed(Duration(seconds: 3));
    expect((await home_model.future)!.length, 100);
    expect(home_model.isloading, isFalse);
  });
}
