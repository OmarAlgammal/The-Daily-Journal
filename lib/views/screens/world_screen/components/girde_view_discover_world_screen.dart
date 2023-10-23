import 'package:flutter/material.dart';
import 'package:the_daily_journal/routing/routes.dart';
import 'package:the_daily_journal/utils/constance/border_radius.dart';
import 'package:the_daily_journal/utils/constance/padding/padding.dart';
import 'package:the_daily_journal/utils/enums/news_categories.dart';
import 'package:the_daily_journal/utils/extensions/context_extension.dart';
import 'package:the_daily_journal/views/widgets/my_cached_network_image.dart';

class GridViewDiscoverWorld extends StatelessWidget {
  GridViewDiscoverWorld({super.key});

  final views = NewsCategories.hotIssue();

  @override
  Widget build(BuildContext context) {
    bool follow = false;
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: views
          .map(
            (e) => InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(AppRouts.hotIssueScreen, arguments: e);
              },
              child: Container(
                width: context.screenWidth() / 2,
                decoration: BoxDecoration(
                  borderRadius: circular12,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: MyCachedNetworkImage(
                          imageUrl: e.imageUrl!,
                          imageBuilder: (context, imageProvider) => ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: Image(
                                    image: imageProvider, fit: BoxFit.cover),
                              )),
                    ),
                    Container(
                      height: context.screenHeight() * .035,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.colorScheme.scrim.withOpacity(.2),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                      ),
                      child: Padding(
                        padding: paddingH4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.title,
                              style: context.textTheme.titleMedium,
                            ),
                            // StatefulBuilder(
                            //     builder: (context, setState) => InkWell(
                            //           onTap: () {
                            //             /// TODO: Save followings locally
                            //             setState(() => follow = !follow);
                            //           },
                            //           child: Icon(follow
                            //               ? AppIcons.checkIcon
                            //               : AppIcons.addIcon),
                            //         ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
