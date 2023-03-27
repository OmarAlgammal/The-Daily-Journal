class News {
  final int id;
  final String category,
      title,
      description,
      imageUrl,
      authorImageUrl,
  agency,
      authorName;
  final DateTime publishingDate;

  News(
      {required this.id,
      required this.category,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.authorImageUrl,
        required this.agency,
      required this.authorName,
      required this.publishingDate});
}
