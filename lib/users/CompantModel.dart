
import 'package:dummy_api_user_tryingto_hit/users/AddressModel.dart';

class CompanyModel{
  String? title;
  String? name;
  String? department;
  AddressModel? address;

  CompanyModel({ this.title, this.name, this.address, this.department});
  
  factory CompanyModel.fronJson(Map<String,dynamic> json){
    return CompanyModel(title: json['title'],
        name: json['name'],
        address: AddressModel.fromJson(json['address']),
        department: json['department']);
  }
}