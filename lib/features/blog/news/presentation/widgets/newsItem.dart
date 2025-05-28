import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({super.key});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 550,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصور
          Expanded( child: buildImage(
          )),
          const SizedBox(width: 24),
          // حول التطبيق
          Expanded(flex: 1, child: buildNewsDescription()),
        ],
      ),
    );

  }

  buildImage(){
    return Container(
         decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
    height: 550,
    child:Image.asset(

      height: 550,


        fit: BoxFit.fill,
        "assets/images/belalWithMo.jpg"));

  }

 Widget buildNewsDescription(){
   return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFfbe1e1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'About this blog',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF252c49),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          Text(
            "Mas Facility Management",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              height: 1.6, // عشان يعطي راحة بين السطور
            ),
          ),
          const SizedBox(height: 16),

          Text(
            "We design and develop elegant, high-performance mobile apps that elevate your business. "
                "Whether it's a logistics platform or a service booking system, we turn ideas into exceptional user experiences.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              height: 1.6, // عشان يعطي راحة بين السطور
            ),
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              Icon(Icons.facebook, size: 28, color: Colors.black87), // Amazon
              const SizedBox(width: 16),
              Icon(Icons.facebook, size: 28, color: Colors.green), // Play Store
              const SizedBox(width: 16),
              Icon(Icons.apple, size: 28, color: Colors.black), // App Store
            ],
          ),
        ],
      ),
    );
  }
}
