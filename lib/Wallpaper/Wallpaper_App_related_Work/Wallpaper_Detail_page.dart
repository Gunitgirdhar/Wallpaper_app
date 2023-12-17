import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';

class WallpaperDetailPage extends StatelessWidget {
  String mUrl;
  late double mHeight;
  late double  mWidth;
   WallpaperDetailPage({required this.mUrl});

  @override
  Widget build(BuildContext context) {
    mWidth=MediaQuery.of(context).size.width;
    mHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(mUrl), fit: BoxFit.fill),

              )
          ),
          Positioned(
            top: 40,
            left: 25,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white54,
                    shape: BoxShape.circle

                ),
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                   DownloadWallaper();
                  },
                  child: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        shape: BoxShape.circle

                    ),
                    child: Icon(Icons.download_for_offline),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setWallpaper();
                  },
                  child: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        shape: BoxShape.circle

                    ),
                    child: Icon(Icons.save),
                  ),
                ),
              ],
            ),
          )
        ],
      ),

    );

  }
  void DownloadWallaper()async{
     GallerySaver.saveImage(mUrl).then((value){
      print(value);
    });
  }

  void setWallpaper(){
    var downloadStream = Wallpaper.imageDownloadProgress(mUrl);

    downloadStream.listen((event) {
      print(event.toString());
    }, onDone:() async{
      print("Wallpaper downloaded in app cache..");
      //setting here  wallpaper here
      var check = await Wallpaper.homeScreen(
          width: mWidth,
          height: mHeight,
          options: RequestSizeOptions.RESIZE_EXACT
      );
      print("Wallpaper: $check");
    }, onError: (e){
      print("Error: $e");
    });
  }

}
