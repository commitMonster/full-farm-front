import 'package:full_farm/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

// ignore: must_be_immutable
class UserModel extends User {
  final String userId;
  final String password;
  final bool isAdmin;
  final String name;
  final String email;
  final String address;

  UserModel({
    @required this.userId,
    @required this.password,
    @required this.isAdmin,
    @required this.name,
    @required this.email,
    @required this.address
  }) : super(
      userId: userId,
      password: password,
      isAdmin: isAdmin,
      name: name,
      email: email,
      address: address,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      password: json['password'],
      isAdmin: json['isAdmin'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'password': password,
      'isAdmin': isAdmin,
      'name': name,
      'email': email,
      'address': address,
    };
  }
}
