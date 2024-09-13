enum FailureType {
  info,
  alert,
  warning,
  error,
}

enum FailureDisplayType {
  dialog,
  toast,
  toastBanner,
}

class ErrorHandlerFailure {
  final String? title;
  final String message;
  final FailureType type;
  final FailureDisplayType displayType;
  final void Function()? onPress;

  ErrorHandlerFailure({
    this.title,
    required this.message,
    required this.type,
    required this.displayType,
    this.onPress,
  });

  factory ErrorHandlerFailure.fromJson(Map<String, dynamic> json) =>
      ErrorHandlerFailure(
        title: json['title'],
        message: json['message'],
        type: FailureType.values[json['type']],
        displayType: FailureDisplayType.values[json['displayType']],
      );
}
