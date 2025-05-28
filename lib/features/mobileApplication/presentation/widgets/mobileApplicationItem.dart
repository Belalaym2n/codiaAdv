import 'package:codia_adv/config/utils/appImages.dart';
import 'package:codia_adv/features/homePage/widgets/header.dart';
import 'package:flutter/material.dart';

class MobileApplicationItem extends StatefulWidget {
  const MobileApplicationItem({super.key});

  @override
  State<MobileApplicationItem> createState() => _MobileApplicationItemState();
}

class _MobileApplicationItemState extends State<MobileApplicationItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(),
          SizedBox(height: 50),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildAppItem(
                    image1: "assets/images/mas1.jpeg",
                    image2: "assets/images/mas2.jpeg",
                    image3: "assets/images/mas 3.jpeg",
                    image4: "assets/images/mas 4.jpeg",
                  ),

                  buildAppItem(
                    image1: AppImages.manafea1,
                    image2: AppImages.manafea3,
                    image3: AppImages.manafea2,
                    image4: AppImages.manafea4,
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAppItem({
    required String image1,
    required String image2,
    required String image3,
    required String image4,
  }){
    return Container(
      padding: const EdgeInsets.all(24),
      height: 550,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصور
          Expanded(flex: 2, child: buildAppImages(
            image1: image1,
            image2: image2,
            image3:image3,
            image4:image4
          )),
          const SizedBox(width: 24),
          // حول التطبيق
          Expanded(flex: 1, child: buildAboutApp()),
        ],
      ),
    );
  }

  Widget buildAppImages({
    required String image1,
    required String image2,
    required String image3,
    required String image4,
}) {
    return Container(
      height: 550,
      padding: const EdgeInsets.all(16),
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildImageCard(image1),
            const SizedBox(width: 16),
            _buildImageCard(image2),
            const SizedBox(width: 16),
            _buildImageCard(image3),
            const SizedBox(width: 16),
            _buildImageCard(image4),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 215,
        height: 500,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  Widget buildAboutApp() {
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
                  'About this application',
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
              Icon(Icons.shop, size: 28, color: Colors.black87), // Amazon
              const SizedBox(width: 16),
              Icon(Icons.android, size: 28, color: Colors.green), // Play Store
              const SizedBox(width: 16),
              Icon(Icons.apple, size: 28, color: Colors.black), // App Store
            ],
          ),
        ],
      ),
    );
  }
}
