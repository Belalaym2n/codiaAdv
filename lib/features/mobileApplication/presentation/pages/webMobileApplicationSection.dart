import 'package:codia_adv/features/core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';
import 'package:codia_adv/features/mobileApplication/presentation/bloc/getAppsBloc.dart';
import 'package:codia_adv/features/mobileApplication/presentation/bloc/getAppsStates.dart';
import 'package:codia_adv/features/mobileApplication/presentation/widgets/mobileAppsSectionWep/mobileApplicationItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../addApplication/domain/entities/applicationEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WebMobileApplicationSection extends StatefulWidget {
    WebMobileApplicationSection({super.key ,
      required this.width, required this.height});

    double height;
    double width;

  @override
  State<WebMobileApplicationSection> createState() => _WebMobileApplicationSectionState();
}

class _WebMobileApplicationSectionState extends State<WebMobileApplicationSection> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WebHeader(width: widget.width, height: widget.height),

          Expanded(
            child: BlocBuilder<GetAppsBloc, GetAppsStates>(
              builder: (context, state) {
                if (state is GetAppsLoading) {
                  return loadingWidget();
                } else if (state is GetAppsSuccess) {
                   print("${state.apps[0].description}}");
                  return state.apps.isNotEmpty
                      ?  WebMobileApplicationSectionItemWeb(
                    animateOnScrollDownOnly: true,
                    key: const ValueKey("loaded"),
                    height: widget.height,
                    width: widget.width,
                    apps: state.apps,
                  )
                      : Center(
                    child: Text("No blogs available"),
                  );
                } else if (state is GetAppsFailure) {
                  return Center(child: Text(state.error));
                }
                return Container();
              },
            ),
          ),

        ],
      ),
    );
  }




    Widget loadingWidget() {
      return Skeletonizer(
        enabled: true,
        child: WebMobileApplicationSectionItemWeb(

          animateOnScrollDownOnly: false,
           key: const ValueKey("loading"),
            apps: [
            ApplicationEntity(headline: "headline", description: "description",
            image1:         "https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a",

            image2:         "https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a",

            image3:        "https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a",

            image4:         "https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a",
        )
        ],
        height:widget.height,
        width: widget.width,
      ),
      );
    }


}
