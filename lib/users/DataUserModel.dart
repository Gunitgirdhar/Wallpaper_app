import 'package:dummy_api_user_tryingto_hit/users/UserModel.dart';

class DataUserModel {
  num? limit;
  num? skip;
  num? total;
  List<UserModel>? users;

  DataUserModel({ this.limit,this.total, this.skip, this.users});

  factory DataUserModel.fromJson(Map<String,dynamic> json){
    //print("hello");
    List<UserModel> muser=[];
    for(Map<String,dynamic> melement in json['users']){
      UserModel usermodel=UserModel.fromJson(melement);
      muser.add(usermodel);
    }
    return DataUserModel(limit: json['limit'], total: json['total'], skip: json['skip'],
        users:muser
    );
  }

}