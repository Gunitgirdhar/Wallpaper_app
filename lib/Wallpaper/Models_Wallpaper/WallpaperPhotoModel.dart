import 'package:dummy_api_user_tryingto_hit/Wallpaper/Models_Wallpaper/WallpaperModel.dart';

class WallpaperPhotoModel{
  num? height;
  String? avg_color;
  String? alt;
  num? id;
  bool? liked;
  String? photographer;
  num? photographer_id;
  String? photographer_url;
  String? url;
  num? width;
  srcModel? src;

  WallpaperPhotoModel(
      {this.height,
      this.avg_color,
      this.alt,
      this.id,
      this.liked,
      this.photographer,
      this.photographer_id,
      this.photographer_url,
      this.url,
      this.width,
      this.src});
  
  factory WallpaperPhotoModel.fromJson(Map<String,dynamic> json){
    return WallpaperPhotoModel(
      height: json['height'],
      avg_color: json['avg_color'],
      alt: json['alt'],
      id: json['id'],
      liked: json['liked'],
      photographer: json['photographer'],
      photographer_id: json['photographer_id'],
      photographer_url: json['photographer_url'],
      url: json['url'],
      width: json['width'],
      src: srcModel.fromJson(json['src']),
    );
  }
}