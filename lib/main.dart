import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'ui/screens/PAGE_Error.dart';
import 'ui/screens/PAGE_Home.dart';

void main() {
  runApp(MyApp());
}

Future _initHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Continue',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder(
            future: _initHive(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.error != null) return ErrorPage(error: snapshot.error);
                return HomePage(title: 'Empty page');
              } else {
                return Scaffold();
              }
            })
      },
    );
  }
}
