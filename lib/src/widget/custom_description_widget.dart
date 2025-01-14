import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../constant/app_setting.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;
  final int maxLines;

  const DescriptionWidget({
    super.key,
    required this.description,
    this.maxLines = 2,
  });

  @override
  Widget build(BuildContext context) {
    final descriptionStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontFamily: 'poppins-regular',
          color: const Color(0xff707B81),
        );

    const morelessStyle = TextStyle(
      color: AppColor.primaryColor,
      fontWeight: FontWeight.w500,
      height: 1.5,
    );

    return ReadMoreText(
      description,
      trimExpandedText: ' show less',
      trimCollapsedText: ' show more',
      trimMode: TrimMode.Line,
      lessStyle: morelessStyle,
      moreStyle: morelessStyle,
      delimiter: '. . .',
      delimiterStyle: const TextStyle(letterSpacing: 0.5),
      // delimiterStyle: const TextStyle(color: AppColor.primaryColor),
      style: descriptionStyle,
    );
  }
}
