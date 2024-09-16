class ApiException implements Exception {
  String errorMessage ;
  ApiException({required this.errorMessage});
}