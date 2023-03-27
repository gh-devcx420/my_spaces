import 'package:flutter/material.dart';

class UiHelper {

  EdgeInsets paddingVerySmall = const EdgeInsets.all(4);
  EdgeInsets paddingSmall = const EdgeInsets.all(8);
  EdgeInsets paddingMedium = const EdgeInsets.all(16);
  EdgeInsets paddingLarge = const EdgeInsets.all(32);
  EdgeInsets paddingVeryLarge = const EdgeInsets.all(64);

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
