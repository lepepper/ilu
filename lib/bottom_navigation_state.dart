part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class BottomNavigationInitialState extends BottomNavigationState {}

class NavigationChangedState extends BottomNavigationState {
  const NavigationChangedState({required this.index});
  final int index;

  @override
  List<Object> get props => [index];
}
