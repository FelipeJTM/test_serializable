import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'my_user.g.dart';

@JsonSerializable(explicitToJson: true)
class MyUser {
  MyUser(this.name, this.address);

  String name;
  Address address;

  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);
  Map<String, dynamic> toJson() => _$MyUserToJson(this);
}