import 'package:financas_pessoais/screens/login.dart';
import 'package:financas_pessoais/widgets/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finanças',
      builder: (context,child){
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor:1.0),
          child: child!);
      },
      
      
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
     ),
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
