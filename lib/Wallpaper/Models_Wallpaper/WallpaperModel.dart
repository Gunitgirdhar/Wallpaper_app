class srcModel{
  String? tiny;
  String? small;
  String? portrait;
  String? original;
  String? medium;
  String? large2x;
  String? large;
  String? landscape;

  srcModel({this.tiny,
    this.small,
    this.original,
    this.medium,
    this.large2x,
    this.large,
    this.portrait,
    this.landscape});

  factory srcModel.fromJson(Map<String,dynamic> json){
    return srcModel(
      tiny: json['tiny'],
      small: json['small'],
      original: json['original'],
      medium: json['medium'],
      large2x: json['large2x'],
      large: json['large'],
      landscape: json['landscape'],
      portrait:json['portrait']
    );
  }

}