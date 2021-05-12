import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:market_sebet/core/feature/photo/model/photo_model.dart';
import 'package:market_sebet/core/feature/photo/services/iphotos_service.dart';
import 'package:market_sebet/core/feature/photo/services/photos_service.dart';
import 'package:market_sebet/core/network/application_constant.dart';
import 'package:mobx/mobx.dart';
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
    Logger().wtf(response);

    photos = response;
  }

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
