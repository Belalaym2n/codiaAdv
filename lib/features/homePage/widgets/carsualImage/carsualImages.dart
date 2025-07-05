import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatefulWidget {
  final double imageHeight;
  final double navButtonSize;
  final double dotSize;
  final double dotSpacing;
  final double dotBottomPadding;

  const ImageCarousel({
    Key? key,
    required this.imageHeight,
    this.navButtonSize = 50,
    this.dotSize = 10,
    this.dotSpacing = 6,
    this.dotBottomPadding = 15,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  Uint8List? imageBytes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    final byteData = await rootBundle.load("assets/images/bg2_optimized.jpg");
    setState(() {
      imageBytes = byteData.buffer.asUint8List();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
      height: widget.imageHeight,
      child: Center(child: CircularProgressIndicator()),
    )
        : buildCarousel(
      h: widget.imageHeight,
      imageBytes: imageBytes!,
    );
  }
}

Widget buildCarousel({
  required double h,
  required Uint8List imageBytes,
}) {
  return CarouselSlider.builder(
    itemCount: 1,
    options: CarouselOptions(
      height: h,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 4),
      enlargeCenterPage: false,
    ),
    itemBuilder: (context, index, realIndex) {
      return RepaintBoundary(
        child: Image.memory(
          imageBytes,
          fit: BoxFit.cover,
          width: double.infinity,
          filterQuality: FilterQuality.low,
        ),
      );
    },
  );
}
