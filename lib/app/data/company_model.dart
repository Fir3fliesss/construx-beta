import 'dart:convert';

CompanyModel companyModelFromJson(String str) => CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  CompanyModel({
    required this.id,
    required this.name,
    required this.city,
    required this.address,
    required this.personInCharge,
    required this.contactInfo,
  });

  final int id;
  String name;
  String city;
  String address;
  String personInCharge;
  String contactInfo;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    id: json["id"],
    name: json["name"],
    city: json["city"],
    address: json["address"],
    personInCharge: json["personInCharge"],
    contactInfo: json["contactInfo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "city": city,
    "address": address,
    "personInCharge": personInCharge,
    "contactInfo": contactInfo,
  };
}
