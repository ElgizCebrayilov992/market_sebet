import 'package:dio/dio.dart';

import '../model/photo_model.dart';

abstract class IPhotosServices {
  final Dio dio;

  IPhotosServices(this.dio);
  Future<List<PhotoModel>> fetchAllPhotos();
}
