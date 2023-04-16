import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@Freezed()
@HiveType(typeId: 0)
class NewsModel with _$NewsModel{

  factory NewsModel({
    @HiveField(0)
    required String sourceName,
    @HiveField(1)
    required String sourceLogoUrl,
    @HiveField(2)
    required String category,
    @HiveField(3)
    required String authorName,
    @HiveField(4)
    required String authorImageUrl,
    @HiveField(5)
    required String title,
    @HiveType(typeId: 6)
    required String description,
    @HiveType(typeId: 7)
    required String content,
    @HiveType(typeId: 8)
    required String url,
    @HiveType(typeId: 9)
    required String imageUrl,
    @HiveType(typeId: 10)
    required DateTime publishedDate,
}) = _News;

  factory NewsModel.fromJson(Map<String, dynamic> map) => _$NewsModelFromJson(map);
}
