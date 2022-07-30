class SuccessOrMessageModel {
  bool isError;
  String message;

  SuccessOrMessageModel({this.message = "Something went wrong", this.isError = true});
}