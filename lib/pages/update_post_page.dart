import 'package:flutter/material.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/view%20Models/update_view_model.dart';
import 'package:patterns_provider/widgets/text_field.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Update_post extends StatefulWidget {
  Post post;
  static final String id = "update_post";
  Update_post({Key? key, required this.post}) : super(key: key) {}

  @override
  State<Update_post> createState() => _Update_postState();
}

class _Update_postState extends State<Update_post> {
  late Update_view_model base_model;

  @override
  void initState() {
    base_model = Update_view_model(post: widget.post);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Update Post"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => base_model,
        builder: (con, wid) => Consumer<Update_view_model>(
          builder: (context, model, child) => SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: h - 58,
                  width: w,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text_Field.Create_textFiled(
                          "Title", base_model.control1, 3),
                      Text_Field.Create_textFiled(
                          "Body", base_model.control2, 6),
                    ],
                  ),
                ),
                model.isloading
                    ? Container(
                        height: h,
                        width: w,
                        color: Colors.black.withOpacity(.4),
                        child: Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          base_model.Update(context);
        },
        child: Icon(Icons.update),
      ),
    );
  }
}
