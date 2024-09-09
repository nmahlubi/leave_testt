part of 'leave_bloc.dart';

abstract class LeaveState extends Equatable {
  const LeaveState();

  @override
  List<Object> get props => [];
}

class LeaveInitial extends LeaveState {}

class LeaveSubmitting extends LeaveState {}

class LeaveSubmitted extends LeaveState {
  final LeaveModel leaveRequest;

  LeaveSubmitted(this.leaveRequest);

  @override
  List<Object> get props => [leaveRequest];
}
