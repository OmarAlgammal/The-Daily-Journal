import 'package:flutter/material.dart';
import 'package:the_daily_journal/shared/constance/gaps.dart';
import 'package:the_daily_journal/shared/constance/icons.dart';
import 'package:the_daily_journal/shared/widgets/circular_icon.dart';
import 'package:the_daily_journal/shared/widgets/news_list.dart';
import 'package:the_daily_journal/shared/widgets/news_title.dart';
import 'package:the_daily_journal/shared/widgets/page_view_with_indicator.dart';

import '../../domain/entities/news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Dummy data
    List<News> news = [
      News(
          id: 0,
          category: 'Sports',
          title: 'What Training Do Vollyball Players Need?',
          description: 'description',
          imageUrl:
              'https://thumbs.dreamstime.com/b/summer-sea-beach-volleyball-court-under-sun-30957162.jpg',
          authorImageUrl:
              'https://media.istockphoto.com/id/1205739566/photo/young-indian-man-wearing-orange-sweater-over-isolated-white-background-happy-face-smiling.jpg?s=612x612&w=0&k=20&c=5NRDR1jFRu_ptMJD83bAx-GmCSjq7UBAHEs0dh33tfQ=',
          authorName: 'Mckendney',
          agency: 'CNN Indonesia',
          publishingDate: DateTime.now()),
      News(
          id: 1,
          category: 'Education',
          title: 'Secondary School Places: When Do Parents Find Out?',
          description: 'description',
          imageUrl: 'https://s3.envato.com/files/298753972/IMG_7979.jpg',
          authorImageUrl:
              'https://thumbs.dreamstime.com/b/pretty-young-muslim-woman-having-conversation-phone-happy-holding-looking-out-like-thnking-good-memories-99701646.jpg',
          authorName: 'Rosemary',
          agency: 'CNN Egypt',
          publishingDate: DateTime.now()),
      News(
          id: 2,
          category: 'Tourism',
          title: 'Best Places To Travel',
          description: 'description',
          imageUrl:
              'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/activity_headers/50519/2000x2000-0-70-7a61abe0693c71f4f80bc804635b1034.jpg',
          authorImageUrl:
              'https://thumbs.dreamstime.com/b/pretty-young-muslim-woman-having-conversation-phone-happy-holding-looking-out-like-thnking-good-memories-99701646.jpg',
          authorName: 'Rosemary',
          agency: 'CNN UK',
          publishingDate: DateTime.now()),
    ];
    return Scaffold(
      appBar: AppBar(
        primary: true,
        centerTitle: true,
        toolbarHeight: 56,
        actions: [
          gap16,
          CircularIcon(icon: menuIcon),
          Spacer(),
          CircularIcon(icon: searchIcon),
          gap4,
          CircularIcon(
            icon: bellIcon,
            showNotificationState: true,
          ),
          gap16,
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const NewsTitle(title: 'Breaking News'),
            ),
            PageViewIndicator(news: news),
            gap16,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: NewsTitle(
                title: 'Recommendations',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: NewsList(news: news),
            ),
          ],
        ),
      ),
    );
  }
}
