import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../addApplication/domain/entities/applicationEntity.dart';
import '../../../core/sharedWidget/responiveSharedWidget/header/headerWeb.dart';
import '../bloc/getAppsBloc.dart';
import '../bloc/getAppsStates.dart';
import '../widgets/mobileAppSectionItem/mobileApplicationItemDesktop.dart';

class DesktopMobileApplicationSection extends StatefulWidget {
  DesktopMobileApplicationSection({
    super.key,
    required this.width,
    required this.height,
  });

  double height;
  double width;

  @override
  State<DesktopMobileApplicationSection> createState() =>
      _WebMobileApplicationSectionState();
}

class _WebMobileApplicationSectionState
    extends State<DesktopMobileApplicationSection> {
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            WebHeader(width: widget.width, height: widget.height),
            SizedBox(height: widget.height * 0.02),
            Expanded(
              child: BlocBuilder<GetAppsBloc, GetAppsStates>(
                builder: (context, state) {
                  if (state is GetAppsLoading) {
                    return loadingWidget();
                  } else if (state is GetAppsSuccess) {
                    if (!_showContent) {
                      Future.delayed(const Duration(milliseconds: 600), () {
                        if (mounted) {
                          setState(() {
                            _showContent = true;
                          });
                        }
                      });
                    }
                    return !_showContent && !GetAppsBloc.isLoadedBefore
                        ? loadingWidget()
                        : (state.apps.isNotEmpty
                            ? WebMobileApplicationSectionItem(
                              isDesktop: true,
                              animateOnScrollDownOnly: true,
                              key: const ValueKey("loaded"),
                              height: widget.height,
                              width: widget.width,
                              apps: state.apps,
                            )
                            : Center(child: Text("No blogs available")));
                  } else if (state is GetAppsFailure) {
                    return Center(child: Text(state.error));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          Expanded(
            child: WebMobileApplicationSectionItem(
              animateOnScrollDownOnly: false,
              key: const ValueKey("loading"),
              apps: [
                ApplicationEntity(
                  headline: "headline",
                  description: "description",
                  image1:
                      "https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a",

                  image2:
                      "https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a",

                  image3:
                      "https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a",

                  image4:
                      "https://firebasestorage.googleapis.com/v0/b/codiaadv-826b2.firebasestorage.app/o/blogs%2F470224519_122136015524381851_4220010285083589484_n.jpg?alt=media&token=6f7deb2e-dddc-48aa-9b94-0f2818aa329a",
                ),
              ],
              height: widget.height,
              width: widget.width,
            ),
          ),
        ],
      ),
    );
  }
}
