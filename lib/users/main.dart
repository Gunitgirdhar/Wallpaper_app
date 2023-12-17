import 'dart:convert';

import 'package:dummy_api_user_tryingto_hit/Wallpaper/learning_fetchingData_singleScreen_setstate.dart/getting%20data.dart';
import 'package:dummy_api_user_tryingto_hit/users/DataUserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetData(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   late Future<DataUserModel> data;
   @override
  void initState() {
    super.initState();
    data=getUserDetail();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DataUserModel>(
        future: data,
        builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        else{
          if(snapshot.hasError){
            print("Hrnk");
            return Center(child: Text("${snapshot.error}"),);
          }
          else if(snapshot.data! != null){
            return ListView.builder(
              itemCount: snapshot.data!.users!.length,
              itemBuilder: (context, index) {
              return ListTile(
                 leading: Text("${index+1}"),
                title: Text("${snapshot.data!.users![index].email}"),
                subtitle: Text("${snapshot.data!.users![index].address}"),
              ) ;
            },);
          }
          else{
            Container();
          }
        }
        return Container();
      },),
    );
  }
}
Future<DataUserModel> getUserDetail()async{
  var res= await http.get(Uri.parse("https://dummyjson.com/users"));
  if(res.statusCode==200){
    //print(res.body);
    var json=jsonDecode(res.body);
    return DataUserModel.fromJson(json);
  }
  else{
    return DataUserModel();
  }

}

