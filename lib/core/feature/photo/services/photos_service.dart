

import 'dart:io';

import 'package:dio/dio.dart';

import '../model/photo_model.dart';
import 'iphotos_service.dart';

part 'photos_service_path.dart';

class PhotosService extends IPhotosServices {
  PhotosService(Dio dio) : super(dio);

  @override
  Future<List<PhotoModel>> fetchAllPhotos() async {
    final response = await dio.get(_PhotoServicePath.PHOTOS.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => PhotoModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
