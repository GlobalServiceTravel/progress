import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/register_data_model.dart';
import '../repository/sign_up_repository.dart';

final registerControllerProvider =
    StateNotifierProvider<RegisterConroller, RegisterState>(
  (ref) => RegisterConroller(
    RegisterState.initialState(),
    ref.watch(signUpRepositoryProvider),
  ),
);





class RegisterConroller extends StateNotifier<RegisterState> {
  final SignUpRepository repository;
  RegisterConroller(
    super.state,
    this.repository,
  ) {
    registerController(
      fullName: "fullName",
      dateOfBirth: "dateOfBirth",
      gender: "gender",
      phoneNumber: "phoneNumber",
      email: "email",
      department: "department",
      shortIntro: "shortIntro",
      password: "password",
    );
  }

  Future<void> registerController({
    required String fullName,
    required String dateOfBirth,
    required String gender,
    required String phoneNumber,
    required String email,
    required String department,
    required String shortIntro,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true);

    final sendRequest = await repository.sendEmployeeData(
      fullName: fullName,
      dateOfBirth: dateOfBirth,
      gender: gender,
      phoneNumber: phoneNumber,
      email: email,
      department: department,
      shortIntro: shortIntro,
      password: password,
    );

    state = await sendRequest.fold(
      (error) =>  state.copyWith(
        errorMessage: error,
        isError: true,
        isLoading: false,
      ),
      (status) => state.copyWith(
        isLoading: false,
        isSuccess: true,
        statusCode: status,
      ),
    );
  }
}
