import 'package:financas_pessoais/widgets/lista_categoria.dart';
import 'package:financas_pessoais/widgets/tab_bar_view.dart';
import 'package:financas_pessoais/widgets/time_line_month.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TransacoesScreen extends StatelessWidget {
  const TransacoesScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expandir"),
      ),
      body: Column(
        children: [

          TimeLineMonth(
            onChanged: (String? value) {  },
            ),
            ListaCategoria(
              onChanged: (String? value) {  },
              ),
            TypeBar(categoria: '', monthYear: '',)
        ],
      ),
    );
  }
}