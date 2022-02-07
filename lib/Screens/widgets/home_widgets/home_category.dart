import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/pages/updates_page.dart';
import 'package:flutter_auth/Screens/widgets/home_widgets/category_widget.dart';
// import 'package:flutter_auth/Screens/stats_dashboard_screens/world_stat.dart';
import '../../../Screens/pages/wallet_page.dart';
import '../../../Screens/pages/precautions_page.dart';
import '../../../Screens/pages/symptoms_page.dart';
import '../../../Screens/pages/myths_page.dart';
import '../../../Screens/pages/virus_details_page.dart';

import '../../../Screens/pages/updates_page.dart';
import '../../../Screens/stats_dashboard_screens/world_stat.dart';

// ignore: must_be_immutable
class CategoryTab extends StatelessWidget {
  final imgPath, tabName, tabDesc, imgHeight, imgLeft, imgBottom;
  final Color color;
  final AutoSizeGroup titleGrp, descGrp;

  const CategoryTab(
      {this.imgPath,
      this.tabName,
      this.color,
      this.tabDesc,
      this.imgHeight = 150.0,
      this.imgLeft = 15.0,
      this.imgBottom = -8.0,
      this.titleGrp,
      this.descGrp});

  Function getPage(tabName, context) {
    switch (tabName) {
      case ("Symptoms"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                SymptomsScreen(color: color, imgPath: imgPath)));
      case ("Precautions"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                PrecautionsScreen(color: color, imgPath: imgPath)));
      case ("Myths"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MythsScreen(color: color, imgPath: imgPath)));
      case ("Virus"):
        return () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                VirusDetailsScreen(color: color, imgPath: imgPath)));
      case ("Wallet"):
        return () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WalletPage()));
      case ("Statistics"):
        return () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WorldStatScreen()));
    }
    return () {};
  }

  @override
  Widget build(BuildContext context) {
    return Category_build(imgPath, context, tabName, tabDesc, color, titleGrp, descGrp,
        imgLeft, imgBottom, imgHeight, imgPath, getPage);
  }
}
