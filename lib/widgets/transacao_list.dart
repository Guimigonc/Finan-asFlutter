import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financas_pessoais/widgets/transacao_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransacaoList extends StatelessWidget {
  TransacaoList({super.key, required this.categoria, required this.tipo, required this.monthYear});
 final userId = FirebaseAuth.instance.currentUser!.uid;

 final String categoria;
 final String tipo;
 final String monthYear;


  @override
  Widget build(BuildContext context) {
     Query query = FirebaseFirestore.instance.collection('users')
      .doc(userId)
      .collection("transações")
      .orderBy('timestamp', descending: true)
      .where('monthYear', isEqualTo: monthYear)
      .where('tipo',isEqualTo: tipo);

      if(categoria != 'Todos') {
        query = query.where('categoria', isEqualTo: categoria);
      }




    return FutureBuilder<QuerySnapshot>(
      future: query.limit(150).get(),
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