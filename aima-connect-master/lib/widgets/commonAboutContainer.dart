import 'package:flutter/material.dart';

import '../utils/constants.dart';


Widget commonAboutContainer(String s1, s2, s3, image, bool imageLeft) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: w! / 14, vertical: 30),
    child: Row(
      children: [
        imageLeft
            ? Expanded(
            child: Container(
              height: 520,
              decoration: BoxDecoration(

                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.contain),
              ),
            ))
            : Container(),
        Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment:
              imageLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  s1.toUpperCase(),
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  s2,
                  textAlign: imageLeft ? TextAlign.right : TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: w! / 30,
                      fontWeight: FontWeight.bold,
                      height: 1.3),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  s3,
                  textAlign: imageLeft ? TextAlign.right : TextAlign.left,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16.0),
                ),

              ],
            )),
        !imageLeft
            ? Expanded(
            child: Container(
              height: 520,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.contain),
              ),
            ))
            : Container()
      ],
    ),
  );
}



Widget commonMobileContainer(String s1, s2, s3, image) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: w! / 14, vertical: 30),
    child: Column(
      children: [

        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.contain),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Text(
            s1.toUpperCase(),
            style: TextStyle(color: Colors.grey.shade400, fontSize: 16.0),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          s2,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontSize: w! / 16,
              fontWeight: FontWeight.bold,
              height: 1.3),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          s3,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade400, fontSize: 16.0),
        ),

      ],
    ),
  );
}