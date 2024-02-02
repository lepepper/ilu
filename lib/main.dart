import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'package:ilu/bottom_navigation_bar.dart';

import 'app_router.dart';
import 'bottom_navigation_bloc.dart';
import 'injection.dart';

// Common code
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod as Environment);
  runApp(MyApp());
}

///
///------------------------Provider version--------------------------
///

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [Provider<AppRouter>(create: (_) => AppRouter())],
//       child: MaterialApp.router(
//         title: 'Dim',
//         routeInformationParser: AppRouter().routeInformationParser,
//         routerDelegate: AppRouter().routerDelegate,
//         routeInformationProvider: AppRouter().routeInformationProvider,
//         //home: MyHomePage(),// not working - where to provide homeage
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with AutomaticKeepAliveClientMixin {
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     context.read<AppRouter>().addListener(() {
//       setState(() {
//         _currentIndex = context.read<AppRouter>().activeIndex;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       appBar:AppBar(title: const Text('Convex Bottom Bar Demo')),
//       body: context.watch<AppRouter>().currentScreen,
//       bottomNavigationBar: BottomNavigationBarWidget(currentIndex: _currentIndex, appRouter: AppRouter()),
//     );
//   }

//   @override
//   // TODO: implement wantKeepAlive
//   //bool get wantKeepAlive => throw UnimplementedError();
//   bool get wantKeepAlive => true;
// }

///
///------------------------GetIT version--------------------------
///

// @Injectable()
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //return GetIt.instance.get<AppRouter>().materialApp;
//     return GetIt.instance.get().materialApp;
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with AutomaticKeepAliveClientMixin {
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     GetIt.instance.get<AppRouter>().addListener(() {
//       setState(() {
//         _currentIndex = GetIt.instance.get<AppRouter>().activeIndex;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       appBar: AppBar(title: Text('Flutter Navigation')),
//       body: GetIt.instance.get<AppRouter>().currentScreen,
//       bottomNavigationBar: BottomNavigationBarWidget(currentIndex: _currentIndex, appRouter: AppRouter(),),
//     );
//   }

//   @override
//   // TODO: implement wantKeepAlive
//   bool get wantKeepAlive => throw UnimplementedError();
// }

///
///------------------------Bloc version--------------------------
///
//@Injectable()
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<BottomNavigationBloc>(
//             create: (context) => GetIt.instance.get<BottomNavigationBloc>()),
//       ],
//       child: GetIt.instance.get<AppRouter>().materialapp,
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with AutomaticKeepAliveClientMixin {
//   late int _currentIndex;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _currentIndex = GetIt.instance.get<BottomNavigationBloc>.state.index;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Convex Bottom Bar Demo')),
//       body: GetIt.instance.get<AppRouter>().currentScreen,
//       bottomNavigationBar:
//           BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
//         builder: (context, state) {
//           return BottomNavigationBarWidget(
//             currentIndex: state.index,
//             bloc: GetIt.instance.get<BottomNavigationBloc>(),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }


///
///------------------------Bloc stream version--------------------------
///

@Injectable()
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
          create: (context) => GetIt.instance.get<BottomNavigationBloc>(),
        ),
      ],
      child: GetIt.instance.get<AppRouter>().router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = GetIt.instance.get<BottomNavigationBloc>().state.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Convex Bottom Bar Demo')),
          body: GetIt.instance.get<AppRouter>().currentScreen,
          bottomNavigationBar: BottomNavigationBarWidget(
            currentIndex: state.index,
            bloc: GetIt.instance.get<BottomNavigationBloc>(),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}














///
///------------------------NOT WORKING version--------------------------
///
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       // This is the theme of your application.
  //       //
  //       // TRY THIS: Try running your application with "flutter run". You'll see
  //       // the application has a blue toolbar. Then, without quitting the app,
  //       // try changing the seedColor in the colorScheme below to Colors.green
  //       // and then invoke "hot reload" (save your changes or press the "hot
  //       // reload" button in a Flutter-supported IDE, or press "r" if you used
  //       // the command line to start the app).
  //       //
  //       // Notice that the counter didn't reset back to zero; the application
  //       // state is not lost during the reload. To reset the state, use hot
  //       // restart instead.
  //       //
  //       // This works for code too, not just values: Most code changes can be
  //       // tested with just a hot reload.
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),

  //     // builder: ExtendedDIBuilder(appRouter),
  //     // navigatorKey: AppRouter().navigatorKey,

  //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
  //   );
  // }


// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required String title});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Convex bar Demo')),
//       body: const Center(child: Text(' Dummy')),
//       bottomNavigationBar: BottomNavigationBarWidget(appRouter: AppRouter()),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
