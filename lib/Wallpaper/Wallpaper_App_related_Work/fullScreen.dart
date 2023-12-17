import 'package:dummy_api_user_tryingto_hit/Bloc/wallpaper_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/wallpaper_bloc.dart';
import '../../Bloc/wallpaper_state.dart';
import 'Wallpaper_Detail_page.dart';

class SingleCOllectionWallpaper extends StatefulWidget {


  String? mcolor;
  String text;
  SingleCOllectionWallpaper({required this.text, this.mcolor});

  @override
  State<SingleCOllectionWallpaper> createState() => _SingleCOllectionWallpaperState();
}

class _SingleCOllectionWallpaperState extends State<SingleCOllectionWallpaper> {
   ScrollController? mcontroller;
  List listColor = [
    {
      "color": Colors.blue,
      "code": "2196F3"
    },
    {
      "color": Colors.deepOrange,
      "code": "FF5722"
    },
    {
      "color": Colors.black,
      "code": "000000"
    },
    {
      "color": Colors.white,
      "code": "ffffff"
    },
    {
      "color": Colors.green,
      "code": "4CAF50"
    },
    {
      "color": Colors.yellow,
      "code": "FFEB3B"
    },
  ];
  @override
  void initState() {
    super.initState();

    context.read<WallpaperBloc>().add(GetsearchWallpaper(query:widget.text.replaceAll(" ", "+"),mcolor: widget.mcolor));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listColor.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    context.read<WallpaperBloc>().add(GetsearchWallpaper(query:widget.text.replaceAll(" ", "+"),mcolor: listColor[index]['code'] ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: listColor[index]['color'],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          ),


        Expanded(
          child: BlocBuilder<WallpaperBloc, Wallpaperstate>(
            builder: (context, state) {
              if (state is isloadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ErrorState) {
                return Center(
                  child: Text("Error: ${state.errormessage}"),
                );
              } else if (state is LoadedState) {
                return GridView.builder(
                  controller: mcontroller,
                  itemCount: state.mwallpapermodel.photos!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      crossAxisSpacing:2 ,
                      mainAxisSpacing:11,
                      childAspectRatio: 16/12 ),
                  itemBuilder: (context, index) {
                    var eachWallpaper=state.mwallpapermodel.photos![index].src!.portrait!;

                    mcontroller=ScrollController();
                    mcontroller!.addListener(() {
                    late  int Perpage=1;
                    if(mcontroller!.position.pixels==mcontroller!.position.maxScrollExtent){
                      print("hi");
                      Perpage=Perpage+1;
                     var data= context.read<WallpaperBloc>().add(GetsearchWallpaper(query:widget.text.replaceAll(" ", "+"),mcolor: widget.mcolor,page: "Perpage"));


                    }
                    });

                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WallpaperDetailPage(mUrl: '${eachWallpaper}',),));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(image: NetworkImage(eachWallpaper),fit: BoxFit.fill)
                        ),
                      ),
                    );
                  },);
              }
              return Container();
            },
          ),
        )
        ],
      )
    );


  }
}
