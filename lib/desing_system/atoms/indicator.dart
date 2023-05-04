import 'package:flutter/material.dart';

import '../../core/core.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: AppDimension.xxl.size,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
