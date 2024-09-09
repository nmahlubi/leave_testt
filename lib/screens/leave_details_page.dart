import 'package:flutter/material.dart';
import '../models/leave_request.dart';

class LeaveDetailsPage extends StatelessWidget {
  final LeaveModel leave;

  LeaveDetailsPage({required this.leave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '${leave.username}\'s Leave Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.teal, // Updated AppBar color to teal
      ),
      body: Center(
        child: Container(
          color: Colors.teal[50], // Light teal background color for the body
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Username', leave.username),
                  _buildDetailRow('Leave Type', leave.leaveType),
                  if (leave.leaveType == 'Other')
                    _buildDetailRow('Reason', leave.reason),
                  _buildDetailRow('Day Type', leave.dayType),
                  _buildDetailRow('Start Date', leave.startDate.toString()),
                  _buildDetailRow('End Date', leave.endDate.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to display each row of the details
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.teal, // Updated text color to teal
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
