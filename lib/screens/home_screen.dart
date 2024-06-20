import 'package:financas_pessoais/screens/login2.dart';
import 'package:financas_pessoais/widgets/add_transaction_form.dart';
import 'package:financas_pessoais/widgets/hero_card.dart';
import 'package:financas_pessoais/widgets/transacoes_cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLogoutLoading = false;
  
  logOut() async {
    setState(() {
      isLogoutLoading = true;      
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) =>  Login_final())));


      setState(() {
        isLogoutLoading = false;      
    });
  }
  final userId = FirebaseAuth.instance.currentUser!.uid;
_dialoBuilder(BuildContext context){
  return showDialog(
    context: context,
     builder: (context){
      return AlertDialog(
        content: AddTransactionForm()
      );
    
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed:((){
          _dialoBuilder(context);
        }),
        child: Icon(Icons.add,
        color: Colors.white,),
      
      
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,   
        title: Text("Olá, seja bem-vindo!", style: TextStyle(color: Colors.white),),      
        actions: [
          IconButton(onPressed: (){
            logOut();
        },icon:
          isLogoutLoading
           ? CircularProgressIndicator():          
           Icon(Icons.exit_to_app, color: Colors.white,))
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroCard(userId: userId,),  
            TransacoesCard()
          ],
        ),
      ),

    );
  }
}

