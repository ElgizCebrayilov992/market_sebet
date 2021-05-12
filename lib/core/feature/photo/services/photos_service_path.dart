part of 'photos_service.dart';

enum _PhotoServicePath { PHOTOS }

extension PhotoServicePathExtension on _PhotoServicePath {
  String get rawValue {
    switch (this) {
      case _PhotoServicePath.PHOTOS:
        return 'photos';
    }
  }
}
