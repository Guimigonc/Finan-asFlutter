// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons{
  final List<Map<String, dynamic>> homeExpensesCategories = [
    {
      "name" : "Gasolina",
      "icon" : FontAwesomeIcons.gasPump,
    },
    {
      "name" : "Mercado", 
      "icon" : FontAwesomeIcons.shoppingCart,
    },
    {
      "name" : "Café",
      "icon" : FontAwesomeIcons.mugHot,
    },
    {
      "name" : "Internet",
      "icon" : FontAwesomeIcons.wifi,
    },
    {
      "name" : "Eletricidade",
      "icon" : FontAwesomeIcons.bolt,
    },
    {
      "name" : "Agua",
      "icon" : FontAwesomeIcons.water,
    },
    {
      "name" : "Aluguel",
      "icon" : FontAwesomeIcons.home,
    },
    {
      "name" : "Comida",
      "icon" : FontAwesomeIcons.utensils,
    },
    {
      "name" : "Entretenimento",
      "icon" : FontAwesomeIcons.film,
    },
    {
      "name" : "Saúde",
      "icon" : FontAwesomeIcons.medkit,
    },
    {
      "name" : "Transporte",
      "icon" : FontAwesomeIcons.bus,
    },
    {
      "name" : "Roupa",
      "icon" : FontAwesomeIcons.tshirt,
    },
    {
      "name" : "Seguro",
      "icon" : FontAwesomeIcons.shieldAlt,
    },
    {
      "name" : "Educação",
      "icon" : FontAwesomeIcons.graduationCap,
    },
    {
      "name" : "Outros",
      "icon" : FontAwesomeIcons.cartPlus,
    },


  ];

IconData getExpenseCategoryIcons(String categoryName){
  final category = homeExpensesCategories.firstWhere((category) => category['name'] == categoryName, orElse: ()=> {"icon":FontAwesomeIcons.shoppingCart});
  return category ['icon'];

}



  
}