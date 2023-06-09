import 'package:flutter/material.dart';
import 'package:myspaces/utils/constants.dart';
import 'package:myspaces/utils/ui_helper.dart';

//Header widget.
class MSHeader extends StatelessWidget {
  const MSHeader({
    super.key,
    required this.headerTitle,
    required this.ui,
    required this.enableSearch,
    required this.onSearchButtonTap,
  });

  final String headerTitle;
  final UiHelper ui;
  final bool enableSearch;
  final Function() onSearchButtonTap;

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
            onTap: onSearchButtonTap,
            child: Container(
              padding: ui.allPaddingSmall,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadiusValue),
                color: Theme.of(context)
                    .primaryColor
                    .withOpacity(kCardTransparency),
              ),
              child: Icon(
                Icons.search_sharp,
                size: 22,
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
class MSCard extends StatelessWidget {
  const MSCard({
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
class MSSettingsTile extends StatelessWidget {
  const MSSettingsTile({
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
class MSDashboardCard extends StatelessWidget {
  const MSDashboardCard({
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
class MSSearchBar extends StatelessWidget {
  const MSSearchBar({
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
                      color: kMSWhite.withOpacity(0.8),
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
class MSSortButton extends StatelessWidget {
  const MSSortButton({
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

//Custom Button widget.
class MSTextButton extends StatelessWidget {
  const MSTextButton({
    Key? key,
    required this.ui,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonColour,
    required this.textColour,
    required this.buttonText,
    required this.onButtonTap,
  }) : super(key: key);

  final UiHelper ui;
  final double buttonHeight;
  final double buttonWidth;
  final Color buttonColour;
  final Color textColour;
  final String buttonText;
  final Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonTap,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        padding: ui.allPaddingVerySmall,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusValue),
          color: buttonColour,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: ui.heading3Style.copyWith(
              fontSize: 15,
              color: textColour,
            ),
          ),
        ),
      ),
    );
  }
}

//Custom Text Chip widget.
class MSTextChip extends StatelessWidget {
  const MSTextChip({
    Key? key,
    required this.ui,
    required this.chipText,
    required this.onTap,
    required this.enableBorder,
  }) : super(key: key);

  final UiHelper ui;
  final String chipText;
  final Function() onTap;
  final bool enableBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: ui.allPaddingSmall,
        margin: ui.allPaddingVerySmall,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusValue),
          border: Border.all(
            width: 2,
            color: enableBorder == true
                ? Theme.of(context).primaryColor.withOpacity(0.3)
                : Colors.transparent,
          ),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ui.horizontalSpaceSmall(),
            Text(
              chipText,
              style: ui.heading3Style.copyWith(
                fontSize: 14,
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

//Custom Icon Chip widget.
class MSIconChip extends StatelessWidget {
  const MSIconChip({
    Key? key,
    required this.ui,
    required this.chipIcon,
    required this.onTap,
    required this.enableChipBorder,
  }) : super(key: key);

  final UiHelper ui;
  final IconData chipIcon;
  final Function() onTap;
  final bool enableChipBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: ui.allPaddingSmall,
        margin: ui.allPaddingVerySmall,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusValue),
          border: enableChipBorder == true
              ? Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                )
              : Border.all(width: 2, color: Colors.transparent),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //ui.horizontalSpaceSmall(),
            Icon(
              chipIcon,
              size: 20,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
            //ui.horizontalSpaceSmall(),
          ],
        ),
      ),
    );
  }
}

//Custom Chip widget.
class MSIconTextChip extends StatelessWidget {
  const MSIconTextChip({
    Key? key,
    required this.ui,
    required this.chipTitle,
    required this.chipIcon,
    required this.enableChipBorder,
    required this.onTap,
  }) : super(key: key);

  final UiHelper ui;
  final String chipTitle;
  final IconData chipIcon;
  final bool enableChipBorder;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: ui.allPaddingSmall,
        margin: ui.allPaddingVerySmall,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusValue),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          border: enableChipBorder == true
              ? Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                )
              : Border.all(width: 2, color: Colors.transparent),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ui.horizontalSpaceVerySmall(),
            Icon(
              chipIcon,
              color: Theme.of(context).primaryColor.withOpacity(0.6),
              size: 20,
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

//Task Tile widget.
class MSTaskTile extends StatelessWidget {
  const MSTaskTile({
    super.key,
    required this.ui,
    required this.taskName,
    required this.taskNotes,
    required this.taskCategory,
    required this.onTileTap,
    required this.onTileLongTap,
  });

  final UiHelper ui;
  final String taskName;
  final String taskNotes;
  final Category? taskCategory;
  final Function() onTileTap;
  final Function() onTileLongTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTileTap,
      onLongPress: onTileLongTap,
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
                  taskNotes,
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

class MSTasksHeadingLabel extends StatelessWidget {
  const MSTasksHeadingLabel({
    Key? key,
    required this.ui,
    required this.name,
  }) : super(key: key);

  final UiHelper ui;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ui.horizontalSpaceSmall(),
        Text(
          name,
          style: ui.msTasksHeadingLabelStyle.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
        ui.horizontalSpaceMedium(),
      ],
    );
  }
}

//Custom Floating Action Button widget.
class MSFAB extends StatelessWidget {
  const MSFAB({
    super.key,
    required this.icon,
    required this.onTap,
    required this.ui,
  });

  final IconData icon;
  final Function() onTap;
  final UiHelper ui;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        margin: ui.allPaddingMedium,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusValue),
          color: Theme.of(context).primaryColor.withOpacity(1),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: kMSWhite,
          ),
        ),
      ),
    );
  }
}

//Custom Text Field widget.
class MSTextField extends StatelessWidget {
  const MSTextField({
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
      style: ui.msTasksTextFieldStyle.copyWith(
        color: Theme.of(context).primaryColor.withOpacity(0.6),
      ),
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
      ),
    );
  }
}

//Task Settings chip.
class MySpacesTextButton extends StatelessWidget {
  const MySpacesTextButton({
    Key? key,
    required this.ui,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonColour,
    required this.textColour,
    required this.buttonText,
    required this.onButtonTap,
  }) : super(key: key);

  final UiHelper ui;
  final double buttonHeight;
  final double buttonWidth;
  final Color buttonColour;
  final Color textColour;
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
          color: buttonColour,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: ui.heading3Style.copyWith(
              fontSize: 15,
              color: textColour,
            ),
          ),
        ),
      ),
    );
  }
}
