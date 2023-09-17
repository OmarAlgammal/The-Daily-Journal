// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newsLoading,
    required TResult Function(String message) failedToLoadNews,
    required TResult Function(List<NewsModel> news, NewsCategories category)
        newsLoadedSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newsLoading,
    TResult? Function(String message)? failedToLoadNews,
    TResult? Function(List<NewsModel> news, NewsCategories category)?
        newsLoadedSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newsLoading,
    TResult Function(String message)? failedToLoadNews,
    TResult Function(List<NewsModel> news, NewsCategories category)?
        newsLoadedSuccessfully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsLoading value) newsLoading,
    required TResult Function(FailedToLoadNews value) failedToLoadNews,
    required TResult Function(NewsLoadedSuccessfully value)
        newsLoadedSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsLoading value)? newsLoading,
    TResult? Function(FailedToLoadNews value)? failedToLoadNews,
    TResult? Function(NewsLoadedSuccessfully value)? newsLoadedSuccessfully,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsLoading value)? newsLoading,
    TResult Function(FailedToLoadNews value)? failedToLoadNews,
    TResult Function(NewsLoadedSuccessfully value)? newsLoadedSuccessfully,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NewsLoadingCopyWith<$Res> {
  factory _$$NewsLoadingCopyWith(
          _$NewsLoading value, $Res Function(_$NewsLoading) then) =
      __$$NewsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewsLoadingCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsLoading>
    implements _$$NewsLoadingCopyWith<$Res> {
  __$$NewsLoadingCopyWithImpl(
      _$NewsLoading _value, $Res Function(_$NewsLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NewsLoading implements NewsLoading {
  _$NewsLoading();

  @override
  String toString() {
    return 'NewsState.newsLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newsLoading,
    required TResult Function(String message) failedToLoadNews,
    required TResult Function(List<NewsModel> news, NewsCategories category)
        newsLoadedSuccessfully,
  }) {
    return newsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newsLoading,
    TResult? Function(String message)? failedToLoadNews,
    TResult? Function(List<NewsModel> news, NewsCategories category)?
        newsLoadedSuccessfully,
  }) {
    return newsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newsLoading,
    TResult Function(String message)? failedToLoadNews,
    TResult Function(List<NewsModel> news, NewsCategories category)?
        newsLoadedSuccessfully,
    required TResult orElse(),
  }) {
    if (newsLoading != null) {
      return newsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsLoading value) newsLoading,
    required TResult Function(FailedToLoadNews value) failedToLoadNews,
    required TResult Function(NewsLoadedSuccessfully value)
        newsLoadedSuccessfully,
  }) {
    return newsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsLoading value)? newsLoading,
    TResult? Function(FailedToLoadNews value)? failedToLoadNews,
    TResult? Function(NewsLoadedSuccessfully value)? newsLoadedSuccessfully,
  }) {
    return newsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsLoading value)? newsLoading,
    TResult Function(FailedToLoadNews value)? failedToLoadNews,
    TResult Function(NewsLoadedSuccessfully value)? newsLoadedSuccessfully,
    required TResult orElse(),
  }) {
    if (newsLoading != null) {
      return newsLoading(this);
    }
    return orElse();
  }
}

abstract class NewsLoading implements NewsState {
  factory NewsLoading() = _$NewsLoading;
}

/// @nodoc
abstract class _$$FailedToLoadNewsCopyWith<$Res> {
  factory _$$FailedToLoadNewsCopyWith(
          _$FailedToLoadNews value, $Res Function(_$FailedToLoadNews) then) =
      __$$FailedToLoadNewsCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedToLoadNewsCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$FailedToLoadNews>
    implements _$$FailedToLoadNewsCopyWith<$Res> {
  __$$FailedToLoadNewsCopyWithImpl(
      _$FailedToLoadNews _value, $Res Function(_$FailedToLoadNews) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailedToLoadNews(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedToLoadNews implements FailedToLoadNews {
  _$FailedToLoadNews(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NewsState.failedToLoadNews(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedToLoadNews &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedToLoadNewsCopyWith<_$FailedToLoadNews> get copyWith =>
      __$$FailedToLoadNewsCopyWithImpl<_$FailedToLoadNews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newsLoading,
    required TResult Function(String message) failedToLoadNews,
    required TResult Function(List<NewsModel> news, NewsCategories category)
        newsLoadedSuccessfully,
  }) {
    return failedToLoadNews(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newsLoading,
    TResult? Function(String message)? failedToLoadNews,
    TResult? Function(List<NewsModel> news, NewsCategories category)?
        newsLoadedSuccessfully,
  }) {
    return failedToLoadNews?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newsLoading,
    TResult Function(String message)? failedToLoadNews,
    TResult Function(List<NewsModel> news, NewsCategories category)?
        newsLoadedSuccessfully,
    required TResult orElse(),
  }) {
    if (failedToLoadNews != null) {
      return failedToLoadNews(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsLoading value) newsLoading,
    required TResult Function(FailedToLoadNews value) failedToLoadNews,
    required TResult Function(NewsLoadedSuccessfully value)
        newsLoadedSuccessfully,
  }) {
    return failedToLoadNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsLoading value)? newsLoading,
    TResult? Function(FailedToLoadNews value)? failedToLoadNews,
    TResult? Function(NewsLoadedSuccessfully value)? newsLoadedSuccessfully,
  }) {
    return failedToLoadNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsLoading value)? newsLoading,
    TResult Function(FailedToLoadNews value)? failedToLoadNews,
    TResult Function(NewsLoadedSuccessfully value)? newsLoadedSuccessfully,
    required TResult orElse(),
  }) {
    if (failedToLoadNews != null) {
      return failedToLoadNews(this);
    }
    return orElse();
  }
}

abstract class FailedToLoadNews implements NewsState {
  factory FailedToLoadNews(final String message) = _$FailedToLoadNews;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedToLoadNewsCopyWith<_$FailedToLoadNews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewsLoadedSuccessfullyCopyWith<$Res> {
  factory _$$NewsLoadedSuccessfullyCopyWith(_$NewsLoadedSuccessfully value,
          $Res Function(_$NewsLoadedSuccessfully) then) =
      __$$NewsLoadedSuccessfullyCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NewsModel> news, NewsCategories category});
}

/// @nodoc
class __$$NewsLoadedSuccessfullyCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsLoadedSuccessfully>
    implements _$$NewsLoadedSuccessfullyCopyWith<$Res> {
  __$$NewsLoadedSuccessfullyCopyWithImpl(_$NewsLoadedSuccessfully _value,
      $Res Function(_$NewsLoadedSuccessfully) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
    Object? category = null,
  }) {
    return _then(_$NewsLoadedSuccessfully(
      null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as NewsCategories,
    ));
  }
}

/// @nodoc

class _$NewsLoadedSuccessfully implements NewsLoadedSuccessfully {
  _$NewsLoadedSuccessfully(final List<NewsModel> news, this.category)
      : _news = news;

  final List<NewsModel> _news;
  @override
  List<NewsModel> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  final NewsCategories category;

  @override
  String toString() {
    return 'NewsState.newsLoadedSuccessfully(news: $news, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsLoadedSuccessfully &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_news), category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsLoadedSuccessfullyCopyWith<_$NewsLoadedSuccessfully> get copyWith =>
      __$$NewsLoadedSuccessfullyCopyWithImpl<_$NewsLoadedSuccessfully>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newsLoading,
    required TResult Function(String message) failedToLoadNews,
    required TResult Function(List<NewsModel> news, NewsCategories category)
        newsLoadedSuccessfully,
  }) {
    return newsLoadedSuccessfully(news, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newsLoading,
    TResult? Function(String message)? failedToLoadNews,
    TResult? Function(List<NewsModel> news, NewsCategories category)?
        newsLoadedSuccessfully,
  }) {
    return newsLoadedSuccessfully?.call(news, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newsLoading,
    TResult Function(String message)? failedToLoadNews,
    TResult Function(List<NewsModel> news, NewsCategories category)?
        newsLoadedSuccessfully,
    required TResult orElse(),
  }) {
    if (newsLoadedSuccessfully != null) {
      return newsLoadedSuccessfully(news, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsLoading value) newsLoading,
    required TResult Function(FailedToLoadNews value) failedToLoadNews,
    required TResult Function(NewsLoadedSuccessfully value)
        newsLoadedSuccessfully,
  }) {
    return newsLoadedSuccessfully(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsLoading value)? newsLoading,
    TResult? Function(FailedToLoadNews value)? failedToLoadNews,
    TResult? Function(NewsLoadedSuccessfully value)? newsLoadedSuccessfully,
  }) {
    return newsLoadedSuccessfully?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsLoading value)? newsLoading,
    TResult Function(FailedToLoadNews value)? failedToLoadNews,
    TResult Function(NewsLoadedSuccessfully value)? newsLoadedSuccessfully,
    required TResult orElse(),
  }) {
    if (newsLoadedSuccessfully != null) {
      return newsLoadedSuccessfully(this);
    }
    return orElse();
  }
}

abstract class NewsLoadedSuccessfully implements NewsState {
  factory NewsLoadedSuccessfully(
          final List<NewsModel> news, final NewsCategories category) =
      _$NewsLoadedSuccessfully;

  List<NewsModel> get news;
  NewsCategories get category;
  @JsonKey(ignore: true)
  _$$NewsLoadedSuccessfullyCopyWith<_$NewsLoadedSuccessfully> get copyWith =>
      throw _privateConstructorUsedError;
}
