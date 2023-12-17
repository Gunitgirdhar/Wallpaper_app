import 'package:dummy_api_user_tryingto_hit/Wallpaper/Models_Wallpaper/LastWallpaperModel.dart';
import 'package:lottie/lottie.dart';

abstract class Wallpaperstate{}

class InitialState extends Wallpaperstate{}

class isloadingState extends Wallpaperstate{}

class LoadedState extends Wallpaperstate{
  LastWallPaperModel mwallpapermodel;
  LoadedState({required this.mwallpapermodel});
}

class ErrorState extends Wallpaperstate{
  String errormessage;
  ErrorState({required this.errormessage});
}

class WallpaperInternetErrorState extends Wallpaperstate{

  String errorinternetmessage;


  WallpaperInternetErrorState({required this.errorinternetmessage,});
}

