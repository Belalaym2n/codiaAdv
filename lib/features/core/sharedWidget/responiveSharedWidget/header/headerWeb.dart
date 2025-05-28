import 'package:codia_adv/features/core/sharedWidget/responiveSharedWidget/header/sharedWidget.dart';
import 'package:flutter/material.dart';

import '../../../../../config/utils/appConstants.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.screenWidth * (40 / 1528),
        vertical: AppConstants.screenHeight * (20 / 746),
      ),
      color: Colors.white,
      child: Row(
        children: [
          BuildCodiaName(
            width: AppConstants.screenWidth*0.03,  // لا تضرب في AppConstants.screenWidth هنا
            height: AppConstants.screenHeight*0.067, // لا تضرب في AppConstants.screenHeight هنا
            fontSize: AppConstants.screenWidth*0.02, // كذلك فقط القيمة الفعلية
          ),

          const Spacer(),
          Expanded(
            flex: 8,
              child:   BuildPages(
                fontSize:AppConstants.screenWidth*0.012 ,
                horizontalPadding: AppConstants.screenWidth*0.01 ,
                verticalPadding: AppConstants.screenHeight*0.0053,

              )),
          const Spacer(),
            BuildSettingsButton(
            size:  AppConstants.screenWidth*0.028,

            iconSize:   AppConstants.screenWidth*0.014,


          ),
          SizedBox(width:  AppConstants.screenWidth*0.012),
            BuildRequestButton(
              fontSize:AppConstants.screenWidth*0.0117 ,
              width: AppConstants.screenWidth*0.16,
              height: AppConstants.screenHeight*0.067,
              borderRadius: AppConstants.screenWidth*0.02,


            ),
          SizedBox(width:AppConstants.screenWidth*0.02),
            VerticalDividerWidget(
              height:AppConstants.screenHeight*0.08 ,
               width: 1,
             ),
          SizedBox(width:  AppConstants.screenWidth*0.012),
            BuildCallItem(
              iconSize: AppConstants.screenWidth*0.019,
padding: AppConstants.screenWidth*0.006,
              spacing:  AppConstants.screenWidth*0.006,

              subtitleFontSize: AppConstants.screenWidth*0.0091,
              subtitleFontWeight: FontWeight.w400,
           titleFontSize: AppConstants.screenWidth*0.0091,
              titleFontWeight: FontWeight.w600,
              titleSpacing: AppConstants.screenWidth*0.0026,

            ),
        ],
      ),
    );
  }
}
