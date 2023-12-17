class CoordinatesModel{
  num? lat;
  num? lng;

  CoordinatesModel({  this.lat, this.lng});

  factory CoordinatesModel.fromJson(Map<String,dynamic> json){
    return CoordinatesModel(lat: json['lat'], lng: json['lng']);
  }
}