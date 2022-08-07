import 'package:practice_mvvm/data/response/status.dart';

class ApiResponse<Data> {
  Status? status;
  Data? data;
  String? message;
  //Constructor with sinthatic suger.
  ApiResponse(this.status, this.data, this.message);
  //another constructor which is redirect to
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}
