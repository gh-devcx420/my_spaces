import 'package:flutter/material.dart';
import 'package:myspaces/utils/ui_helper.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {


  UiHelper ui = UiHelper();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: uiPaddingMedium,
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 50,
                color: Colors.green,
              ),
            ),
            ui.verticalSpaceMedium(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.green,
                  ),
                ),
                ui.horizontalSpaceMedium(),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.width,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
