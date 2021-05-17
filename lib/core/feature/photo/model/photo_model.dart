import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel {
  PhotoModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return _$PhotoModelFromJson(json);
  }

  int? albumId;
  int? id;
  String? thumbnailUrl;
  String? title;
  String? url;
  @JsonKey(ignore: true)
  int count = 0;
  @JsonKey(ignore: true)
  double price = 25;

  Map<String, dynamic> toJson() {
    return _$PhotoModelToJson(this);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoModel &&
          runtimeType == other.runtimeType &&
          albumId == other.albumId &&
          id == other.id &&
          thumbnailUrl == other.thumbnailUrl &&
          title == other.title &&
          url == other.url &&
          price == other.price;

  @override
  int get hashCode =>
      albumId.hashCode ^
      id.hashCode ^
      thumbnailUrl.hashCode ^
      title.hashCode ^
      url.hashCode ^
      count.hashCode ^
      price.hashCode;
}
