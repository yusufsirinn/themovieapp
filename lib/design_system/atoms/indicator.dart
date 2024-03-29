import 'package:flutter/material.dart';

import '../../core/core.dart';

class Indicator extends StatelessWidget {
  final Color? color;
  const Indicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: AppDimension.xxl.size,
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}
