import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../request_callback/presentation/pages/requet_callback.dart';
import 'followUsWidget.dart';

Widget buildAboutCodiaAdv(
    bool isDesktop,
    BuildContext context, double width, double height) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "CodiaAdv",
        style: TextStyle(
          fontSize: isDesktop?width * 0.0170:width*0.02, // 26 / 1525
          fontWeight: FontWeight.w900,
          color: Colors.white,
          letterSpacing: 1.2,
          shadows: [
            Shadow(
              blurRadius: 6,
              color: Colors.black26,
              offset: Offset(0, 2),
            ),
          ],
        ),
      ),
      SizedBox(height: height * 0.0080), // 6 / 745
      Container(
        height: height * 0.0040, // 3 / 745
        width: width * 0.0393,   // 60 / 1525
        decoration: BoxDecoration(
          color: Color(0xFFdf0a0a),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      SizedBox(height: height * 0.0268), // 20 / 745
      Text(
        "We believe creativity and innovation are crucial to\n"
            "achieving your marketing goals. Our mission is to \n"
            "convert your ideas into impactful digital success.",
        style: TextStyle(
          fontSize: isDesktop? width * 0.0105:0.015*width, // 16 / 1525
          height: 1.6,
          color: Colors.grey.shade300,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
      ),
      SizedBox(height: height * 0.0322), // 24 / 745
      Row(
        children: [
          Icon(Icons.phone, color: Color(0xFFdf0a0a), size: width * 0.0131), // 20 / 1525
          SizedBox(width: width * 0.0065), // 10 / 1525
          InkWell(
            onTap: () {
              navigateToUrl(
                  "https://api.whatsapp.com/send/?phone=201022491465&text=Hi%2C+I%27m+interested+in+mobile+app+development+services.+Could+you+please+share+more+about+your+offerings+and+how+we+can+work+together%3F&type=phone_number&app_absent=0");
            },
            child: Text(
              "+201022491465",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize:  isDesktop? width * 0.0105:width*0.015,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: height * 0.0161), // 12 / 745
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.access_time, color: Color(0xFFdf0a0a), size: width * 0.0131),
          SizedBox(width: width * 0.0065),
          Text(
            "Sun - Thu | 10:00 AM - 6:00 PM",
            style: TextStyle(color: Colors.grey.shade300, fontSize: isDesktop?
            width * 0.0105:width*0.015),
          ),
          SizedBox(width: width * 0.0078), // 12 / 1525
          Text(
            "Friday: ",
            style: TextStyle(color: Colors.grey.shade300, fontSize:
            isDesktop?
            width * 0.0105:width*0.015),
          ),
          Text(
            "Closed",
            style: TextStyle(
              color: Color(0xFFdf0a0a),
              fontSize: isDesktop?
              width * 0.0105:width*0.015,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      SizedBox(height: height * 0.0376), // 28 / 745
      SizedBox(
        width: width * 0.1939, // 250 / 1525
        height: height * 0.0671, // 50 / 745
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RequestCallback()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFdf0a0a),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 6,
            shadowColor: Color(0xFFb30f0f),
          ),
          child: Text(
            "Request Callback",
            style: TextStyle(
              fontSize: width * 0.012, // 18 / 1525
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
        ),
      ),
    ],
  );
}
