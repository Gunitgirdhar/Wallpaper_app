class Apiurls{
 String? query;
  Apiurls({this.query});

  // Base URLS
  static const Base_url="https://api.pexels.com/v1/";

  //static const searchWallaperUrl="${Base_url}search?query=nature&per_page=1";

  static const CuratedWallpaperUrl="${Base_url}curated?per_page=10";

}