import 'package:dio/dio.dart';


abstract class Failure{
  final String errorMessage;

  const Failure({required this.errorMessage});
}
class ServerFailure extends Failure{
  ServerFailure({required super.errorMessage});


  factory ServerFailure.fromDioError(DioError dioError){
    switch(dioError.type){

      case DioErrorType.connectTimeout:
        return ServerFailure(errorMessage: 'Connection timeout with Server');
      case DioErrorType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with Server');
      case DioErrorType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with Server');
      case DioErrorType.response:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure(errorMessage: 'Request to Server was cancelled');
      case DioErrorType.other:
        if(dioError.message.contains('SocketException')){
          return ServerFailure(errorMessage: 'No Internet Connection');
        }
        return ServerFailure(errorMessage: 'Unexpected Error, Please try again!');
      default:
        return ServerFailure(errorMessage:"Opps There was an Error, Please try again!" );

    }


  }
  factory ServerFailure.fromResponse(int statusCode,dynamic responseData){
    if(statusCode==400 || statusCode==401 || statusCode==403 || statusCode==422){
      return ServerFailure(errorMessage: responseData['message']);
      
    }else if(statusCode==404){

      return ServerFailure(errorMessage:'Your request not found, Please try later!');
    }else if(statusCode==500 || statusCode>500){
      return ServerFailure(errorMessage:'Internal Server error, Please try later');

    }else{
      return ServerFailure(errorMessage:'Opps There was an Error, Please try again');
    }

  }


}
