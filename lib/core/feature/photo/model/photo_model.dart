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

  Map<String, dynamic> toJson() {
    
    return _$PhotoModelToJson(this);
  }
}
