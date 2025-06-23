import 'package:carousel_slider/carousel_slider.dart';
import 'package:codia_adv/config/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:codia_adv/config/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../domain/models/imagesModel.dart';

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
  @override
  void initState() {
    super.initState();

  }
  bool _isImagesPrecached = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isImagesPrecached) {
      for (var model in models) {
        precacheImage(AssetImage(model.image), context);
      }
      _isImagesPrecached = true;
    }
  }
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  final List<ImagesModel> models = [
    ImagesModel(
      headline: "Build your digital dream with confidence",
      subHeadline: "Innovate. Launch. Grow.",
      image: "assets/images/bg2 - Copy.jpg",
      description:
      "From your idea lines to an achievement network. Let your thoughts become a reality with our expert team and scalable tech.",
    ),

  ];



  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildCarousel(),

       ],
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      itemCount: models.length,
      carouselController: _controller,

      options: CarouselOptions(


        height: widget.imageHeight,

        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        enlargeCenterPage: false,
         onPageChanged: (index, reason) {
          setState(() => _currentIndex = index);
        },
      ),
      itemBuilder: (context, index, realIndex) {
        return FadeIn(
          duration: Duration(milliseconds: 800),
          child: Image.asset(
            models[index].image,
            fit: BoxFit.cover,
            width: double.infinity,
            filterQuality: FilterQuality.low,
            cacheWidth: 1200,
          ),
        );

      },
    );
  }



 }

