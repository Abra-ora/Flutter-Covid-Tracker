import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget Category_build(tag, BuildContext context, tabName, tabDesc, color, titleGrp,
    descGrp, imgLeft, imgBottom, imgHeight, imgPath, [Function function(dynmic, dynamic)]){
  return InkWell(
    onTap: function(tabName, context),
    child: Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      height: 142,
      child: Stack(
        children: <Widget>[
          //Title Container
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(left: 150, right: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color.withOpacity(0.13),
                ),
                height: 125,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AutoSizeText(
                      "$tabName",
                      style: TextStyle(
                        color: color,
                        fontFamily: "Montserrat",
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                      stepGranularity: 1,
                      maxFontSize: 23,
                      maxLines: 1,
                      group: titleGrp,
                    ),
                    AutoSizeText(
                      "$tabDesc",
                      style: TextStyle(
                        color: color,
                        fontFamily: "Montserrat",
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                      stepGranularity: 1,
                      maxFontSize: 19,
                      maxLines: 3,
                      group: descGrp,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            left: imgLeft,
            bottom: imgBottom,
            child: Container(
              height: imgHeight,
              child:
                  Hero(tag: tag, child: Image(image: AssetImage(imgPath))),
            ),
          ),
        ],
      ),
    ),
  );
}
