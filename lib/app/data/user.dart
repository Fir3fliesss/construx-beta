// import 'package:construx_beta/assets/models/identifier_model.dart';
import 'package:construx_beta/app/data/identifier_model.dart';


class User extends IdentifierModel {
  final String email, firstName, lastName;

  User(super.id, this.email, this.firstName, this.lastName);

  String get name => "$firstName $lastName";
}
