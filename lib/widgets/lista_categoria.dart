import 'package:financas_pessoais/utilitarios/icons_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ListaCategoria extends StatefulWidget {
  const ListaCategoria({super.key, required this.onChanged});
  final ValueChanged<String?> onChanged;

  @override
  State<ListaCategoria> createState() => _ListaCategoriaState();
}

class _ListaCategoriaState extends State<ListaCategoria> {
  String currentCategoria = "";
  List<Map<String, dynamic>> ListaCategoria = [];
  
  
  final scrollController = ScrollController();
   var appIcons = AppIcons();
   var addCat = {
      "name" : "Todos", 
      "icon" : FontAwesomeIcons.cartPlus,
    };
   @override
   void initState(){
    super.initState();
    setState(() {
      ListaCategoria = appIcons.homeExpensesCategories;
      ListaCategoria.insert(0, addCat);
      
    });
    

    
   }
  //  scrollToSelectedMonth(){
  //   final selectedMonthIndex = months.indexOf(currentMonth);
  //   if (selectedMonthIndex != -1){
  //     final scrollOffset = (selectedMonthIndex * 100.0) - 170;
  //     scrollController.animateTo(scrollOffset,
  //      duration: Duration(milliseconds:500), curve: Curves.ease);

  //   }
  //  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 45,
      child: ListView.builder(
        controller: scrollController,
        itemCount: ListaCategoria.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var data = ListaCategoria[index];
        return GestureDetector(
          onTap: (){
            setState(() {
              currentCategoria = data['name'];
              widget.onChanged(data['name']);
            });

          },
          child: Container(     
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.only(left:10,right:10),
            decoration: BoxDecoration(
              color: currentCategoria == data['name']
               ? Colors.blue.shade900
               : Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Row(
                children: [
                  Icon(data['icon'], size : 15,
                  color : 
                  currentCategoria == data['name']
                   ? Colors.white
                   : Colors.blue.shade900,),
                  SizedBox(width: 10,),

                  Text(
                    data['name'],
                     style: TextStyle(
                              color : currentCategoria == data['name']
                   ? Colors.white
                   : Colors.blue.shade900,
                              )),
                ],
              )),
          ),
        );
      }),
    );
  }
}