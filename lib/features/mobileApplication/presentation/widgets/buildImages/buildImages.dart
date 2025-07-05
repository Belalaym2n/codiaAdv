import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';
import 'package:codia_adv/features/mobileApplication/presentation/widgets/sharedWidget/aboutApp.dart';

Widget buildAppImages(
  int index,
  double w,
  List<ApplicationEntity> apps, {
  bool isDesktop = true,
}) {
  return Container(
    height:isDesktop? w * 0.737:w*0.62,
    padding: EdgeInsets.all(w * 0.01),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(w * 0.01),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
      ],
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _animatedImage(apps[index].image1, w, delay: 0, isDesktop: isDesktop),
          _animatedImage(
            apps[index].image2,
            w,
            delay: 300,
            isDesktop: isDesktop,
          ),
          _animatedImage(
            apps[index].image3,
            w,
            delay: 600,
            isDesktop: isDesktop,
          ),

          isDesktop
              ? _animatedImage(apps[index].image4, w, delay: 900)
              : SizedBox.shrink(),
        ],
      ),
    ),
  );
}

Widget _animatedImage(
  String path,
  double w, {
  int delay = 0,
  bool isDesktop = true,
}) {
  final image = _buildImageCard(path, w, isDesktop: isDesktop);
  return Padding(padding: EdgeInsets.only(right: w * 0.01), child: image);
}

Widget _buildImageCard(String imagePath, double w, {required bool isDesktop}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(w * 0.01),
    child: Container(
      width: isDesktop ? w * 0.13 : w*0.2632,
      height:isDesktop ? w * 0.67:w*0.6,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(w * 0.01),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Image.network(imagePath, fit: BoxFit.fill),
    ),
  );
}
