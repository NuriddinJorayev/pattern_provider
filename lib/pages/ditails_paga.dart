import 'package:flutter/material.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/view%20Models/ditails_view_model.dart';
import 'package:patterns_provider/view%20Models/home_view_models.dart';
import 'package:patterns_provider/views/item_of_home.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Ditails_page extends StatefulWidget {
  String id;
  Ditails_page(this.id);

  @override
  State<Ditails_page> createState() => _Ditails_pageState();
}

class _Ditails_pageState extends State<Ditails_page> {
  var base_model = Ditails_view_model();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        key: Key("key 11111"),
        title: Text("Ditails page"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => base_model,
        child: Consumer<Ditails_view_model>(
          builder: (context, model, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              FutureBuilder<List<Post>>(
                future: model.getData(widget.id),
                builder: (BuildContext context, snp) {
                  if (snp.connectionState == ConnectionState.done)
                    return items_builder(context, Home_view_models(),
                        snp.data!.first, () {}, false);
                  else if (snp.connectionState == ConnectionState.waiting)
                    return Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  return Center(
                    child: Text("Erroe"),
                  );
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
