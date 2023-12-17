
import 'package:dummy_api_user_tryingto_hit/users/AddressModel.dart';
import 'package:dummy_api_user_tryingto_hit/users/BankModel.dart';
import 'package:dummy_api_user_tryingto_hit/users/CompantModel.dart';
import 'package:dummy_api_user_tryingto_hit/users/HairModel.dart';

class UserModel{
  num? age;
  AddressModel? address;
  BankModel? bank;
  String? birthDate;
  String? bloodGroup;
  CompanyModel? company;
  String? domain;
  String? gender;
  String? firstName;
  String? eyeColor;
  String? email;
  String? ein;
  HairModel? hair;
  num? height;
  num? id;
  String? image;
  String? ip;
  String? lastName;
  String? macAddress;
  String? maidenName;
  String? password;
  String? phone;
  String? ssn;
  String? university;
  String? userAgent;
  String? username;
  num? weight;

  UserModel({
       this.age,
       this.address,
       this.bank,
       this.birthDate,
       this.bloodGroup,
       this.company,
       this.domain,
       this.gender,
       this.firstName,
       this.eyeColor,
       this.email,
       this.ein,
       this.hair,
       this.height,
       this.id,
       this.image,
       this.ip,
       this.lastName,
       this.macAddress,
       this.maidenName,
       this.password,
       this.phone,
       this.ssn,
       this.university,
       this.userAgent,
       this.username,
       this.weight});

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(age: json['age'],
        address: AddressModel.fromJson(json['address']),
        bank: BankModel.fromjson(json['bank']),
        birthDate: json['birthDate'],
        bloodGroup: json['bloodGroup'],
        company: CompanyModel.fronJson(json['company']),
        domain: json['domain'],
        gender: json['gender'],
        firstName: json['firstName'],
        eyeColor: json['eyeColor'],
        email: json['email'],
        ein: json['ein'],
        hair: HairModel.fromJson(json['hair']),
        height: json['height'],
        id: json['id'],
        image: json['image'],
        ip: json['ip'],
        lastName: json['lastName'],
        macAddress: json['macAddress'],
        maidenName: json['maidenName'],
        password: json['password'],
        phone: json['phone'],
        ssn: json['ssn'],
        university: json['university'],
        userAgent: json['userAgent'],
        username: json['username'],
        weight: json['weight']
    );
  }
}