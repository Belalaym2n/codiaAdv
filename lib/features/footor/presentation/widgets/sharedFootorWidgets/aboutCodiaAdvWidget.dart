import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../request_callback/presentation/pages/requet_callback.dart';
import 'followUsWidget.dart';

Widget buildAboutCodiaAdv(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "CodiaAdv",
        style: TextStyle(
          fontSize: 26,
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
      const SizedBox(height: 6),
      Container(
        height: 3,
        width: 60,
        decoration: BoxDecoration(
          color: Color(0xFFdf0a0a), // لون جذاب متناسق مع الزر
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      const SizedBox(height: 20),
      Text(
        "We believe creativity and innovation are crucial to\nachieving your marketing goals. Our mission is to \nconvert your ideas into impactful digital success.",
        style: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Colors.grey.shade300,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
      ),
      const SizedBox(height: 24),
      Row(
        children: [
          Icon(Icons.phone, color: Color(0xFFdf0a0a), size: 20),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              navigateToUrl(
                  "https://api.whatsapp.com/send/?phone=201022491465&text=Hi%2C+I%27m+interested+in+mobile+app+development+services.+Could+you+please+share+more+about+your+offerings+and+how+we+can+work+together%3F&type=phone_number&app_absent=0");
            },
            child: Text(
              "+201022491465",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.access_time, color: Color(0xFFdf0a0a), size: 20),
          const SizedBox(width: 10),
          Text(
            "Sun - Thu | 10:00 AM - 6:00 PM",
            style: TextStyle(color: Colors.grey.shade300, fontSize: 16),
          ),
          const SizedBox(width: 12),
          Text(
            "Friday: ",
            style: TextStyle(color: Colors.grey.shade300, fontSize: 16),
          ),
          Text(
            "Closed",
            style: TextStyle(
              color: Color(0xFFdf0a0a),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const SizedBox(height: 28),
      SizedBox(
        width: 250,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RequestCallback(),));
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
              fontSize: 18,
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