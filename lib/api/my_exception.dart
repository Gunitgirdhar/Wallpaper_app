class MyException implements Exception {
  String title;
  String body;

  MyException({required this.body, required this.title});

  String toString() {
    return "$title : $body";
  }
}

  class FetchDataException extends MyException{
  FetchDataException({required String body}):super(title: "Data Communication Error",body: body);
  }

class BadRequestException extends MyException{
  BadRequestException({required String body}):super(title: "Invalid Request Error",body: body);
}

class UnauthorizedException extends MyException{
  UnauthorizedException({required String body}):super(title: "Data Communication Error",body: body);
}

class InvalidInputException extends MyException{
  InvalidInputException({required String body}):super(title: "Data Communication Error",body: body);
}
