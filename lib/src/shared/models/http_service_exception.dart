import 'failure.dart';

class HttpServiceException extends Failure {
  HttpServiceException({required this.success, required this.message})
      : super(message, success: success);

  final bool success;
  final String message;

  factory HttpServiceException.fromJson(Map<String, dynamic> json) =>
      HttpServiceException(
        success: json["success"],
        message: json["message"],
      );
}
