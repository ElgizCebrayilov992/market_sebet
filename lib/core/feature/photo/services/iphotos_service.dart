import 'package:dio/dio.dart';
import 'package:market_sebet/core/feature/photo/model/photo_model.dart';

abstract class IPhotosServices {
  final Dio dio;

  IPhotosServices(this.dio);
  Future<List<PhotoModel>> fetchAllPhotos();
}
