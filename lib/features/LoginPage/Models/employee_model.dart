class EmployeeModel {
  final String employeeName;
  final String employeeEmail;
  final String phoneNumber;

  EmployeeModel({
    required this.employeeEmail,
    required this.employeeName,
    required this.phoneNumber,
  });

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      employeeName: map['employeeName'],
      employeeEmail: map['employeeEmail'],
      phoneNumber: map['phoneNumber'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'employeeName': employeeName,
      'employeeEmail': employeeEmail,
      'phoneNumber': phoneNumber,
    };
  }

  @override
  String toString() {
    return 'EmployeeModel{employeeName: $employeeName, employeeEmail: $employeeEmail, phoneNumber: $phoneNumber}';
  }
}

class EmployeeModelState {
  final bool isError;
  final bool isSuccess;
  final bool isLoading;
  final List<EmployeeModel> employeeList;
  final String errorMessage;

  EmployeeModelState({
    required this.employeeList,
    required this.errorMessage,
    required this.isError,
    required this.isLoading,
    required this.isSuccess,
  });

  // Initial state method
  factory EmployeeModelState.initialState() {
    return EmployeeModelState(
      employeeList: [],
      errorMessage: '',
      isError: false,
      isLoading: false,
      isSuccess: false,
    );
  }

  // CopyWith method to create a new instance of the class with updated values
  EmployeeModelState copyWith({
    List<EmployeeModel>? employeeList,
    String? errorMessage,
    bool? isError,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return EmployeeModelState(
      employeeList: employeeList ?? this.employeeList,
      errorMessage: errorMessage ?? this.errorMessage,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
