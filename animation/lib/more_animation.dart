import 'package:flutter/material.dart';

class MoreAnimation extends StatefulWidget {
  static const routeName = '/MoreAnimation';

  @override
  _MoreAnimationState createState() => _MoreAnimationState();
}

class _MoreAnimationState extends State<MoreAnimation> {
  double value = 0;
  double _opacity = 1;
  Color color=Colors.red;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          margin: EdgeInsets.all(value),
          height: 500,
          width: 300,
          color: color,
          duration: Duration(seconds: 1),
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    value = 50;
                  });
                },
                child: Text('More Margin'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    value = 0;
                  });
                },
                child: Text('Less Margin'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                   color=Colors.green;
                  });
                },
                child: Text('Change Color '),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
                child: Opacity(
                  opacity: _opacity,
                  child: Text(
                    'Hide Me',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
