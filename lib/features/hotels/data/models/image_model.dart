import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  final String large;
  final String small;

  ImageModel({required this.large, required this.small});

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Image toEntity() => Image(large: large, small: small);
  
  factory ImageModel.fromEntity(Image? image) {
    if (image == null) {
      return ImageModel(large: '', small: '');
    }
    return ImageModel(large: image.large, small: image.small);
  }
}
