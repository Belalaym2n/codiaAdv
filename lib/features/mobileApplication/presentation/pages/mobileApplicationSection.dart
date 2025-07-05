import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';
import 'package:codia_adv/features/mobileApplication/data/data_sources/remote/getAppRDImp.dart';
import 'package:codia_adv/features/mobileApplication/data/data_sources/remote/getAppsRemoteDS.dart';
import 'package:codia_adv/features/mobileApplication/data/repositories/getAppsDataRepoImp.dart';
import 'package:codia_adv/features/mobileApplication/domain/use_cases/getAppsUserCase.dart';
import 'package:codia_adv/features/mobileApplication/presentation/bloc/events.dart';
import 'package:codia_adv/features/mobileApplication/presentation/bloc/getAppsBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/getAppsDomainRepo.dart';
import 'applicationSectionTablet.dart';
import 'desktopMobileApplicationSection.dart';

class MobileApplicationSection extends StatelessWidget {
  const MobileApplicationSection({super.key});

  bool isDesktop(double width) => width >= 1024;

  bool isTablet(double width) => width >= 600 && width < 1024;

  bool isMobile(double width) => width < 600;

  @override
  Widget build(BuildContext context) {
    GetAppsRemoteDS remoteDS = GetAppsRDImp();
    GetAppsDomainRepo getAppsDomainRepo = GetAppsDataRepoImp(remoteDS);
    GetAppsUseCase getAppsUseCase = GetAppsUseCase(getAppsDomainRepo);
    return BlocProvider(
      create:
          (context) =>
              GetAppsBloc.getInstance(useCase: getAppsUseCase)
                ..add(TapTappedGetAppsEvents()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final h = MediaQuery.of(context).size.height;
          final w = MediaQuery.of(context).size.width;

          if (isDesktop(width)) {
            return DesktopMobileApplicationSection(height: h, width: w);
          } else if (isTablet(width)) {
             return ApplicationPageTablet(width: w, height: h);
          }
          return Container();
        },
      ),
    );
  }
}
