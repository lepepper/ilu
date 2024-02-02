import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ilu/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';

import 'package:ilu/app_router.dart';

///
/// ------- No Bloc version----------
///
// class BottomNavigationBarWidget extends StatelessWidget {
//   //const BottomNavigationBarWidget({super.key, required this.appRouter});
//   const BottomNavigationBarWidget(
//       {Key? key, required this.appRouter, required this.currentIndex})
//       : super(key: key);

//   final AppRouter appRouter;
//   final int currentIndex;

//   @override
//   Widget build(BuildContext context) {
//     return ConvexAppBar(
//       style: TabStyle.reactCircle,
//       backgroundColor: Colors.white,
//       items: const [
//         TabItem(icon: Icons.home, title: 'Page 1'),
//         TabItem(icon: Icons.business, title: 'Page 2'),
//         TabItem(icon: Icons.school, title: 'Page 3'),
//         TabItem(icon: Icons.work, title: 'Page 4'),
//         TabItem(icon: Icons.workspaces, title: 'Page 5'),
//       ],
//       // initialActiveIndex: 0,
//       // onTap: (index) {
//       //   // appRouter.setActiveIndex(index);
//       //   // appRouter.navigateTo(index);
//       // },

//       initialActiveIndex: currentIndex,
//       //Provider version
//       onTap: (index) {
//         context.read<AppRouter>().setActiveIndex(index);
//         context.read<AppRouter>().navigateTo(index);
//       },
//     );
//   }
// }

///
/// ------- Bloc version--------------
///

// class BottomNavigationBarWidget extends StatefulWidget {
//   //const BottomNavigationBarWidget({super.key});
//   const BottomNavigationBarWidget(
//       {Key? key, required this.currentIndex, required this.bloc})
//       : super(key: key);
//   final int currentIndex;
//   final BottomNavigationBloc bloc;

//   @override
//   State<BottomNavigationBarWidget> createState() =>
//       _BottomNavigationBarWidgetState();
// }

// class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
//   late int _currentIndex;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _currentIndex = widget.currentIndex;

//     widget.bloc.stream.listen((state) {
//       if (state is NavigationChangedState) {
//         setState(() {
//           _currentIndex = state.index;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ConvexAppBar(
//       style: TabStyle.reactCircle,
//       backgroundColor: Colors.white,
//       items: const [
//         TabItem(icon: Icons.home, title: 'Page 1'),
//         TabItem(icon: Icons.business, title: 'Page 2'),
//         TabItem(icon: Icons.school, title: 'Page 3'),
//         TabItem(icon: Icons.work, title: 'Page 4'),
//         TabItem(icon: Icons.workspaces, title: 'Page 5'),
//       ],
//       initialActiveIndex: _currentIndex,
//       onTap: (int index) {
//         widget.bloc.add(NavigationChangedEvent(index));
//       },
//     );
//   }
// }

///
/// ------- Bloc Subscription version--------------
///

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_bloc.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int currentIndex;
  final BottomNavigationBloc bloc;

  const BottomNavigationBarWidget(
      {Key? key, required this.currentIndex, required this.bloc})
      : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget>
    with AutomaticKeepAliveClientMixin {
  late StreamSubscription<BottomNavigationState> _subscription;
  late int _currentIndex;
  
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _subscription = widget.bloc.stream.listen((state) {
      if (state is NavigationChangedState) {
        setState(() {
          _currentIndex = state.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.reactCircle,
      backgroundColor: Colors.white,
      items: const [
        TabItem(icon: Icons.home, title: 'Page 1'),
        TabItem(icon: Icons.business, title: 'Page 2'),
        TabItem(icon: Icons.school, title: 'Page 3'),
        TabItem(icon: Icons.work, title: 'Page 4'),
        TabItem(icon: Icons.workspaces, title: 'Page 5'),
      ],
      initialActiveIndex: _currentIndex,
      onTap: (int index) {
        widget.bloc.add(NavigationChangedEvent(index));
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
