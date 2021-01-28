import 'package:animation/userlist.dart';
import 'package:flutter/material.dart';
import 'details.dart';
import 'more_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        DetailsScreen.routeName: (ctx) => DetailsScreen(),
        MoreAnimation.routeName: (ctx) => MoreAnimation(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: Text('Hadiuzzaman',style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,

                  ),),
                ),
              ),
              UserList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //  Navigator.of(context).pushNamed(MoreAnimation.routeName);
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MoreAnimation()));
            //Navigator.pushNamed(context, MoreAnimation.routeName);
          },
          child: Icon(Icons.more),
        ),
      ),
    );
  }
}
