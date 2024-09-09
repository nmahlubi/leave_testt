part of 'leave_bloc.dart';

abstract class LeaveEvent extends Equatable {
  const LeaveEvent();

  @override
  List<Object> get props => [];
}

class SubmitLeave extends LeaveEvent {
  final LeaveModel leaveRequest;

  SubmitLeave(this.leaveRequest);

  @override
  List<Object> get props => [leaveRequest];
}
