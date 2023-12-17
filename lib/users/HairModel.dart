class HairModel{
  String? color;
  String? type;
  HairModel({ this.color, this.type});

  factory HairModel.fromJson(Map<String,dynamic> json){
    return HairModel(color: json['color'], type: json['type']);
  }
}