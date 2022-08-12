abstract class IError {
  final int? status;
  final String? message;

  IError({
    this.status,
    this.message,
  });
}

class Error extends IError {
  Error({
    super.status,
    super.message,
  });
}
