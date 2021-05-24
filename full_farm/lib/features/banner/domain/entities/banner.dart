import 'package:meta/meta.dart';
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
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.type,
    @required this.image,
    @required this.activation,
    @required this.startDate,
    @required this.endDate,
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
