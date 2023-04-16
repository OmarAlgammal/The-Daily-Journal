class ApiConstance {
  static const apiKey = 'c99bea0e3e7e47398e3b5c70ef18e71d';

  static const baseUrl = 'https://newsapi.org/v2/';

  static allNewsPath({String? query, String? sort}) => 'everything?q=${query?? 'a'}&sortBy=${sort?? ''}&apiKey=$apiKey';


  static String topCountryHeadlinesPath(String countryCode, int? pageSize) {
    const String endpoint = '$baseUrl/top-headlines';
    final String params = '?country=$countryCode${pageSize != null ? '&pageSize=$pageSize' : ''}&apiKey=$apiKey';
    final String url = '$endpoint$params';
    return url;
  }


  static String topCategoryHeadlinesPath(String category) =>
      '${baseUrl}top-headlines?category=$category&apiKey=$apiKey';
}
