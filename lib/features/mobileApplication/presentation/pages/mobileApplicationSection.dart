import 'package:codia_adv/features/addApplication/domain/entities/applicationEntity.dart';
import 'package:codia_adv/features/mobileApplication/data/data_sources/remote/getAppRDImp.dart';
import 'package:codia_adv/features/mobileApplication/data/data_sources/remote/getAppsRemoteDS.dart';
import 'package:codia_adv/features/mobileApplication/data/repositories/getAppsDataRepoImp.dart';
import 'package:codia_adv/features/mobileApplication/domain/use_cases/getAppsUserCase.dart';
import 'package:codia_adv/features/mobileApplication/presentation/bloc/events.dart';
import 'package:codia_adv/features/mobileApplication/presentation/bloc/getAppsBloc.dart';
import 'package:codia_adv/features/mobileApplication/presentation/pages/webMobileApplicationSection.dart';
import 'package:codia_adv/features/mobileApplication/presentation/widgets/mobileAppsSectionWep/mobileApplicationItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/getAppsDomainRepo.dart';

class MobileApplicationSection extends StatelessWidget {
  const MobileApplicationSection({super.key});

  bool isDesktop(double width) => width >= 1280;

  bool isTablet(double width) => width >= 600 && width < 1280;

  bool isMobile(double width) => width < 600;

  @override
  Widget build(BuildContext context) {
    GetAppsRemoteDS remoteDS = GetAppsRDImp();
    GetAppsDomainRepo getAppsDomainRepo = GetAppsDataRepoImp(remoteDS);
    GetAppsUseCase getAppsUseCase = GetAppsUseCase(getAppsDomainRepo);
    return BlocProvider(
      create:
          (context) =>
              GetAppsBloc(useCase: getAppsUseCase)
                ..add(TapTappedGetAppsEvents()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final h = MediaQuery.of(context).size.height; // ✅ التعديل هنا
          final w = MediaQuery.of(context).size.width; // ✅ التعديل هنا

          if (isDesktop(width)) {
            return WebMobileApplicationSection(height: h, width: w);
          }
          return Container();
        },
      ),
    );
  }
}
