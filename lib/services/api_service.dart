import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<void> submitLeave(String username, String leaveType, String reason, double days) async {
    try {
      await dio.post('https://yourapi.com/submitLeave', data: {
        'username': username,
        'leaveType': leaveType,
        'reason': reason,
        'days': days,
      });
    } catch (e) {
      throw Exception('Failed to submit leave');
    }
  }
}
