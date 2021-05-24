import 'package:full_farm/features/banner/domain/entities/banner.dart';
import 'package:meta/meta.dart';

class BannerModel extends Banner {
  final int id;
  final String title;
  final String description;
  final int type;
  final List<String> image;
  final bool activation;
  final String startDate;
  final String endDate;

  BannerModel({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.type,
    @required this.image,
    @required this.activation,
    @required this.startDate,
    @required this.endDate,
  }) : super(
    id: id,
    title: title,
    description: description,
    type: type,
    image: image,
    activation: activation,
    startDate: startDate,
    endDate: endDate,
  );

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      image: json['image'],
      activation: json['activation'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'image': image,
      'activation': activation,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
