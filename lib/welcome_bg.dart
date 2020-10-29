import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
        Center(
        child: new Image.asset(
          'assets/images/welc_bg.png',
          width: size.width,
          height: size.height,
          fit: BoxFit.fill,
        ),
        ),
            child,
          ],
        )
    );
  }
}
