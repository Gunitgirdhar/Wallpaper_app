import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models_Wallpaper/LastWallpaperModel.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  String? dataofField;
  var controller1=TextEditingController();
   late Future<LastWallPaperModel> photoModel;
  @override
  void initState() {
    super.initState();
     photoModel=getData("Lion");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<LastWallPaperModel>(
        future: photoModel,
        builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        else{
          if(snapshot.hasError){
            return Center(child: Text("${snapshot.hasError}"),);
          }
          else if(snapshot.hasData){
            return Column(
              children: [
                Row(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width:600,
                      child: TextField(

                        controller: controller1,
                      ),
                    ),
            ElevatedButton(onPressed: (){
              dataofField=controller1.text.toString();
              print(dataofField);
              photoModel=getData(dataofField!);
              setState(() {

              });
            },   child: Text("Search"))
                  ],
                ),

                SizedBox(height: 20,),

                Expanded(
                  child: GridView.builder(
                  itemCount: snapshot.data!.photos!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      crossAxisSpacing:2 ,
                      mainAxisSpacing:11,
                      childAspectRatio: 16/12 ),
                  itemBuilder: (context, index) {
                    var eachWallpaper=snapshot.data!.photos![index].src!.landscape!;

                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(image: NetworkImage(eachWallpaper),fit: BoxFit.fill)
                      ),
                    );
                  },),
                )],
            );
          }
        }
        return Container();
      },),
    );
  }
}
Future<LastWallPaperModel> getData(String query)async{
   var res= await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=20"),headers: {"Authorization":"iFYFDUDCurICyDFOwqHcnRL70gbbOol2jfZnsJhO93CsmfdyvOcXQQjJ"});

   if(res.statusCode==200){
      var mData=jsonDecode(res.body);
      return LastWallPaperModel.fromJson(mData);
   }
   else{
     return LastWallPaperModel();
   }
}
