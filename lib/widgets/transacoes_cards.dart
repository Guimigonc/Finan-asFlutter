import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financas_pessoais/utilitarios/icons_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'transacao_card.dart';

class TransacoesCard extends StatelessWidget {
   TransacoesCard({super.key});




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(15),
      child : Column(
        children: [
          Row(
              children: [
                Text("Transações recentes",
                style: TextStyle(fontSize:22, fontWeight: FontWeight.w600),)

        ],
      ),
          TransacoesRecentesList()
              
        ],
              
          ),
          );
  }
}

class TransacoesRecentesList extends StatelessWidget {
   TransacoesRecentesList({
    super.key,
  });
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {


    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users')
      .doc(userId)
      .collection("transações")
      .orderBy('timestamp', descending: true)
      .limit(20)
      .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }else if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child:Text("Nenhuma transação foi encontrada."));
        }
        var data = snapshot.data!.docs;

        return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var cardData = data[index];
        return TransacaoCard(data: cardData,);
    });
  });
  }
}

