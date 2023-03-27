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
        Text(headerTitle,
            style: ui.heading1Style
                .copyWith(color: Theme.of(context).primaryColor)),
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
    required this.onCardTap,
  });

  final UiHelper ui;
  final Image cardIcon;
  final String cardName;
  final Function() onCardTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      child: Container(
          padding: ui.paddingSmall,
          height: 180,
          decoration: BoxDecoration(
            //color: kSecondaryColour.withOpacity(0.1),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(kRadiusValue),
          ),
          child: Column(
            children: [
              ui.verticalSpaceSmall(),
              Text(
                cardName,
                style: ui.heading2Style
                    .copyWith(color: Theme.of(context).primaryColor),
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
          )),
    );
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
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(kRadiusValue),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              //color: Colors.pink,
              borderRadius: BorderRadius.circular(kRadiusValue),
            ),
            height: 50,
            width: 50,
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 40,
            ),
          ),
          ui.horizontalSpaceMedium(),
          Text(
            text,
            style: ui.heading1Style
                .copyWith(color: Theme.of(context).primaryColor),
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
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(kRadiusValue),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardName,
                style: ui.heading2Style
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//5. Search Bar Widget.
class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.ui,
  });

  final UiHelper ui;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red.shade50,
      child: Row(
        children: [
          //ui.horizontalSpaceSmall(),
          Expanded(
            child: Container(
              height: 50,
              padding: ui.paddingSmall,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadiusValue),
                color: Theme.of(context).primaryColor.withOpacity(0.2),
              ),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    padding: ui.paddingVerySmall,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadiusValue - 4),
                      color: kMySpacesWhite.withOpacity(0.8),
                    ),
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                      size: 28,
                    ),
                  ),
                  ui.horizontalSpaceSmall(),
                  Text(
                    "Search...",
                    style: ui.heading2Style.copyWith(
                      fontWeight: FontWeight.w500,
                      //color: kMySpacesWhite,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          //ui.horizontalSpaceSmall(),
        ],
      ),
    );
  }
}

//6. Sort button.
class SortButton extends StatelessWidget {
  const SortButton({
    super.key,
    required this.ui,
  });

  final UiHelper ui;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Text(
            "Sort  ",
            style: ui.heading3Style
                .copyWith(color: Theme.of(context).primaryColor, fontSize: 14),
          ),
          Icon(
            Icons.sort_sharp,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

//7.
class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.ui,
  });

  final UiHelper ui;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      padding: ui.paddingSmall,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(kRadiusValue),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kRadiusValue - 4),
              border: Border.all(
                width: 2,
                color: Theme.of(context).primaryColor.withOpacity(0.6),
              ),
            ),
          ),
          ui.horizontalSpaceMedium(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ui.verticalSpaceVerySmall(),
              Text(
                "Task Name",
                style: ui.heading2Style.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              ui.verticalSpaceSmall(),
              Text(
                "Task Description",
                style: ui.heading2Style.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              ui.verticalSpaceSmall(),
              Row(
                children: [
                  Text(
                    ' Date, ',
                    style: ui.heading3Style.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    ' Time',
                    style: ui.heading3Style.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  ui.horizontalSpaceSmall(),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ui.verticalSpaceVerySmall(),
              Icon(
                Icons.more_vert_outlined,
                size: 22,
                color: Theme.of(context).primaryColor,
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
