import 'package:flutter/material.dart';

const EdgeInsets uiPaddingVerySmall = EdgeInsets.all(4);
const EdgeInsets uiPaddingSmall = EdgeInsets.all(8);
const EdgeInsets uiPaddingMedium = EdgeInsets.all(16);
const EdgeInsets uiPaddingLarge = EdgeInsets.all(32);
const EdgeInsets uiPaddingVeryLarge = EdgeInsets.all(64);

class UiHelper {
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
