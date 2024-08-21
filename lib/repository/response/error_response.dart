class ErrorResponse {
  ErrorResponse({required this.error});

  late final String error;

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    error = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = error;
    return data;
  }
}