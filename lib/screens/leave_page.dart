import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/leave_controller.dart';

class LeavePage extends StatelessWidget {
  final LeaveController leaveController = Get.put(LeaveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Leave Request',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display Available Leave Days
              Obx(() {
                return Text(
                  'Available Leave Days: ${leaveController.availableLeaveDays.value}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                );
              }),

              SizedBox(height: 20),

              // Username Dropdown
              Text(
                'Select Username',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Obx(() {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: leaveController.selectedUsername.value.isEmpty
                        ? null
                        : leaveController.selectedUsername.value,
                    isExpanded: true,
                    items: leaveController.usernames.map((username) {
                      return DropdownMenuItem<String>(
                        value: username,
                        child: Text(username),
                      );
                    }).toList(),
                    onChanged: (value) {
                      leaveController.selectedUsername.value = value!;
                    },
                    hint: Text('Choose Username'),
                    underline: SizedBox(),
                  ),
                );
              }),

              SizedBox(height: 20),

              // Day Type Radio Buttons
              Text(
                'Select Day Type',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Obx(() {
                return Row(
                  children: [
                    Radio(
                      value: 'Full Day',
                      groupValue: leaveController.dayType.value,
                      onChanged: (value) {
                        leaveController.dayType.value = value!;
                      },
                    ),
                    Text('Full Day'),
                    Radio(
                      value: 'Half Day',
                      groupValue: leaveController.dayType.value,
                      onChanged: (value) {
                        leaveController.dayType.value = value!;
                      },
                    ),
                    Text('Half Day'),
                  ],
                );
              }),

              SizedBox(height: 20),

              // Leave Type Dropdown
              Text(
                'Select Leave Type',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Obx(() {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: leaveController.selectedLeaveType.value.isEmpty
                        ? null
                        : leaveController.selectedLeaveType.value,
                    isExpanded: true,
                    items: leaveController.leaveTypes.map((leaveType) {
                      return DropdownMenuItem<String>(
                        value: leaveType,
                        child: Text(leaveType),
                      );
                    }).toList(),
                    onChanged: (value) {
                      leaveController.selectedLeaveType.value = value!;
                    },
                    hint: Text('Choose Leave Type'),
                    underline: SizedBox(),
                  ),
                );
              }),

              SizedBox(height: 20),

              // Reason TextField for "Other" leave type
              Obx(() {
                return leaveController.selectedLeaveType.value == 'Other'
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Specify Reason',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      onChanged: (value) {
                        leaveController.reason.value = value;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Enter reason',
                      ),
                    ),
                  ],
                )
                    : SizedBox.shrink();
              }),

              SizedBox(height: 20),

              // Start Date Picker
              Text(
                'Start Date',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Obx(() {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: leaveController.startDate.value,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate != null) {
                      leaveController.startDate.value = pickedDate;
                      leaveController.updateLeaveDays(); // Update leave days on start date change
                    }
                  },
                  child: Text(
                    leaveController.startDate.value
                        .toLocal()
                        .toString()
                        .split(' ')[0],
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),

              SizedBox(height: 20),

              // End Date Picker
              Text(
                'End Date',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Obx(() {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: leaveController.endDate.value,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate != null) {
                      leaveController.endDate.value = pickedDate;
                      leaveController.updateLeaveDays(); // Update leave days on end date change
                    }
                  },
                  child: Text(
                    leaveController.endDate.value
                        .toLocal()
                        .toString()
                        .split(' ')[0],
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),

              SizedBox(height: 20),

              // Submit Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 40.0),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    leaveController.submitLeaveRequest(context);
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
