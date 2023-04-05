import 'package:airlux/screens/login_and_signup/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root our your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Lint',
      theme: ThemeData(
          primarySwatch: Colors.lime,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
            titleMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 16.0),
            bodySmall: TextStyle(fontSize: 14.0),
          ),
          iconTheme: const IconThemeData(color: Colors.lime),
          appBarTheme: AppBarTheme(
              titleTextStyle: Theme.of(context).textTheme.titleLarge,
              elevation: 0,
              backgroundColor: Colors.transparent,
              actionsIconTheme: const IconThemeData(color: Colors.lime),
              iconTheme: const IconThemeData(color: Colors.lime)),
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lime),
            ),
            filled: true,
            hintStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
              backgroundColor: Colors.lime,
              shape: const StadiumBorder(),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            foregroundColor: Colors.lime,
            textStyle: Theme.of(context).textTheme.bodySmall,
          ))),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: LoginScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   // const MyHomePage({super.key, required this.title});
//   const MyHomePage({super.key});

//   // final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(widget.title),
//       // ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             Text(
//               'Bonjour !',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
