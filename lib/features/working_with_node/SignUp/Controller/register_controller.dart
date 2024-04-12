import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/register_data_model.dart';
import '../repository/sign_up_repository.dart';

final registerControllerProvider = StateNotifierProvider.family<
    RegisterConroller, RegisterState, Tuple8<String , String , String , String , String , String , String , String>>(
  (ref, dataList) => RegisterConroller(RegisterState.initialState(),
      ref.watch(signUpRepositoryProvider), dataList),
);

class RegisterConroller extends StateNotifier<RegisterState> {
  final SignUpRepository repository;
  final Tuple8 data;
  RegisterConroller(
    super.state,
    this.repository,
    this.data,
  ) {
    registerController(
      fullName: data.value1,
      dateOfBirth: data.value2,
      gender: data.value3,
      phoneNumber: data.value4,
      email: data.value5,
      department: data.value6,
      shortIntro: data.value7,
      password: data.value8,
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
