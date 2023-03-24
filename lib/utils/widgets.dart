import 'package:flutter/material.dart';
import 'package:myspaces/utils/constants.dart';
import 'package:myspaces/utils/ui_helper.dart';

//1. Header Widget.
class MySpacesHeader extends StatelessWidget {
  const MySpacesHeader({
    super.key,
    required this.headerTitle,
    required this.ui,
    // required this.alertTitle,
    // required this.alertBody1,
    // required this.alertBody2,
  });

  final String headerTitle;
  final UiHelper ui;

  // final String alertTitle;
  // final String alertBody1;
  // final String alertBody2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ui.horizontalSpaceMedium(),
        Text(
          headerTitle,
          style: ui.heading1Style,
        ),
        const Spacer(),
        // InkWell(
        //   onTap: () {
        //     showDialog(
        //       context: context,
        //       builder: (_) => AlertDialog(
        //         title: Text(
        //           alertTitle,
        //           style: ui.Heading2Style,
        //         ),
        //         content: SingleChildScrollView(
        //           child: ListBody(
        //             children: <Widget>[
        //               Text(
        //                 alertBody1,
        //                 style: ui.Body3Style,
        //               ),
        //               ui.verticalSpaceSmall(),
        //               Text(
        //                 alertBody2,
        //                 style: ui.Body3Style,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        //   child: const Icon(
        //     Icons.info_outline,
        //     size: 25,
        //     color: kSecondaryColour,
        //   ),
        // ),
        //ui.horizontalSpaceSmall(),
      ],
    );
  }
}

//2. Card Widget for My Spaces.
class MySpacesCard extends StatelessWidget {
  const MySpacesCard({
    super.key,
    required this.ui,
    required this.cardName,
    required this.cardIcon,
  });

  final UiHelper ui;
  final Image cardIcon;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: ui.paddingSmall,
        height: 180,
        decoration: BoxDecoration(
          color: kSecondaryColour.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ui.verticalSpaceSmall(),
            Text(
              cardName,
              style: ui.heading2Style,
            ),
            ui.verticalSpaceMedium(),
            Expanded(
              child: Container(
                //color: Colors.yellowAccent,
                child: cardIcon,
              ),
            ),
            ui.verticalSpaceMedium(),
          ],
        ));
  }
}

//3. Settings Tile
class MySpacesSettingsTile extends StatelessWidget {
  const MySpacesSettingsTile({
    super.key,
    required this.ui,
    required this.icon,
    required this.text,
  });

  final UiHelper ui;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: ui.paddingVerySmall,
      decoration: BoxDecoration(
        color: kSecondaryColour.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              //color: Colors.pink,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            width: 50,
            child: Icon(
              icon,
              color: kSecondaryColour,
              size: 50,
            ),
          ),
          ui.horizontalSpaceMedium(),
          Text(
            text,
            style: ui.heading1Style,
          )
        ],
      ),
    );
  }
}

//4. Card Widget for DashBoard.
class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.ui,
    required this.cardName,
  });

  final UiHelper ui;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ui.paddingMedium,
      height: 180,
      decoration: BoxDecoration(
        color: kSecondaryColour.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardName,
                style: ui.heading2Style,
              ),
              const Icon(
                Icons.more_vert,
                color: kSecondaryColour,
              )
            ],
          ),
        ],
      ),
    );
  }
}
