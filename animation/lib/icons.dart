import 'package:flutter/material.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({
    Key key,
  }) : super(key: key);

  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;
  bool isFav = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    var _carve =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_carve);

    _sizeAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 60, end: 100), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 100, end: 60), weight: 50),
    ]).animate(_carve);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }

      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AnimatedBuilder(
          builder: (context, child) {
            return InkWell(
              onTap: () {
                isFav ? _controller.reverse() : _controller.forward();
              },
              child: Icon(
                Icons.favorite,
                size: _sizeAnimation.value,
                color: _colorAnimation.value,
              ),
            );
          },
          animation: _controller,
        ),
      ),
    );
  }
}
