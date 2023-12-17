import 'package:dummy_api_user_tryingto_hit/Bloc/wallpaper_event.dart';
import 'package:dummy_api_user_tryingto_hit/Bloc/wallpaper_state.dart';
import 'package:dummy_api_user_tryingto_hit/Wallpaper/Models_Wallpaper/LastWallpaperModel.dart';
import 'package:dummy_api_user_tryingto_hit/api/apiLinks.dart';
import 'package:dummy_api_user_tryingto_hit/api/api_helper.dart';
import 'package:dummy_api_user_tryingto_hit/api/my_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class WallpaperBloc extends Bloc<WallpaperEvent,Wallpaperstate>{
  ApiHelper apiHelper;
  WallpaperBloc({required this.apiHelper}): super(InitialState()){
    on<GetCuratedWallpaper>((event, emit) async {
      emit(isloadingState());

      try {
        var res = await apiHelper.getApi(url: "${Apiurls.CuratedWallpaperUrl}");
        emit(LoadedState(mwallpapermodel: LastWallPaperModel.fromJson(res)));
      }
      catch (e) {
        print(e);
        if (e is FetchDataException) {

          emit(WallpaperInternetErrorState(errorinternetmessage: e.toString() ));
          //emit(LottieAnimation(ani: Lottie.asset("assets/Lottie/NoInternet.json") as Lottie));
        }
        else {
          emit(ErrorState(errormessage: e.toString()));
        }
      }
    }
    );

   ////////////////////////////////////////////Searchig of Wallpaper////////////////////////////////////////////////////
    on<GetsearchWallpaper>((GetsearchWallpaper event, emit) async{
      emit(isloadingState());

      try{
        var output=await apiHelper.getApi(url: "https://api.pexels.com/v1/search?query=${event.query}&color=${event.mcolor}&per_page=10&page=${event.page}",mheader:{"Authorization":"iFYFDUDCurICyDFOwqHcnRL70gbbOol2jfZnsJhO93CsmfdyvOcXQQjJ"} );
          emit(LoadedState(mwallpapermodel: LastWallPaperModel.fromJson(output)));

        } catch(e){
        if(e is FetchDataException){
          emit(WallpaperInternetErrorState(errorinternetmessage: e.toString()));
        }
        else{
          emit(ErrorState(errormessage: e.toString()));
        }
          }
    });
  }

}