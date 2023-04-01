import 'package:flutter/material.dart';
import 'package:myspaces/utils/constants.dart';

class UiHelper {
  //Padding sizes for all 4 sides. (EdgeInsets.all)
  EdgeInsets allPaddingVerySmall = const EdgeInsets.all(4);
  EdgeInsets allPaddingSmall = const EdgeInsets.all(8);
  EdgeInsets allPaddingMedium = const EdgeInsets.all(16);
  EdgeInsets allPaddingLarge = const EdgeInsets.all(32);
  EdgeInsets allPaddingVeryLarge = const EdgeInsets.all(64);

  //Padding sizes for only 3 sides except the bottom side. (EdgeInsets.only(LTR))
  EdgeInsets onlyPaddingVerySmall = const EdgeInsets.only(
    top: 4,
    left: 4,
    right: 4,
  );
  EdgeInsets onlyPaddingVeryMedium = const EdgeInsets.only(
    top: 8,
    left: 8,
    right: 8,
  );
  EdgeInsets onlyPaddingVeryLarge = const EdgeInsets.only(
    top: 16,
    left: 16,
    right: 16,
  );

  //General Text Styles used through out the app.
  TextStyle heading1Style = const TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );
  TextStyle heading2Style = const TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
  TextStyle heading3Style = const TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 12,
    fontWeight: FontWeight.w800,
  );
  TextStyle body1Style = const TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 28,
    fontWeight: FontWeight.w500,
  );
  TextStyle body2Style = const TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  TextStyle body3Style = const TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  //Specific Text Styles used in respective screens.
  TextStyle msTasksHeadingLabelStyle = const TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 15,
    fontWeight: FontWeight.w800,
  );

  //Vertical or Horizontal Gaps.
  verticalSpaceVerySmall() {
    return const SizedBox(
      height: 4,
    );
  }

  verticalSpaceSmall() {
    return const SizedBox(
      height: 8,
    );
  }

  verticalSpaceMedium() {
    return const SizedBox(
      height: 16,
    );
  }

  verticalSpaceLarge() {
    return const SizedBox(
      height: 32,
    );
  }

  verticalSpaceVeryLarge() {
    return const SizedBox(
      height: 64,
    );
  }

  horizontalSpaceVerySmall() {
    return const SizedBox(
      width: 4,
    );
  }

  horizontalSpaceSmall() {
    return const SizedBox(
      width: 8,
    );
  }

  horizontalSpaceMedium() {
    return const SizedBox(
      width: 16,
    );
  }

  horizontalSpaceLarge() {
    return const SizedBox(
      width: 32,
    );
  }

  horizontalSpaceVeryLarge() {
    return const SizedBox(
      width: 64,
    );
  }
}
