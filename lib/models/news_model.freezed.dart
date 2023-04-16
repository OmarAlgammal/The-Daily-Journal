// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
mixin _$NewsModel {
  @HiveField(0)
  String get sourceName => throw _privateConstructorUsedError;
  @HiveField(1)
  String get sourceLogoUrl => throw _privateConstructorUsedError;
  @HiveField(2)
  String get category => throw _privateConstructorUsedError;
  @HiveField(3)
  String get authorName => throw _privateConstructorUsedError;
  @HiveField(4)
  String get authorImageUrl => throw _privateConstructorUsedError;
  @HiveField(5)
  String get title => throw _privateConstructorUsedError;
  @HiveType(typeId: 6)
  String get description => throw _privateConstructorUsedError;
  @HiveType(typeId: 7)
  String get content => throw _privateConstructorUsedError;
  @HiveType(typeId: 8)
  String get url => throw _privateConstructorUsedError;
  @HiveType(typeId: 9)
  String get imageUrl => throw _privateConstructorUsedError;
  @HiveType(typeId: 10)
  DateTime get publishedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsModelCopyWith<NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsModelCopyWith<$Res> {
  factory $NewsModelCopyWith(NewsModel value, $Res Function(NewsModel) then) =
      _$NewsModelCopyWithImpl<$Res, NewsModel>;
  @useResult
  $Res call(
      {@HiveField(0) String sourceName,
      @HiveField(1) String sourceLogoUrl,
      @HiveField(2) String category,
      @HiveField(3) String authorName,
      @HiveField(4) String authorImageUrl,
      @HiveField(5) String title,
      @HiveType(typeId: 6) String description,
      @HiveType(typeId: 7) String content,
      @HiveType(typeId: 8) String url,
      @HiveType(typeId: 9) String imageUrl,
      @HiveType(typeId: 10) DateTime publishedDate});
}

/// @nodoc
class _$NewsModelCopyWithImpl<$Res, $Val extends NewsModel>
    implements $NewsModelCopyWith<$Res> {
  _$NewsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceName = null,
    Object? sourceLogoUrl = null,
    Object? category = null,
    Object? authorName = null,
    Object? authorImageUrl = null,
    Object? title = null,
    Object? description = null,
    Object? content = null,
    Object? url = null,
    Object? imageUrl = null,
    Object? publishedDate = null,
  }) {
    return _then(_value.copyWith(
      sourceName: null == sourceName
          ? _value.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
      sourceLogoUrl: null == sourceLogoUrl
          ? _value.sourceLogoUrl
          : sourceLogoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      authorImageUrl: null == authorImageUrl
          ? _value.authorImageUrl
          : authorImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsCopyWith<$Res> implements $NewsModelCopyWith<$Res> {
  factory _$$_NewsCopyWith(_$_News value, $Res Function(_$_News) then) =
      __$$_NewsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String sourceName,
      @HiveField(1) String sourceLogoUrl,
      @HiveField(2) String category,
      @HiveField(3) String authorName,
      @HiveField(4) String authorImageUrl,
      @HiveField(5) String title,
      @HiveType(typeId: 6) String description,
      @HiveType(typeId: 7) String content,
      @HiveType(typeId: 8) String url,
      @HiveType(typeId: 9) String imageUrl,
      @HiveType(typeId: 10) DateTime publishedDate});
}

/// @nodoc
class __$$_NewsCopyWithImpl<$Res> extends _$NewsModelCopyWithImpl<$Res, _$_News>
    implements _$$_NewsCopyWith<$Res> {
  __$$_NewsCopyWithImpl(_$_News _value, $Res Function(_$_News) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceName = null,
    Object? sourceLogoUrl = null,
    Object? category = null,
    Object? authorName = null,
    Object? authorImageUrl = null,
    Object? title = null,
    Object? description = null,
    Object? content = null,
    Object? url = null,
    Object? imageUrl = null,
    Object? publishedDate = null,
  }) {
    return _then(_$_News(
      sourceName: null == sourceName
          ? _value.sourceName
          : sourceName // ignore: cast_nullable_to_non_nullable
              as String,
      sourceLogoUrl: null == sourceLogoUrl
          ? _value.sourceLogoUrl
          : sourceLogoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      authorImageUrl: null == authorImageUrl
          ? _value.authorImageUrl
          : authorImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_News implements _News {
  _$_News(
      {@HiveField(0) required this.sourceName,
      @HiveField(1) required this.sourceLogoUrl,
      @HiveField(2) required this.category,
      @HiveField(3) required this.authorName,
      @HiveField(4) required this.authorImageUrl,
      @HiveField(5) required this.title,
      @HiveType(typeId: 6) required this.description,
      @HiveType(typeId: 7) required this.content,
      @HiveType(typeId: 8) required this.url,
      @HiveType(typeId: 9) required this.imageUrl,
      @HiveType(typeId: 10) required this.publishedDate});

  factory _$_News.fromJson(Map<String, dynamic> json) => _$$_NewsFromJson(json);

  @override
  @HiveField(0)
  final String sourceName;
  @override
  @HiveField(1)
  final String sourceLogoUrl;
  @override
  @HiveField(2)
  final String category;
  @override
  @HiveField(3)
  final String authorName;
  @override
  @HiveField(4)
  final String authorImageUrl;
  @override
  @HiveField(5)
  final String title;
  @override
  @HiveType(typeId: 6)
  final String description;
  @override
  @HiveType(typeId: 7)
  final String content;
  @override
  @HiveType(typeId: 8)
  final String url;
  @override
  @HiveType(typeId: 9)
  final String imageUrl;
  @override
  @HiveType(typeId: 10)
  final DateTime publishedDate;

  @override
  String toString() {
    return 'NewsModel(sourceName: $sourceName, sourceLogoUrl: $sourceLogoUrl, category: $category, authorName: $authorName, authorImageUrl: $authorImageUrl, title: $title, description: $description, content: $content, url: $url, imageUrl: $imageUrl, publishedDate: $publishedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_News &&
            (identical(other.sourceName, sourceName) ||
                other.sourceName == sourceName) &&
            (identical(other.sourceLogoUrl, sourceLogoUrl) ||
                other.sourceLogoUrl == sourceLogoUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorImageUrl, authorImageUrl) ||
                other.authorImageUrl == authorImageUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceName,
      sourceLogoUrl,
      category,
      authorName,
      authorImageUrl,
      title,
      description,
      content,
      url,
      imageUrl,
      publishedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsCopyWith<_$_News> get copyWith =>
      __$$_NewsCopyWithImpl<_$_News>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsToJson(
      this,
    );
  }
}

abstract class _News implements NewsModel {
  factory _News(
      {@HiveField(0) required final String sourceName,
      @HiveField(1) required final String sourceLogoUrl,
      @HiveField(2) required final String category,
      @HiveField(3) required final String authorName,
      @HiveField(4) required final String authorImageUrl,
      @HiveField(5) required final String title,
      @HiveType(typeId: 6) required final String description,
      @HiveType(typeId: 7) required final String content,
      @HiveType(typeId: 8) required final String url,
      @HiveType(typeId: 9) required final String imageUrl,
      @HiveType(typeId: 10) required final DateTime publishedDate}) = _$_News;

  factory _News.fromJson(Map<String, dynamic> json) = _$_News.fromJson;

  @override
  @HiveField(0)
  String get sourceName;
  @override
  @HiveField(1)
  String get sourceLogoUrl;
  @override
  @HiveField(2)
  String get category;
  @override
  @HiveField(3)
  String get authorName;
  @override
  @HiveField(4)
  String get authorImageUrl;
  @override
  @HiveField(5)
  String get title;
  @override
  @HiveType(typeId: 6)
  String get description;
  @override
  @HiveType(typeId: 7)
  String get content;
  @override
  @HiveType(typeId: 8)
  String get url;
  @override
  @HiveType(typeId: 9)
  String get imageUrl;
  @override
  @HiveType(typeId: 10)
  DateTime get publishedDate;
  @override
  @JsonKey(ignore: true)
  _$$_NewsCopyWith<_$_News> get copyWith => throw _privateConstructorUsedError;
}
