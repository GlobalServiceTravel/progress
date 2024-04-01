import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/register_data_model.dart';
import '../repository/sign_up_repository.dart';

final registerControllerProvider = StateNotifierProvider.family<
    RegisterConroller, RegisterState, List<String>>(
  (ref, dataList) => RegisterConroller(RegisterState.initialState(),
      ref.watch(signUpRepositoryProvider), dataList),
);

class RegisterConroller extends StateNotifier<RegisterState> {
  final SignUpRepository repository;
  final List<String> data;
  RegisterConroller(
    super.state,
    this.repository,
    this.data,
  ) {
    registerController(
      fullName: data[0],
      dateOfBirth: data[1],
      gender: data[2],
      phoneNumber: data[3],
      email: data[4],
      department: data[5],
      shortIntro: data[6],
      password: data[7],
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

    state = sendRequest.fold(
      (error) => state.copyWith(
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
