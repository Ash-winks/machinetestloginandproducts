import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'homeviewmodel.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (viewModel){
        viewModel.getproducts();
      },
      viewModelBuilder: () {
      return HomeViewModel();
    }, builder: (BuildContext context, HomeViewModel viewModel, Widget? child)
    {
      final List<Widget> imageSliders = viewModel.imglist
          .map((item) =>
          Container(
            margin: const EdgeInsets.all(1.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ))
      .toList();
      return SafeArea(child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Products'),
        ),
         body: Padding(
           padding:  EdgeInsets.only(left: 10,top: 10),
           child: Column(
             children: [
               Container(
                 child: CarouselSlider(
                   options: CarouselOptions(
                     autoPlayAnimationDuration: Duration(seconds: 2),
                     autoPlay: true,
                     aspectRatio: 19 / 8,
                     enlargeCenterPage: true,
                   ),
                   items: imageSliders,
                 )
               ),
               Expanded(
                 child: ListView.builder(
                   itemCount: viewModel.plist?.length,
                   itemBuilder: (BuildContext context, int index) {
                     return ListTile(
                       leading: Text('${viewModel.plist?[index].id}'),
                       title: Text('${viewModel.plist?[index].name}'),
                       subtitle: Text('${viewModel.plist?[index].description}'),
                       trailing: Text('${viewModel.plist?[index].price}'),
                     );
                   },),
               )
             ],
           ),
         ),
      ));
    },);
  }
}
