import 'dart:ui';

abstract class WallpaperEvent{}

class GetsearchWallpaper extends WallpaperEvent{
  String? mcolor;
  String query;
  String page;
  GetsearchWallpaper({required this.query, this.mcolor,this.page="1"});
}

class GetCuratedWallpaper extends WallpaperEvent{
}