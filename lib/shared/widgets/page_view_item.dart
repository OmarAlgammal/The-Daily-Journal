
import 'package:flutter/material.dart';

import '../../features/home/domain/entities/news.dart';
import '../constance/colors.dart';
import '../constance/gaps.dart';
import '../constance/icons.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, required this.news}) : super(key: key);

  final News news;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: blackColor,
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: Offset(0, 1), // Changes position of shadow
                ),
              ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Opacity(
              opacity: .5,
              child: Image.network(news.imageUrl, fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: blueColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(news.category, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: whiteColor,),maxLines: 2,),
            ),
          ),
          left: 18,
          top: 18,
        ),
        Positioned(
          left: 18,
          bottom: 18,
          right: 18,
          child: SizedBox(
            width: (MediaQuery.of(context).size.width / 5) * 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(news.agency, style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400, color: whiteColor), maxLines: 2),
                    gap8,
                    Icon(checkCircleIcon, color: blueColor, size: 18,),
                    gap8,
                    Text('5 hours ago', style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400, color: whiteColor),)
                  ],
                ),
                gap4,
                Text(news.title, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: whiteColor), maxLines: 2,),
              ],
            ),
          ),
        )
      ],
    );
  }
}
