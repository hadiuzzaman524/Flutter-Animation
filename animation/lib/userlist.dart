import 'package:animation/details.dart';
import 'package:flutter/material.dart';
import 'models/data.dart';

class UserList extends StatelessWidget {
  const UserList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = AllItems().getUserList;

    return Expanded(
      child: Container(
        child: ListView.builder(
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
      ),
    );
  }
}
