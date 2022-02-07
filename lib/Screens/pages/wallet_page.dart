// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_auth/Screens/widgets/home_widgets/category_widget.dart';

class WalletPage extends StatefulWidget {
  final imgHeader = "assets/wallet.png";
  final Color color = Colors.blue;

  const WalletPage() : super();

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final imgPath;
  final cardColor = Colors.indigo[400];
  final tabName;
  final tabDesc;
  final imgHeight;
  final imgLeft;
  final imgBottom;
  final AutoSizeGroup titleGrp, descGrp;

  _WalletPageState(
      {this.imgPath = "assets/covid_test.png",
      this.tabName = "Covid Test",
      this.tabDesc = "CoronaVirus Test: Negative",
      this.imgHeight = 110.0,
      this.imgLeft = 10.0,
      this.imgBottom = 10.0,
      this.titleGrp,
      this.descGrp});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: widget.color,
              size: 28,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image container
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
              ),
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                    color: widget.color.withOpacity(0.2)),
                width: MediaQuery.of(context).size.width,
                child: LayoutBuilder(
                  builder: (ctx, constraint) => Stack(
                    children: <Widget>[
                      //Name
                      Positioned(
                        top: constraint.maxHeight * 0.4,
                        left: 30,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: constraint.maxWidth * 0.55,
                            child: AutoSizeText(
                              "My Wallet",
                              style: TextStyle(
                                color: widget.color,
                                fontFamily: "Montserrat",
                                fontSize: 31,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 1,
                              maxFontSize: 31,
                              stepGranularity: 1,
                            ),
                          ),
                        ),
                      ),
                      //Image
                      Positioned.fill(
                        bottom: 0.0,
                        right: -6.0,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: LayoutBuilder(
                            builder: (ctx, constraint) => Hero(
                              tag: widget.imgHeader,
                              child: Image(
                                image: AssetImage(widget.imgHeader),
                                height: constraint.maxHeight * 0.90,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListView.builder(
                itemCount: 4,
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
