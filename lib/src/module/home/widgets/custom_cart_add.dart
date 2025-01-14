import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomMyCart extends StatelessWidget {
  final String? title;
  final String? image;
  final double? price;
  final double? width;

  const CustomMyCart(
      {super.key, this.title, this.image, this.price, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 90,
            width: 90,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffF0F0F2),
              image: DecorationImage(
                alignment: Alignment.center,
                image: CachedNetworkImageProvider(
                  image ??
                      "assets/image/1646394313-zoomx-streakfly-road-racing-shoes-lrCMPz.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: 'Raleway'),
              ),
              const SizedBox(height: 10),
              Text(
                "\$${price ?? '--'}",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'poppins-regular',
                    fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
