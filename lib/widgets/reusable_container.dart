import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final String titleName;
  final String subtitle;
  const ReusableContainer({Key key, this.titleName, @required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            titleName,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Colors.black, fontSize: 20),
          ),
          Text(
            subtitle,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Color(0xFFB7C2CD), fontSize: 15),
          ),
        ],
      ),
    );
  }
}
