import 'package:codia_adv/config/utils/appConstants.dart';
import 'package:codia_adv/features/homePage/domain/models/designModels/serviceConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 import '../../blog/news/presentation/pages/newsScreen.dart';
import '../../core/sharedWidget/responiveSharedWidget/header/headerMobile.dart';
import '../../core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';
import '../../core/sharedWidget/responiveSharedWidget/header/tabletHeader.dart';
import '../domain/models/designModels/blogConfig.dart';
import '../domain/models/designModels/clientSectionConfig.dart';
import 'blog_news.dart';
import 'carsualImages.dart';
import '../../contactUs/footor.dart';
import 'header.dart';
import 'our_clients.dart';
import 'our_servicies.dart';

class HomePageItem extends StatefulWidget {
  const HomePageItem({super.key});

  @override
  State<HomePageItem> createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop(double width) => width >= 1280;
    bool isTablet(double width) => width >= 600 && width < 1280;
    bool isMobile(double width) => width < 600;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {

          final width = constraints.maxWidth;
           final h = MediaQuery.of(context).size.height; // ✅ التعديل هنا
           final w = MediaQuery.of(context).size.width; // ✅ التعديل هنا

          if (isDesktop(width)) {
            return Column(
              children: [
                const WebHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ImageCarousel(
                              imageHeight: h*0.85,
                              navButtonSize: w*0.03 ,
                               dotBottomPadding: h*0.1,
                              dotSize:w*0.006,
                              dotSpacing: w*0.003,



                            ),

                            Positioned(
                              bottom: h* -0.44,

                              left: 0,
                              right: 0,
                              child: OurServicesSectionWeb(
                                serviceWidgetConfig: ServiceWidgetConfig(
                                  width: w*0.23,
                                  height:h*0.455 ,
                                  boxShadowBlurRadius: h*0.01,
                                  descriptionFontSize: w*0.007,
                                  iconSize: w*0.03,
                                  padding: w*0.03,
                                  sizedBoxHeight1: 20*w,
                                  sizedBoxHeight2:0.018*h,
                                   titleFontSize:0.013*w,
                                  positionedVerticalPadding: 0.008*h,
                                   positionedBorderRadiusBottomLeft:0.01*w  ,
                                  positionedTextFontSize:0.0144*w,
                                  positionedHorizontalPadding:0.0091*w ,


                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 400),
                        ClientsSection(
                          config: ClientsSectionConfig(
                            containerPaddingVertical: h * 0.067,
                            containerPaddingHorizontal: w * 0.026,
                            imageWidth: w * 0.393,
                            imageHeight: h * 0.737,
                            spaceBetweenImageAndText: w * 0.033,
                            titleContainerWidth: w * 0.144,
                            titleContainerHeight: h * 0.054,
                            titleFontSize: w * 0.014,
                            headerFontSize: w * 0.028,
                            headerLetterSpacing: 1.2,
                            headerShadowBlurRadius: h * 0.011,
                            headerShadowOffsetY: h * 0.0054,
                            descriptionFontSize: w * 0.012,
                            descriptionLineHeight: 1.6,
                             spaceAfterDescription: h * 0.054,
                            buttonPaddingHorizontal: w * 0.02,
                            buttonPaddingVertical: h * 0.027,
                            buttonBorderWidth: 0.5,
                            buttonBorderRadius: w * 0.01,
                            iconSize: w * 0.042,
                            separatorWidth: 1,
                            separatorHeight: h * 0.08,
                            counterFontSize: w * 0.026,
                            counterLetterSpacing: 1.2,
                             counterTextSpace: w * 0.0026,
                            counterLabelFontSize: w * 0.012,
                            counterLabelLetterSpacing: 1.1,
                           ),
                        ),
                        SizedBox(
                            height:100,
                            child: NewsScreen()),
                        BlogAndNewsWebSection(config:  BlogAndNewsConfig(
                          containerPaddingVertical: h * 0.067,  // 6.7% من ارتفاع الشاشة
                          containerPaddingHorizontal: w * 0.026, // 2.6% من عرض الشاشة

                          headlineFontSize: h * 0.056,  // 5.6% من ارتفاع الشاشة (مثلاً 42 لو الارتفاع 746)
                          headlineFontWeight: FontWeight.w900,
                          headlineLetterSpacing: 1.2,
                          headlineColor: const Color(0xFF161424),

                          subTitleFontSize: h * 0.02,  // مثلاً 16 لو ارتفاع الشاشة 746
                          subTitleColor: const Color(0xFF757575),
                          subTitleLineHeight: 1.6,

                          blogCardWidth: w * 0.3,    // 30% من عرض الشاشة
                          blogCardHeight: h * 0.6,  // 60% من ارتفاع الشاشة

                          blogImageHeight: h * 0.27,  // 27% من ارتفاع الشاشة
                          blogCardBorderRadius: 16,      // ممكن ثابت
                          blogCardShadowBlurRadius: 12,  // ممكن ثابت
                          blogCardShadowOffsetY: 6,      // ممكن ثابت

                          dateFontSize: h * 0.017,     // تقريباً 13 لو الارتفاع 746
                          dateColor: Colors.redAccent,

                          titleFontSize: h * 0.024,    // 18 لو 746
                          titleFontWeight: FontWeight.w700,
                          titleColor: const Color(0xFF252c49),

                          descriptionFontSize: h * 0.018,  // 14 لو 746
                          descriptionColor: const Color(0xFF4a4a4a),
                          descriptionLineHeight: 1.5,

                          readMoreFontSize: h * 0.018,      // 14 لو 746
                          readMoreFontWeight: FontWeight.bold,
                          readMoreColor: const Color(0xFFdf0a0a),
                        )
                        ),
                        SizedBox(height: 250),
                        FooterSection(),
                      ],
                    ),
                  ),
                )
              ],
            );
          }else if (isTablet(width)) {
            return const TabletHeader();
          } else {
            return const MobileHeader();
          }
        },
      ),
    );
  }
}
