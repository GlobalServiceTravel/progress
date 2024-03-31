class RegisterState {
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final String errorMessage;
  final int statusCode;

  RegisterState({
    required this.errorMessage,
    required this.isError,
    required this.isLoading,
    required this.isSuccess,
    required this.statusCode,
  });

  // initial State Method,
  factory RegisterState.initialState() {
    return RegisterState(
      errorMessage: "",
      isError: false,
      isLoading: false,
      isSuccess: false,
      statusCode: 000,
    );
  }

  RegisterState copyWith({
    String? errorMessage,
    bool? isError,
    bool? isLoading,
    bool? isSuccess,
    int? statusCode,
  }) {
    return RegisterState(
      errorMessage: errorMessage ?? this.errorMessage,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}
