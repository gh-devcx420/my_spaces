import 'package:flutter/material.dart';

class UiHelper {
  EdgeInsets allPaddingVerySmall = const EdgeInsets.all(4);
  EdgeInsets allPaddingSmall = const EdgeInsets.all(8);
  EdgeInsets allPaddingMedium = const EdgeInsets.all(16);
  EdgeInsets allPaddingLarge = const EdgeInsets.all(32);
  EdgeInsets allPaddingVeryLarge = const EdgeInsets.all(64);

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

  verticalSpaceVerySmall() {
    return Container(
      height: 4,
    );
  }

  verticalSpaceSmall() {
    return Container(
      height: 8,
    );
  }

  verticalSpaceMedium() {
    return Container(
      height: 16,
    );
  }

  verticalSpaceLarge() {
    return Container(
      height: 32,
    );
  }

  verticalSpaceVeryLarge() {
    return Container(
      height: 64,
    );
  }

  horizontalSpaceVerySmall() {
    return Container(
      width: 4,
    );
  }

  horizontalSpaceSmall() {
    return Container(
      width: 8,
    );
  }

  horizontalSpaceMedium() {
    return Container(
      width: 16,
    );
  }

  horizontalSpaceLarge() {
    return Container(
      width: 32,
    );
  }

  horizontalSpaceVeryLarge() {
    return Container(
      width: 64,
    );
  }
}
