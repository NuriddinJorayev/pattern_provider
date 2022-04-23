import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/pages/ditails_paga.dart';
import 'package:patterns_provider/pages/update_post_page.dart';
import 'package:patterns_provider/view%20Models/home_view_models.dart';

Widget items_builder(BuildContext context, Home_view_models model, Post p,
    Function() press, bool isTapAble) {
  return InkWell(
    onTap: isTapAble
        ? () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Ditails_page(p.id.toString())))
                .then((value) {
              FocusScope.of(context).requestFocus(FocusNode());
              model.initialize_future();
            });
          }
        : null,
    child: Slidable(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                p.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                p.body,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
      startActionPane:
          ActionPane(extentRatio: .25, motion: const ScrollMotion(), children: [
        SlidableAction(
          // Edite function
          onPressed: (BuildContext con) {
            Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Update_post(post: p)))
                .then((value) {
              FocusScope.of(context).requestFocus(FocusNode());
            });
          },
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edite',
        ),
      ]),
      endActionPane:
          ActionPane(extentRatio: .25, motion: const ScrollMotion(), children: [
        SlidableAction(
          // delete function
          onPressed: (BuildContext con) {
            press();
            !isTapAble ? Navigator.pop(context) : {};
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
    ),
  );
}
