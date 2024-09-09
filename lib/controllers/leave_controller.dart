import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:math';

import '../screens/leave_details_page.dart';
import '../models/leave_request.dart'; // Import your LeaveModel

class LeaveController extends GetxController {
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;
  var availableLeaveDays = 0.obs;
  var leaveDaysTaken = 0.obs;
  var selectedUsername = ''.obs;
  var selectedLeaveType = ''.obs;
  var reason = ''.obs;
  var dayType = ''.obs;

  var usernames = <String>[
    'Ms Koyana',
    'Mr C Jacobs',
    'Mrs P Dladla'
  ].obs;

  var leaveTypes = <String>[
    'Annual Leave',
    'Sick Leave',
    'Emergency Leave',
    'Other',
    // Add more leave types here
  ].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize availableLeaveDays with a random value
    final random = Random();
    availableLeaveDays.value = random.nextInt(16) + 5; // Random number between 5 and 20
  }

  void updateLeaveDays() {
    if (startDate.value != null && endDate.value != null) {
      final start = startDate.value;
      final end = endDate.value;
      final difference = end.difference(start).inDays + 1; // Including end day

      if (difference >= 0) { // Ensure the difference is non-negative
        leaveDaysTaken.value = difference;
        availableLeaveDays.value -= difference; // Subtract the number of leave days taken
      }
    }
  }

  void submitLeaveRequest(BuildContext context) {
    // Add validation checks before submitting
    if (selectedUsername.value.isEmpty) {
      Get.snackbar('Error', 'Please select a username');
      return;
    }
    if (selectedLeaveType.value.isEmpty) {
      Get.snackbar('Error', 'Please select a leave type');
      return;
    }
    if (startDate.value.isAfter(endDate.value)) {
      Get.snackbar('Error', 'End date cannot be before start date');
      return;
    }

    // Create LeaveModel object
    LeaveModel leave = LeaveModel(
      username: selectedUsername.value,
      leaveType: selectedLeaveType.value,
      reason: selectedLeaveType.value == 'Other' ? reason.value : '',
      dayType: dayType.value,
      startDate: startDate.value,
      endDate: endDate.value,
    );

    // Show success message
    Get.snackbar('Success', 'Leave request submitted successfully');

    // Navigate to LeaveDetailsPage and pass LeaveModel
    Get.to(() => LeaveDetailsPage(leave: leave));

    // Optionally, reset the form after submission
    selectedUsername.value = '';
    selectedLeaveType.value = '';
    reason.value = '';
    dayType.value = '';
    startDate.value = DateTime.now();
    endDate.value = DateTime.now();
  }
}
