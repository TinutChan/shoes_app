import 'package:allpay/src/module/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_setting.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          title: Text(
            'Favourite',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          elevation: 0,
        ),
        body: Container()
        // GridView.builder(
        //     padding:
        //         const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
        //     shrinkWrap: true,
        //     itemCount: homeController.favList.length,
        //     physics: const NeverScrollableScrollPhysics(),
        //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //         maxCrossAxisExtent: 240,
        //         childAspectRatio: 0.75,
        //         mainAxisSpacing: 20,
        //         crossAxisSpacing: 20),
        //     itemBuilder: (BuildContext ctx, index) {
        //       return CustomFavoriteCard(
        //         title: homeController.favList[index].name,
        //         image: homeController.favList[index].thumbnailUrl,
        //         price: homeController.favList[index].price,
        //         //isFav: homeController.favList[index].is,
        //         onFav: () {},
        //       );
        //     }),
        );
  }
}
