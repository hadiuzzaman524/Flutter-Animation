import 'package:animation/details.dart';
import 'package:flutter/material.dart';
import 'models/data.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Tween<Offset> _offset = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));

  var _key = GlobalKey<AnimatedListState>();
  var list=[];

  _addItems() {
    list = AllItems().getUserList;
  }

  @override
  void initState() {
    super.initState();
   _addItems();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: AnimatedList(
          key: _key,
          initialItemCount: list.length,
          itemBuilder: (context, index, animation) {
            return SlideTransition(
              position: animation.drive(_offset),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Hero(
                    tag: list[index].imageurl,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(list[index].imageurl),
                    ),
                  ),
                  title: Text(
                    list[index].title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, DetailsScreen.routeName,
                        arguments: [list[index].title, list[index].imageurl]);
                    /*   Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => DetailsScreen()));*/
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
/*
ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Hero(
                  tag: list[index].imageurl,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(list[index].imageurl),
                  ),
                ),
                title: Text(
                  list[index].title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, DetailsScreen.routeName,
                      arguments: [list[index].title, list[index].imageurl]);
                  /*   Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => DetailsScreen()));*/
                },
              ),
            );
          },
        ),
 */
