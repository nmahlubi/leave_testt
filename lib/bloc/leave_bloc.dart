import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/leave_request.dart';
part 'leave_event.dart';
part 'leave_state.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  LeaveBloc() : super(LeaveInitial());

  @override
  Stream<LeaveState> mapEventToState(LeaveEvent event) async* {
    if (event is SubmitLeave) {
      yield LeaveSubmitting();
      // Simulate a network call or database operation
      await Future.delayed(Duration(seconds: 2));
      yield LeaveSubmitted(event.leaveRequest);
    }
  }
}
