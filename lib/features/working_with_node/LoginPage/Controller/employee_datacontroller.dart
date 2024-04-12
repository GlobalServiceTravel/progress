import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/employee_model.dart';
import '../Repository/employee_data.dart';

final employeeDataControllerProvider = StateNotifierProvider.family<
    EmployeeDataController, EmployeeModelState, Tuple2<String, String>>(
  (ref, paramsTuple) => EmployeeDataController(
    EmployeeModelState.initialState(),
    ref.read(employeeDataRepository),
    paramsTuple,
  ),
);

class EmployeeDataController extends StateNotifier<EmployeeModelState> {
  final FetchEmployeeDataRepository repository;
  final Tuple2<String, String> params;

  EmployeeDataController(super.state, this.repository, this.params) {
    employeeDataController(
      phoneNumber: params.value1,
      password: params.value2,
    );
  }

  Future<void> employeeDataController({
    required String phoneNumber,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true);

    final response = await repository.fetchEmployeeData(
      password: password,
      phoneNumber: phoneNumber,
    );

 
    state = await response.fold(
      (error) => state.copyWith(
        errorMessage: error,
        isError: true,
        isLoading: false,
      ),
      (employeelist) => state.copyWith(
        employeeList: employeelist,
        isSuccess: true,
        isLoading: false,
      ),
    );

    print(state.isSuccess);
  }
}
