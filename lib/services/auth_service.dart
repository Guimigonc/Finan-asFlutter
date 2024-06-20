import 'package:financas_pessoais/screens/dashboard.dart';
import 'package:financas_pessoais/services/db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  var db = Db();

  createUser(data,context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data['email'],
          password: data['senha'],
      );
      await db.addUser(data, context);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) =>  Dashboard())));
   

    } 
      catch (e) {
        showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Falha ao se cadastrar"),
              content: Text(e.toString()),
            );
          });
    }
  }


login(data,context) async {
  try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data['email'],
          password: data['senha'],
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) =>  Dashboard())));
    } 
      catch (e) {
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Erro ao fazer login"),
              content: Text(e.toString()),
            );
          });
    }

}

}