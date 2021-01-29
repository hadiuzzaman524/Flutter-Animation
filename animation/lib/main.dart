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
                child: TweenAnimationBuilder(
                  duration: Duration(seconds: 1),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (ctx, _val, ch) {
                    return Padding(
                      padding: EdgeInsets.all(_val * 60),
                      child: Opacity(
                        child: Text(
                          'Hadiuzzaman',
                          style: TextStyle(
                            fontSize: 40*_val,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        opacity: _val,
                      ),
                    );
                  },
                ),
              ),
              UserList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //  Navigator.of(context).pushNamed(MoreAnimation.routeName);
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => MoreAnimation()));
            //Navigator.pushNamed(context, MoreAnimation.routeName);
          },
          child: Icon(Icons.more),
        ),
      ),
    );
  }
}
