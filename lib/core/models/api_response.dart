abstract class ApiResponse<T>{
  final T? data;
  final bool? succeed;
  final String? message;

  ApiResponse({
    this.data,
    this.succeed,
    this.message,
});
}