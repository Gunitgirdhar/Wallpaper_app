
import 'coordinate_model.dart';
class AddressModel{
  String? state;
  String? postalCode;
  String? city;
  String? address;
  CoordinatesModel? coordinates;

  AddressModel({ this.state, this.address, this.city, this.postalCode, this.coordinates});

factory AddressModel.fromJson(Map<String,dynamic> json){
  return AddressModel(state: json['state'],
      address: json['address'],
      city: json['city'],
      postalCode: json['postalCode'],
       coordinates: CoordinatesModel.fromJson(json['coordinates'])
  );
  }

}