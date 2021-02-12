import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/datamodel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.cyan,
    );
    final appbarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final height =
        MediaQuery.of(context).size.height - appbarHeight - statusBarHeight;

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: Container(
          child: Column(
            children: [
              Container(
                height: height * .3,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: DUMMY_CATEGORIES[index].color,
                      elevation: 5,
                      child: Container(
                        height: height * .2,
                        width: 200,
                        child: Center(
                          child: Text(
                            DUMMY_CATEGORIES[index].title,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: DUMMY_CATEGORIES.length,
                ),
              ),
              Container(
                height: height * .7,
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      DUMMY_MEALS[index].imageUrl,
                                    ),
                                    radius: 80,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      DUMMY_MEALS[index].title,
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.lock_clock),
                                  Text(
                                    DUMMY_MEALS[index].duration.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.control_point_duplicate_rounded),
                                  Text(
                                    DUMMY_MEALS[index].complexity.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: DUMMY_MEALS.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
