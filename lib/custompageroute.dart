import 'package:flutter/cupertino.dart';

class UpToDownPageRoute extends PageRouteBuilder {
  final Widget page;

  UpToDownPageRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration(milliseconds: 1400),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = Offset(0.0, -1.0); // Top
      final end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
