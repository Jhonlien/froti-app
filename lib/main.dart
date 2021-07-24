import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:froti/bloc/blocs.dart';
import 'package:froti/bloc/page_bloc.dart';
import 'package:provider/provider.dart';

import 'ui/pages/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: null,
      initialData: null,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PageBloc()..add(GoToSplashPage())),
            BlocProvider(create: (_) => PlantBloc()..add(FetchPlants())),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
          )),
    );
  }
}
