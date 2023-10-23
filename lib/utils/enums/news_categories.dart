enum NewsCategories {
  // Categories in source
  all(
    title: 'Scientific',
  ),
  business(
    title: 'Business',
  ),
  health(
    title: 'Health',
  ),
  entertainment(
    title: 'Entertainment',
  ),
  technology(
    title: 'Technology',
  ),
  science(
    title: 'Science',
  ),
  general(
    title: 'General',
  ),
  search(
    title: 'Search',
  ),
  emirates(
    title: 'Emirates',
    countryCode: 'ua',
    pageSize: 7,
  ),
  egypt(
    title: 'Egypt news',
    countryCode: 'eg',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF0Bx2lqUnKgi7XuZUg3rcNtu9kQ6HNJt8fA&usqp=CAU',
  ),
  palestine(
    title: 'Palestine news',
    imageUrl:
        'https://images.pexels.com/photos/2087322/pexels-photo-2087322.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  world(
    title: 'World news',
    imageUrl:
        'https://discovery.sndimg.com/content/dam/images/discovery/editorial/podcasts/Curiosity/2020/3/Earth-perfec-life-Shutterstock.jpg.rend.hgtvcom.1280.960.suffix/1583192498207.jpeg',
  ),
  middleEast(
    title: 'Middle east news',
    imageUrl:
        'https://assets.ltkcontent.com/images/102595/map-middle-east-countries_7abbbb2796.jpg',
  ),
  sports(
    title: 'Sports news',
    imageUrl:
        'https://images.pexels.com/photos/269948/pexels-photo-269948.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  russiaAndUkraine(
    title: 'Russia & Ukraine',
    countryCode: 'ru',
    imageUrl:
        'https://cdn.theatlantic.com/thumbor/O2-EOlnJoDOFdf0ux2bXx0wk7DE=/0x0:2000x1125/1600x900/media/img/mt/2023/02/Atlantic_RU_final/original.jpg',
  ),
  premierLeague(
    title: 'premier league',
    imageUrl:
        'https://images.pexels.com/photos/1171084/pexels-photo-1171084.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ),
  scientific(
    title: 'Scientific news',
    imageUrl:
        'https://assets.thehansindia.com/h-upload/2021/08/23/1103754-scientific-temper.webp',
  );

  final String title;
  final String? countryCode;
  final int? pageSize;
  final String? imageUrl;

  static List<NewsCategories> categories() {
    return [
      NewsCategories.all,
      NewsCategories.business,
      NewsCategories.health,
      NewsCategories.entertainment,
      NewsCategories.technology,
      NewsCategories.science,
      NewsCategories.general
    ];
  }

  static List<NewsCategories> hotIssue() {
    return [
      NewsCategories.egypt,
      NewsCategories.palestine,
      NewsCategories.world,
      NewsCategories.middleEast,
      NewsCategories.sports,
      NewsCategories.russiaAndUkraine,
      NewsCategories.premierLeague,
      NewsCategories.scientific,
    ];
  }

  // NOTE: Do not use these value as categories in DiscoverWorldScreen or in WorldScreen
  static bool doNotUse(NewsCategories newsCategories) {
    return ![NewsCategories.search, NewsCategories.emirates]
        .contains(newsCategories);
  }

  const NewsCategories({
    required this.title,
    this.countryCode,
    this.pageSize,
    this.imageUrl,
  });
}
