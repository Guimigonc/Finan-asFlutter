import 'package:flutter/material.dart';

import 'transacao_list.dart';

class TypeBar extends StatelessWidget {
  const TypeBar({super.key, required this.categoria, required this.monthYear});
  final String categoria;
  final String monthYear;
  

  @override
  Widget build(BuildContext context) {
    return Expanded(child: DefaultTabController(length: 2,
    child: 
    Column(children: [
      TabBar(tabs: [
        Tab(text:"Credito",),
        Tab(text:"Debito",),
      ]),
      Expanded(child: TabBarView(children: [
        TransacaoList(
          categoria: categoria,
           monthYear: monthYear,
            tipo: 'credito',
            ),
        TransacaoList(
          categoria: categoria,
           monthYear: monthYear,
            tipo: 'debito',
            ),
      ],),)

    ],),),);
  }
}