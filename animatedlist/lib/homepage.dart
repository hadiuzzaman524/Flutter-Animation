import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/datamodel.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ScrollController controller=ScrollController();
  bool hideTop=false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        hideTop=controller.offset>50;
        print(controller.offset);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.cyan,
      title: Text('Animated List'),
    );
    final appbarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final height =
        MediaQuery.of(context).size.height - appbarHeight - statusBarHeight;

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 400),
                  opacity: hideTop?0:1,
                  child: AnimatedContainer(
                    alignment: Alignment.topCenter,
                    duration: Duration(milliseconds: 400),
                    height:hideTop?0:height * .3,
                    width: double.infinity,
                    child: TopListView(height: height),
                  ),
                ),
                Container(
                  height: !hideTop? height * .7:height,
                  width: double.infinity,
                  child: BottomListView(controller: controller,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopListView extends StatelessWidget {

  final ScrollController controller;
  const TopListView({
    Key key,
    this.controller,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return Card(
          color: DUMMY_CATEGORIES[index].color,
          elevation: 5,
          child: Container(
            height: height * .2,
            width: 160,
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
    );
  }
}

class BottomListView extends StatelessWidget {

  final ScrollController controller;
  const BottomListView({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
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
    );
  }
}
