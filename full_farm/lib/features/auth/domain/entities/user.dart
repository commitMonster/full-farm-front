import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userId;
  final String password;
  final bool isAdmin;
  final String name;
  final String email;
  final String address;

  User({
    this.userId,
    this.password,
    this.isAdmin,
    this.name,
    this.email,
    this.address
  });

  @override
  List<Object> get props => [
    userId,
    password,
    isAdmin,
    name,
    email,
    address
  ];
}
