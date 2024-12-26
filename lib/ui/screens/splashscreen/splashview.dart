import 'package:flutter/material.dart';
import 'package:machinetestloginandproducts/ui/screens/splashscreen/splashviewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../tools/screen_size.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onViewModelReady: (viewmodel){
        viewmodel.timer();
      },
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            width: ScreenSize.width,
            height: ScreenSize.height,
            alignment: Alignment.center,
          ),
        );
      },
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
