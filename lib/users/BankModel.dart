class BankModel{
  String? iban;
  String? currency;
  String? cardType;
  String? cardNumber;
  String? cardExpire;
  BankModel({ this.iban, this.cardExpire, this.cardNumber, this.cardType, this.currency});


  factory BankModel.fromjson(Map<String,dynamic> json){
    return BankModel(iban: json['iban'],
        cardExpire: json['cardExpire'],
        cardNumber: json['cardNumber'],
        cardType: json['cardType'],
        currency: json['currency']);
  }
}