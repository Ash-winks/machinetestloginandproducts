import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/apiservice.dart';
import '../services/userservice.dart';
import '../ui/screens/home/homeview.dart';
import '../ui/screens/login/loginview.dart';
import '../ui/screens/splashscreen/splashview.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Splashview,initial: true),
    MaterialRoute(page: Loginview ),
    MaterialRoute(page: Homeview),
  ],
  dependencies: [
    LazySingleton(classType: Userservice),
    LazySingleton(classType: Apiservice),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
  ],
)
class AppSetup {}
