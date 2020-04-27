import 'package:flutter/material.dart';
class ScreenTop extends StatelessWidget {
  final Widget cardChild;
  final Function onTap;
  final Color color;
  ScreenTop({this.onTap,this.cardChild,this.color});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.0,
        margin: EdgeInsets.all(7.0),
        child:cardChild,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(17.0)
        ),
      ),
    );
  }
}