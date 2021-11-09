import 'package:acumen_task/src/content/constants/strings.dart';
import 'package:flutter/material.dart';

class MomentsView extends StatelessWidget {
  const MomentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppStrings.moments),
      ),
    );
  }
}
