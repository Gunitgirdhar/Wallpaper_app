import 'WallpaperPhotoModel.dart';

class LastWallPaperModel{
  String? next_page;
  num? page;
  num? per_page;
  num? total_results;
  List<WallpaperPhotoModel>? photos;

  LastWallPaperModel(
      {this.next_page,
      this.page,
      this.per_page,
      this.total_results,
      this.photos});



  factory LastWallPaperModel.fromJson(Map<String,dynamic> json){
    List<WallpaperPhotoModel> mphoto=[];
    for(Map<String,dynamic> eachphoto in json['photos']){
      mphoto.add(WallpaperPhotoModel.fromJson(eachphoto));
    }

    return LastWallPaperModel(
      next_page: json['next_page'],
      page: json['page'],
      per_page: json['per_page'],
      total_results: json['total_results'],
      photos:mphoto
    );
  }



}