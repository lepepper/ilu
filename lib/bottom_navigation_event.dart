part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable{
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationChangedEvent extends BottomNavigationEvent{
  final  int index;
  const NavigationChangedEvent( this.index);

  @override
  List<Object> get props => [index];
}