import 'package:dummy_api_user_tryingto_hit/Bloc/wallpaper_bloc.dart';
import 'package:dummy_api_user_tryingto_hit/Bloc/wallpaper_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../Bloc/wallpaper_state.dart';
import 'fullScreen.dart';

class WallpaperPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WallpaperPageState();
}

class WallpaperPageState extends State<WallpaperPage> {
  /* List listImage = [
    'assets/images/natural/img_natural16.jpg',
    'assets/images/flower/img_flower.jpg',
    'assets/images/food/img_food.avif',
    'assets/images/flower/img_flower10.avif',
    'assets/images/natural/img_natural7.webp',
    'assets/images/animals/img_animals2.avif',
    'assets/images/food/img_food3.avif',
    'assets/images/flower/img_flower20.avif',
    'assets/images/film/img_film16.png',
    'assets/images/flower/img_flower23.avif',
    'assets/images/sports/img_sports.avif',
    'assets/images/street/img_street10.avif',
    'assets/images/natural/img_natural12.jpg',
    'assets/images/animals/img_animals3.avif',
    'assets/images/natural/img_natural4.jpg',
    'assets/images/sports/img_sports13.avif',
    'assets/images/film/img_film10.png',
  ];*/

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

  /*List<Map<String, dynamic>> categoriesName = [
    {
      'name': "Nature",
      'img_cat': 'assets/images/natural/img_natural12.jpg',
    },
    {
      'name': "Flowers",
      'img_cat': 'assets/images/flower/img_flower23.avif',
    },
    {
      'name': "Sports",
      'img_cat': 'assets/images/sports/img_sports20.avif',
    },
    {
      'name': "Film",
      'img_cat': 'assets/images/film/img_film11.webp',
    },
    {
      'name': "Street Photography",
      'img_cat': 'assets/images/street/img_street10.avif',
    },
    {
      'name': "Animals",
      'img_cat': 'assets/images/animals/img_animals14.avif',
    },
    {
      'name': "Fashion & Beauty",
      'img_cat': 'assets/images/street/img_street15.avif',
    },
    {
      'name': "Food & Drink",
      'img_cat': 'assets/images/food/img_food18.avif',
    },
    {'name': "Travel", 'img_cat': 'assets/images/street/img_street18.avif'},
    {
      'name': "Health & Wellness",
      'img_cat': 'assets/images/sports/img_sports19.avif'
    },
    {
      'name': "Arts & Culture",
      'img_cat': 'assets/images/film/img_film6.avif',
    },
    // {'name': "Flowers", 'img_cat': 'assets/images/img_natural13.jpg'},
  ];*/

  @override
  void initState() {
    super.initState();
    context.read<WallpaperBloc>().add(GetCuratedWallpaper());
  }

  @override
  Widget build(BuildContext context) {
    var controller1 = TextEditingController();
    // listImage.shuffle();
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 46, 220, 255),
        body: Stack(
          //* Stack to take a Gradient Color
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffE8D7DA),
                    Color(0xffA0D3D6),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Container(
                          //* Find the Wallpaper search box..
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            color: const Color(0xffDBEBF1),
                            borderRadius: BorderRadius.circular(15),

                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 8,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: TextField(
                            controller: controller1,
                            decoration: InputDecoration(
                              hintText: 'Find Wallpaper..',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 152, 152, 152),
                              ),
                              suffixIcon:
                                  InkWell(
                                      onTap: (){
                                        var data=controller1.text.toString();
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SingleCOllectionWallpaper(text: data),));
                                      },
                                      child: Icon(Icons.image_search)),
                              suffixIconColor: Color.fromARGB(255, 172, 172, 172),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffDBEBF1),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffDBEBF1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      //* Best if the Month Image
                      const Text(
                        'Best of the month',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 300,
                        child: BlocBuilder<WallpaperBloc, Wallpaperstate>(
                          builder: (context, state) {
                            if (state is isloadingState) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if(state is WallpaperInternetErrorState){
                              return Center(child: Column(
                                children: [
                                  Lottie.asset( "assets/Lottie/NoInternet.json"),
                                  SizedBox(height: 5,),
                                   Text("${state.errorinternetmessage}"),
                                ],
                              ),);
                            }
                            else if (state is ErrorState) {
                              return Center(
                                child: Text("${state.errormessage}"),
                              );
                            }

                            else if (state is LoadedState) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.mwallpapermodel.photos!.length,
                                itemBuilder: (context, index) {
                                  var eachWall = state.mwallpapermodel
                                      .photos![index].src!.portrait!;
                                  return Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(eachWall),
                                      ),
                                    ),
                                    // child: Image.asset(listImage[index]),
                                  );
                                },
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      //* Color List

                      const Text(
                        'The color tone',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listColor.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SingleCOllectionWallpaper(text: controller1.text.isNotEmpty ? controller1.text.toString() : "car",mcolor: listColor[index]['code'], ),));
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
                      const SizedBox(
                        height: 20,
                      ),

                      //* All Category

                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<WallpaperBloc, Wallpaperstate>(
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
                            return Expanded(
                              child: GridView.builder(
                                itemCount: state.mwallpapermodel.photos!.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                                    crossAxisSpacing:2 ,
                                    mainAxisSpacing:11,
                                    childAspectRatio: 16/12 ),
                                itemBuilder: (context, index) {
                                  var eachWallpaper=state.mwallpapermodel.photos![index].src!.portrait!;

                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        image: DecorationImage(image: NetworkImage(eachWallpaper),fit: BoxFit.fill)

                                    ),
                                    child: Center(child: Text("${state.mwallpapermodel.photos![index].alt!}"),),
                                  );
                                },),
                            );
                          }
                          return Container();
                        },
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
