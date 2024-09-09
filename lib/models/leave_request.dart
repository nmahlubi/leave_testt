
class LeaveModel {
  final String username;
  final String leaveType;
  final String reason;
  final String dayType; // Full Day or Half Day
  final DateTime startDate;
  final DateTime endDate;

  LeaveModel({
    required this.username,
    required this.leaveType,
    required this.reason,
    required this.dayType,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'leaveType': leaveType,
      'reason': reason,
      'dayType': dayType,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }

  factory LeaveModel.fromJson(Map<String, dynamic> json) {
    return LeaveModel(
      username: json['username'],
      leaveType: json['leaveType'],
      reason: json['reason'],
      dayType: json['dayType'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}


