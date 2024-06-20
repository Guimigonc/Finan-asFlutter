import 'package:financas_pessoais/screens/dashboard.dart';
import 'package:financas_pessoais/screens/login2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Login_final();

        }
        return Dashboard();
      }
    );
  }
}