import 'package:flutter/material.dart';

double width(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.width * ratio;
}

double height(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.height * ratio;
}

EdgeInsetsGeometry commonPaddingHorizental(BuildContext context,
    {double virtical = 0}) {
  return EdgeInsets.symmetric(
    horizontal: width(
      context,
      0.03,
    ),
    vertical: virtical,
  );
}


//forTablet
bool isTablet(BuildContext context) {
  var shortestSide = MediaQuery.of(context).size.shortestSide;

  if (shortestSide < 600) {
    return false;
  } else {
    return true;
  }
}

class SmallPadding extends StatelessWidget {
  final bool horizental;
  const SmallPadding({Key? key, this.horizental = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: horizental ? 0 : 5,
      width: horizental ? 5 : 0,
    );
  }
}

class MediumPadding extends StatelessWidget {
  final bool horizental;
  const MediumPadding({Key? key, this.horizental = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: horizental ? 0 : 10,
      width: horizental ? 10 : 0,
    );
  }
}

class BigPadding extends StatelessWidget {
  final bool horizental;
  const BigPadding({Key? key, this.horizental = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: horizental ? 0 : 15,
      width: horizental ? 10 : 15,
    );
  }
}
