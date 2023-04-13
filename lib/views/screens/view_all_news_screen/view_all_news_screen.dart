import 'package:flutter/material.dart';
import 'package:the_daily_journal/utils/constance/gaps.dart';
import 'package:the_daily_journal/utils/constance/padding.dart';
import 'package:the_daily_journal/views/screens/view_all_news_screen/components/chips_bar_component.dart';
import 'package:the_daily_journal/views/screens/view_all_news_screen/components/serach_box_component.dart';
import 'package:the_daily_journal/views/screens/view_all_news_screen/components/view_all_news_app_bar_component.dart';
import 'package:the_daily_journal/views/screens/view_all_news_screen/components/view_all_news_description_component.dart';
import 'package:the_daily_journal/views/widgets/news_list.dart';

import '../../../models/news_model.dart';

class ViewAllNewsScreen extends StatelessWidget {
  ViewAllNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ViewAllNewsAppBarComponent(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ViewAllNewsDescriptionComonent(),
            gap24,
            const SearchBoxComponent(),
            gap24,
            const ChipsBarComponent(),
            Padding(
              padding: padding16,
              child: NewsList(news: news),
            )
          ],
        ),
      ),
    );
  }

  /// Dummy data
  final List<NewsModel> news = [
    NewsModel(
        id: 0,
        category: 'Sports',
        title: 'What Training Do cycling Players Need?',
        description:
            'There is no doubt that cycling requires dedication and consistency. But there is more to consider that just hopping '
            'on your bike and riding. You also have to consider safety, nutrition, bike fit, workouts and more.'
            'Whether you are aspiring to race in the Tour de France or simply enjoy cycling as a form of exercise,'
            ' applying these 10 training strategies will help you become a better, faster, and more efficient cyclist, no matter what speed or distance you ride.'
            'There is no doubt that cycling requires dedication and consistency. But there is more to consider that just hopping '
            'on your bike and riding. You also have to consider safety, nutrition, bike fit, workouts and more.'
            'Whether you are aspiring to race in the Tour de France or simply enjoy cycling as a form of exercise,'
            'Whether you are aspiring to race in the Tour de France or simply enjoy cycling as a form of exercise,'
            'There is no doubt that cycling requires dedication ',
        imageUrl:
            'https://www.siroko.com/blog/c/app/uploads/2021/07/efectos-positivos_f766ef96-0811-452d-bbf8-ec38d244637a-1440x900.jpg',
        authorImageUrl:
            'https://media.istockphoto.com/id/1205739566/photo/young-indian-man-wearing-orange-sweater-over-isolated-white-background-happy-face-smiling.jpg?s=612x612&w=0&k=20&c=5NRDR1jFRu_ptMJD83bAx-GmCSjq7UBAHEs0dh33tfQ=',
        authorName: 'Mckendney',
        agency: 'CNN Indonesia',
        publishingDate: DateTime.now()),
    NewsModel(
        id: 1,
        category: 'Education',
        title: 'Secondary School Places: When Do Parents Find Out?',
        description:
            'In England and Wales, parents who applied online received an email on 1 March with details of how to accept the place, and the deadline.'
            'Those who did not apply online were sent a letter.'
            'If parents do not accept by the date specified, the offer could be withdrawn and the place given to someone else.'
            'Across London, three in 10 children missed out on their first choice secondary school for September 2023.'
            'Figures aren'
            't yet available for the whole of England, but in 2022, 83.3% of applicants were offered a place at their first preference secondary school. That percentage has been broadly static since 2014.',
        imageUrl: 'https://s3.envato.com/files/298753972/IMG_7979.jpg',
        authorImageUrl:
            'https://thumbs.dreamstime.com/b/pretty-young-muslim-woman-having-conversation-phone-happy-holding-looking-out-like-thnking-good-memories-99701646.jpg',
        authorName: 'Rosemary',
        agency: 'CNN Egypt',
        publishingDate: DateTime.now()),
    NewsModel(
        id: 2,
        category: 'Tourism',
        title: 'Best Places To Travel',
        description:
            'Pyramids are large, ancient structures that were built by several civilizations in different parts of the world, including Egypt, Mesoamerica, China, and ancient Mesopotamia. These structures were typically constructed using large stone blocks or bricks, and are usually in the shape of'
            ' a pyramid, with a square or rectangular base and sloping sides that meet at the apex'
            'The most famous pyramids are the pyramids of Egypt, which were built during the Old Kingdom period (ca. 2686–2181 BCE) as tombs for pharaohs and their consorts. The largest and most well-known pyramids are the Great Pyramid of Giza, the Pyramid of Khafre, and the Pyramid of Menkaure, which are all located on the Giza plateau near Cairo, Egypt.'
            'The pyramids of Mesoamerica, which were built by the Maya and other indigenous peoples in Mexico and Central America, were often used for religious and',
        imageUrl:
            'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/activity_headers/50519/2000x2000-0-70-7a61abe0693c71f4f80bc804635b1034.jpg',
        authorImageUrl:
            'https://thumbs.dreamstime.com/b/pretty-young-muslim-woman-having-conversation-phone-happy-holding-looking-out-like-thnking-good-memories-99701646.jpg',
        authorName: 'Rosemary',
        agency: 'CNN UK',
        publishingDate: DateTime.now()),
  ];
}
