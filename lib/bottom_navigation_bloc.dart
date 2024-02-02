
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

// class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
//   BottomNavigationBloc() : super(BottomNavigationInitial()) {
//     on<BottomNavigationEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

///
///---------Stream like------------
///
class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationInitialState());

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is NavigationChangedEvent) {
      yield NavigationChangedState(index: event.index);
    }
  }
}
