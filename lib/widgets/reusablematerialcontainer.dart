import 'package:flutter/material.dart';

class ReusableMaterialContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  const ReusableMaterialContainer({
    @required this.subtitle,
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.white,
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(30),
          height: 100,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(color: Color(0xFFB7C2CD)),
              ),
              Text(
                subtitle,
                textAlign: TextAlign.start,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
