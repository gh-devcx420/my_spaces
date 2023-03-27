import 'package:flutter/material.dart';
import 'package:myspaces/screens/Tasks/tasks_home.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/ui_helper.dart';

class MySpacesPage extends StatefulWidget {
  const MySpacesPage({Key? key}) : super(key: key);

  @override
  State<MySpacesPage> createState() => _MySpacesPageState();
}

class _MySpacesPageState extends State<MySpacesPage> {
  UiHelper ui = UiHelper();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: ui.paddingSmall,
        //color: Colors.white.withOpacity(0.5),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            MySpacesHeader(
              headerTitle: 'My Spaces',
              ui: ui,
              // alertTitle: 'What is My Spaces?',
              // alertBody1:
              //     'My Spaces is a productivity app, that hosts a variety of functions.',
              // alertBody2:
              //     'This is the My Spaces screen where you can find \'Modules\' that perform different functions.',
            ),
            ui.verticalSpaceMedium(),
            Row(
              children: [
                Expanded(
                  child: MySpacesCard(
                    ui: ui,
                    cardName: "Tasks",
                    cardIcon: const Image(
                      image: AssetImage('assets/images/tasklist.png'),
                    ),
                    onCardTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TasksHome(ui:ui) ),);
                    },
                  ),
                ),
                ui.horizontalSpaceSmall(),
                Expanded(
                  child: MySpacesCard(
                    ui: ui,
                    cardName: "Journal",
                    cardIcon: const Image(
                      image: AssetImage('assets/images/journal.png'),
                    ),
                    onCardTap: () {},
                  ),
                ),
              ],
            ),
            ui.verticalSpaceSmall(),
            Row(
              children: [
                Expanded(
                  child: MySpacesCard(
                    ui: ui,
                    cardName: "BMI",
                    cardIcon: const Image(
                      image: AssetImage('assets/images/bmi.png'),
                    ),
                    onCardTap: () {},
                  ),
                ),
                ui.horizontalSpaceSmall(),
                Expanded(
                  child: MySpacesCard(
                    ui: ui,
                    cardName: "Links",
                    cardIcon: const Image(
                      image: AssetImage('assets/images/link.png'),
                    ),
                    onCardTap: () {},
                  ),
                ),
              ],
            ),
            ui.verticalSpaceSmall(),
            Row(
              children: [
                Expanded(
                  child: MySpacesCard(
                    ui: ui,
                    cardName: "Medications",
                    cardIcon: const Image(
                      image: AssetImage('assets/images/medications.png'),
                    ),
                    onCardTap: () {},
                  ),
                ),
                ui.horizontalSpaceSmall(),
                Expanded(
                  child: MySpacesCard(
                    ui: ui,
                    cardName: "Chat",
                    cardIcon: const Image(
                      image: AssetImage('assets/images/chat.png'),
                    ),
                    onCardTap: () {},
                  ),
                ),
              ],
            ),
            ui.verticalSpaceSmall(),
          ],
        ),
      ),
    );
  }
}
