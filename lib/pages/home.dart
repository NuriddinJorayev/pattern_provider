import 'package:flutter/material.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/pages/create_post_page.dart';
import 'package:patterns_provider/view%20Models/home_view_models.dart';
import 'package:patterns_provider/views/item_of_home.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static final String id = "home_page";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var base_model = Home_view_models();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Provider"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => base_model,
        child: Consumer<Home_view_models>(
          builder: (context, model, child) => Stack(
            children: [
              Container(
                height: h,
                width: w,
                key: Key("key1"), // key
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/originals/4b/f2/b3/4bf2b361a67b3030b185fd7447b279b5.jpg"),
                        fit: BoxFit.fill)),
                child: FutureBuilder<List<Post>>(
                  future: model.future,
                  builder: (BuildContext context, snp) {
                    if (snp.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snp.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return items_builder(context, model, snp.data![index],
                              () {
                            model.Delete(snp.data![index]);
                          }, true);
                        },
                      );
                    } else if (snp.connectionState == ConnectionState.waiting) {
                      return Container(
                        height: h,
                        width: w,
                        color: Colors.black.withOpacity(.4),
                        child: Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              base_model.isloading
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Create_post.id).then((value) {
            if (value != null) {
              base_model.initialize_future();
            }
            FocusScope.of(context).requestFocus(FocusNode());
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
