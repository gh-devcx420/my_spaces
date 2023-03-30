import 'package:flutter/material.dart';
import 'package:myspaces/utils/constants.dart';
import 'package:myspaces/utils/ui_helper.dart';

//Header widget.
class MySpacesHeader extends StatelessWidget {
  const MySpacesHeader(
      {super.key,
      required this.headerTitle,
      required this.ui,
      required this.enableSearch});

  final String headerTitle;
  final UiHelper ui;
  final bool enableSearch;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ui.horizontalSpaceMedium(),
        Text(
          headerTitle,
          style: ui.heading1Style.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
        const Spacer(),
        if (enableSearch == true)
          InkWell(
            onTap: () {},
            child: Container(
              height: 35,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadiusValue),
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: Icon(
                Icons.search_sharp,
                size: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        else
          Container(),
        ui.horizontalSpaceSmall(),
      ],
    );
  }
}

//Card widget for My Spaces.
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
          padding: ui.allPaddingSmall,
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

//Settings Tile widget.
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
      padding: ui.allPaddingVerySmall,
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
          ui.horizontalSpaceSmall(),
          Text(
            text,
            style: ui.heading2Style
                .copyWith(color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}

//Card widget for DashBoard.
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
      padding: ui.allPaddingMedium,
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

//Search Bar widget.
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
              padding: ui.allPaddingSmall,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadiusValue),
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    padding: ui.allPaddingVerySmall,
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

//Sort button widget.
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

// Custom Button widget.
class MySpacesTextButton extends StatelessWidget {
  const MySpacesTextButton({
    Key? key,
    required this.ui,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonColour,
    required this.buttonText,
    required this.onButtonTap,
  }) : super(key: key);

  final UiHelper ui;
  final double buttonHeight;
  final double buttonWidth;
  final Color buttonColour;
  final String buttonText;
  final Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonTap,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusValue),
          border: Border.all(
            width: 2,
            color: Theme.of(context).primaryColor.withOpacity(0.3),
          ),
          color: buttonColour,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: ui.heading3Style.copyWith(
              fontSize: 15,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom Chip widget.
class MySpacesChip extends StatelessWidget {
  const MySpacesChip({
    Key? key,
    required this.ui,
    required this.chipTitle,
    required this.chipIcon,
    required this.chipBorderColour,
    required this.onChipTap,
  }) : super(key: key);

  final UiHelper ui;
  final String chipTitle;
  final IconData chipIcon;
  final Color chipBorderColour;
  final Function() onChipTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChipTap,
      child: Container(
        padding: ui.allPaddingSmall,
        margin: ui.allPaddingVerySmall,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusValue - 2),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          border: Border.all(
            width: 2,
            color: chipBorderColour,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              chipIcon,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
              size: 15,
            ),
            ui.horizontalSpaceSmall(),
            Text(
              chipTitle,
              style: ui.heading3Style.copyWith(
                fontSize: 14,
                color: Theme.of(context).primaryColor.withOpacity(0.6),
              ),
            ),
            ui.horizontalSpaceVerySmall(),
          ],
        ),
      ),
    );
  }
}

// Custom Priority TextIcon widget.
class PriorityTextIcon extends StatelessWidget {
  const PriorityTextIcon({
    Key? key,
    required this.ui,
    required this.iconText,
    required this.onTap,
    required this.borderColour,
  }) : super(key: key);

  final UiHelper ui;
  final String iconText;
  final Function() onTap;
  final Color borderColour;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        padding: ui.allPaddingVerySmall,
        margin: ui.allPaddingVerySmall,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusValue),
          border: Border.all(
            width: 2,
            color: borderColour,
          ),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        child: Row(
          children: [
            ui.horizontalSpaceSmall(),
            Text(
              iconText,
              style: ui.heading3Style.copyWith(
                fontSize: 15,
                color: Theme.of(context).primaryColor.withOpacity(0.6),
              ),
            ),
            ui.horizontalSpaceSmall(),
          ],
        ),
      ),
    );
  }
}

//Task Tile widget.
class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.ui,
    required this.taskName,
    required this.taskDescription,
    required this.taskCategory,
    required this.onTileTap,
  });

  final UiHelper ui;
  final String taskName;
  final String taskDescription;
  final CategoryChips taskCategory;
  final Function() onTileTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTileTap,
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        padding: ui.allPaddingSmall,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(kRadiusValue),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 5,
              decoration: BoxDecoration(
                // color: priorityColour,
                color: Colors.red.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(kRadiusValue),
                  bottomLeft: Radius.circular(kRadiusValue),
                ),
              ),
            ),
            ui.horizontalSpaceMedium(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ui.verticalSpaceVerySmall(),
                Text(
                  taskName,
                  style: ui.heading2Style.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                ui.verticalSpaceSmall(),
                Text(
                  taskDescription,
                  style: ui.heading2Style.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  taskCategory.toString(),
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
                Row(
                  children: [
                    Icon(
                      Icons.more_vert_outlined,
                      size: 22,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                //const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TasksInputFieldHeading extends StatelessWidget {
  const TasksInputFieldHeading({Key? key,
    required this.ui,
    required this.name,
  }) : super(key: key);

  final UiHelper ui;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ui.horizontalSpaceMedium(),
        Text(
          name,
          style: ui.heading3Style.copyWith(
            fontSize: 15,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}


//Custom Floating Action Button widget.
class MySpacesFAB extends StatelessWidget {
  const MySpacesFAB({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusValue),
          color: Theme.of(context).primaryColor.withOpacity(1),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            size: 30,
            color: kMySpacesWhite,
          ),
        ),
      ),
    );
  }
}

//Custom Text Field widget.
class MySpacesTextField extends StatelessWidget {
  const MySpacesTextField({
    Key? key,
    required this.ui,
    required this.prefixIcon,
    required this.taskController,
  }) : super(key: key);

  final UiHelper ui;
  final IconData prefixIcon;
  final taskController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: taskController,
      cursorHeight: 22,
      cursorColor: Theme.of(context).primaryColor.withOpacity(0.1),
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Theme.of(context).primaryColor.withOpacity(0.6),
        ),
        filled: true,
        fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusValue),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(kRadiusValue),
        //   borderSide: BorderSide(
        //     color: Theme.of(context).primaryColor.withOpacity(0.3),
        //     width: 2.0,
        //   ),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(kRadiusValue),
        //   borderSide: BorderSide(
        //     color: Theme.of(context).primaryColor,
        //     width: 2.0,
        //   ),
        // ),
      ),
    );
  }
}

// Date Display widget.
class SelectedDateTimeDisplay extends StatelessWidget {
  const SelectedDateTimeDisplay({Key? key,
  required this.ui,
  }) : super(key: key);

  final UiHelper ui;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: ui.allPaddingVerySmall,
      margin: ui.allPaddingVerySmall,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kRadiusValue),
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
    );
  }
}

