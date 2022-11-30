import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futter_travel_app/core/constants/color_constants.dart';
import 'package:futter_travel_app/core/constants/dismention_constants.dart';
import 'package:futter_travel_app/core/constants/textstyle_constants.dart';

class ButtomWidget extends StatelessWidget {
  const ButtomWidget({Key? key, required this.title, this.ontap})
      : super(key: key);
  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyles.defaultStyle.bold.whiteTextColor,
        ),
      ),
    );
  }
}
