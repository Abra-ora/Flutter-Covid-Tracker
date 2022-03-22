
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_auth/Screens/widgets/home_widgets/category_widget.dart';

class Contacts extends StatefulWidget {
  const Contacts() : super();
    final Color color = Colors.blue;

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

   final imgPath;
  final cardColor = Colors.red[700];
  final tabName;
  final tabDesc;
  final imgHeight;
  final imgLeft;
  final imgBottom;
  final AutoSizeGroup titleGrp, descGrp;
  _ContactsState(
      {this.imgPath = "assets/person.png",
      this.tabName = "Username",
      this.tabDesc = "email@email.com:  Positiv",
      this.imgHeight = 110.0,
      this.imgLeft = 10.0,
      this.imgBottom = 10.0,
      this.titleGrp,
      this.descGrp});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: widget.color,
              size: 28,
            )),
              title: AutoSizeText(
          "Tracked Contacts",
          style: TextStyle(
            fontSize: 22,
            fontFamily: "Montsecontacts_pagerrat",
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          minFontSize: 14,
          stepGranularity: 2,
          maxLines: 1,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Category_build(
                      index,
                      context,
                      tabName,
                      tabDesc,
                      cardColor,
                      titleGrp,
                      descGrp,
                      imgLeft,
                      imgBottom,
                      imgHeight,
                      imgPath, (tabName, context) {
                    return null;
                  });
                }),
            // SingleChildScrollView(/on Card Grid
          ],
        ),
      ),
    );
  }
}