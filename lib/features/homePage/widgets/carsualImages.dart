import 'package:carousel_slider/carousel_slider.dart';
import 'package:codia_adv/config/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;
  final List<String> imageUrls=   [
    "assets/images/1.jpg",
    "assets/images/1.jpg",
    "assets/images/1.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildCarousel(),
        _buildNavButton(isBack: true),
        _buildNavButton(isBack: false),
         _buildScrollingIndicator(bottom: widget.dotBottomPadding + 65),
      ],
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      carouselController: _controller,
      options: CarouselOptions(
        height: widget.imageHeight,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          setState(() => _currentIndex = index);
        },
      ),
      itemBuilder: (context, index, realIndex) {
        return Image.asset(
          imageUrls[index],
          fit: BoxFit.cover,
          width: double.infinity,
        );
      },
    );
  }

  Widget _buildNavButton({required bool isBack}) {
    return Positioned(
      left: isBack ? 15 : null,
      right: isBack ? null : 15,
      child: Container(
        width: widget.navButtonSize,
        height: widget.navButtonSize,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Icon(
                isBack ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                color: AppColors.primaryColor,
                size: 30,
              ),
            ),
            onPressed: () =>
            isBack ? _controller.previousPage() : _controller.nextPage(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
      ),
    );
  }

  Widget _buildDotIndicator({required double bottom}) {
    return Positioned(
      bottom: bottom,
      child: AnimatedSmoothIndicator(
        activeIndex: _currentIndex,
        count:  imageUrls.length,
        effect: ExpandingDotsEffect(
          activeDotColor: Colors.white,
          dotColor: Colors.white54,
          dotHeight: widget.dotSize,
          dotWidth: widget.dotSize,
          expansionFactor: 4,
        ),
      ),
    );
  }

  Widget _buildScrollingIndicator({required double bottom}) {
    return Positioned(
      bottom: bottom,
      child: AnimatedSmoothIndicator(
        activeIndex: _currentIndex,
        count:  imageUrls.length,
        effect: ScrollingDotsEffect(
          activeDotColor: Colors.white,
          dotColor: Colors.white54,
          dotHeight: widget.dotSize - 2,
          dotWidth: widget.dotSize - 2,
          spacing: widget.dotSpacing,
          radius: 2,
        ),
      ),
    );
  }
}
