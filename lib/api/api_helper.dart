import 'dart:convert';
import 'dart:io';
import 'package:dummy_api_user_tryingto_hit/api/my_exception.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;
class ApiHelper{
  Future<dynamic> getApi({required String url,Map<String,String>? mheader})async{
 try{
   var res=await http.get(Uri.parse(url),headers: mheader ?? {"Authorization" : "iFYFDUDCurICyDFOwqHcnRL70gbbOol2jfZnsJhO93CsmfdyvOcXQQjJ"});
  return returnErrorState(res);
 }on SocketException{
   throw FetchDataException(body: "Internet Error");
 }

  }
  dynamic returnErrorState(http.Response res){
    switch(res.statusCode){

      case 200:
          return jsonDecode(res.body);
          
      case 400:
        throw BadRequestException(body: res.body.toString());

      case 407:
        throw UnauthorizedException(body: res.body.toString());

      case 500:
        default:
        throw InvalidInputException(body: res.body.toString());
        }

    }
  }
