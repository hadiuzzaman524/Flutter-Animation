import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/DetailsScreen';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> getmsg = ModalRoute.of(context).settings.arguments;

    String image = getmsg[1];
    String title = getmsg[0];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                child: Hero(
                  tag: image,
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    child: Center(
                  child: InkWell(
                    onTap: (){

                    },
                    child: Icon(
                      Icons.favorite,
                      size: 69,
                      color: Colors.grey,
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
