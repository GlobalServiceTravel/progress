import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final signUpRepositoryProvider = Provider((ref) => AddWorkLogRepo());

class AddWorkLogRepo {
  static final dio = Dio(BaseOptions(
    baseUrl: "https://ghfmun.org",
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Future<Either<String, int>> sendEmployeeData({
    required String fullName,
    required String dateOfBirth,
    required String gender,
    required String phoneNumber,
    required String email,
    required String department,
    required String shortIntro,
    required String password,
  }) async {
    try {
      final response = await dio.post("/submitEmployeeData", data: {
        "employeeName": fullName,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "employeeEmail": email,
        "phoneNumber": phoneNumber,
        "department": department,
        "short_intro": shortIntro,
        "password": password
      });
        if(response.statusCode == 201){
            return  Right(response.statusCode ?? 000);
        }else{
          throw "error Occured";
        }
    } catch (e) {
      return left(e.toString());
    }
  }
}
