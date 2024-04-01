// ignore_for_file: non_constant_identifier_names

class EmployeeModel {
  final String employeeName;
  final String date_of_birth;
  final String gender;
  final String employeeEmail;
  final String phoneNumber;
  final String department;
  final String short_intro;
  final String password;
  EmployeeModel(
      {required this.employeeEmail,
      required this.employeeName,
      required this.phoneNumber,
      required this.date_of_birth,
      required this.department,
      required this.gender,
      required this.password,
      required this.short_intro});

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
        employeeName: map['employeeName'],
        employeeEmail: map['employeeEmail'],
        phoneNumber: map['phoneNumber'],
        date_of_birth: map["date_of_birth"],
        department: map['department'],
        gender: map['gender'],
        password: map['password'],
        short_intro: map['short_intro']);
  }

  Map<String, dynamic> toMap() {
    return {
      'employeeName': employeeName,
      'employeeEmail': employeeEmail,
      'phoneNumber': phoneNumber,
      'date_of_birth': date_of_birth,
      'department': department,
      'gender': gender,
      'password': password,
      'short_intro': short_intro
    };
  }

  @override
  String toString() {
    return 'EmployeeModel{employeeName: $employeeName, employeeEmail: $employeeEmail, phoneNumber: $phoneNumber , date_of_birth: $date_of_birth, department: $department, gender: $gender, password: $password, short_intro: $short_intro }';
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
