import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Models/employee_model.dart';
import '../Repository/employee_data.dart';

final employeeDataControllerProvider =
    StateNotifierProvider<EmployeeDataController, EmployeeModelState>(
  (ref) => EmployeeDataController(
    EmployeeModelState.initialState(),
    ref.read(employeeDataRepository),
  ),
);

class EmployeeDataController extends StateNotifier<EmployeeModelState> {
  final FetchEmployeeDataRepository repository;

  EmployeeDataController(
    super.state,
    this.repository,
  );

  Future<EmployeeModelState> employeeDataController() async {
    state = state.copyWith(
      isLoading: true,
    );

    final response = await repository.fetchEmployeeData();
    print("this function is called ");
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

    
    return state;
  }

  Future<EmployeeModelState> employeeGetter() async  {
   await employeeDataController();
    print(state.employeeList);
    return  state;
  }
}
