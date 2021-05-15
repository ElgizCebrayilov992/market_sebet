import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../../network/application_constant.dart';
import '../model/photo_model.dart';
import '../services/iphotos_service.dart';
import '../services/photos_service.dart';

part 'photo_view_model.g.dart';

class PhotosViewModel = _PhotosViewModelBase with _$PhotosViewModel;

abstract class _PhotosViewModelBase with Store {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: ApplicationConstant.instance.baseUrl),
  );

  late final IPhotosServices photosServices;
  @observable
  List<PhotoModel> photos = [];

  _PhotosViewModelBase() {
    photosServices = PhotosService(_dio);
    fetchAllPhotos();
  }

  @action
  Future<void> fetchAllPhotos() async {
    changeLoading();
    final response = await photosServices.fetchAllPhotos();
    changeLoading();
    

    photos = response;
  }

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
