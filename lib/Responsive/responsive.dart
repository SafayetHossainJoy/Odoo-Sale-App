import 'package:flutter/material.dart';
import 'dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;

  ResponsiveLayout({
    required this.mobileBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileBody;
        } else {
          return mobileBody;
        }
      },
    );
  }
}
