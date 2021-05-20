import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  final int id;
  final String title;
  final String description;
  final int type;
  final List<String> image;
  final bool activation;
  final String startDate;
  final String endDate;

  Banner({
    this.id,
    this.title,
    this.description,
    this.type,
    this.image,
    this.activation,
    this.startDate,
    this.endDate,
  });

  @override
  List<Object> get props => [
    id,
    title,
    description,
    type,
    image,
    activation,
    startDate,
    endDate,
  ];
}
