import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/models/news_model.dart';
import 'package:the_daily_journal/utils/extensions/screen_dimens.dart';

import '../../../../utils/constance/gaps.dart';
import '../../../../utils/constance/icons.dart';
import '../../../../utils/theme/colors.dart';
import '../../../../view_model/bookmarks_cubit/bookmark_cubit.dart';
import '../../../../view_model/bookmarks_cubit/bookmark_states.dart';
import '../../../widgets/circular_icon.dart';

class SliverAppBarComponent extends StatelessWidget {
  const SliverAppBarComponent({Key? key, required this.news}) : super(key: key);
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.5),
                    Colors.transparent,
                    Colors.transparent,
                    blackColor.withOpacity(.6)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0,
                    0.2,
                    0.45,
                    1,
                  ],
                ),
              ),
              child: Image.network(
                news.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 18,
              bottom: context.screenHeight() / 12,
              right: 18,
              child: SizedBox(
                width: context.screenWidth() * 1.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Text(
                          news.category,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                          maxLines: 2,
                        ),
                      ),
                    ),
                    gap12,
                    Text(
                      news.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onBackground
                              //color: whiteColor,
                              ),
                      maxLines: 2,
                    ),
                    gap8,
                    Row(
                      children: [
                        Text(
                          'Trending  •  5 hours ago',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.w400,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                //color: whiteColor,
                              ),
                        )
                      ],
                    ),
                    gap4,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: Transform.translate(
            offset: const Offset(0, 1),
            child: Container(
              height: 45,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          )),
      expandedHeight: context.screenHeight() / 2.5,
      actions: [
        gap8,
        CircularIcon(
          icon: arrowLeftIcon,
          onTap: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).colorScheme.background,
          fillColor: Theme.of(context).colorScheme.onSurface.withOpacity(.4),
        ),
        Spacer(),
        BlocBuilder<BookmarkCubit, BookmarkState>(builder: (context, state) {
          return CircularIcon(
            icon: state is BookmarkSavedSuccessfully
                ? bookmarkIcon
                : outlinedBookmarkIcon,
            onTap: () {
              BookmarkCubit.instance(context).saveAsBookmark();
            },
            color: Theme.of(context).colorScheme.background,
            fillColor: Theme.of(context).colorScheme.onSurface.withOpacity(.4),
          );
        }),
        gap8,
        CircularIcon(
          icon: moreIcon,
          onTap: () {
            /// TODO: Complete this action
          },
          color: Theme.of(context).colorScheme.background,
          fillColor: Theme.of(context).colorScheme.onSurface.withOpacity(.4),
        ),
        gap8,
      ],
    );
  }
}
