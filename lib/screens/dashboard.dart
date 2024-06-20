import 'package:financas_pessoais/screens/home_screen.dart';
import 'package:financas_pessoais/screens/login2.dart';
import 'package:financas_pessoais/screens/transacoes_screen.dart';
import 'package:financas_pessoais/widgets/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard ({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogoutLoading = false;
  int currentIndex = 0;
  var pageViewList = [
    HomeScreen(),
    TransacoesScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
       selectedIndex: currentIndex,
       onDestinationSelected: (int value) { 
        setState(() {
          currentIndex = value;
          
        });
        },),
 
      body: pageViewList[currentIndex],
    );
  }
}