import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financas_pessoais/utilitarios/appvalidator.dart';
import 'package:financas_pessoais/widgets/category_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  var type = "credito";
  var category = "Outros";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var isLoader = false;
  var appValidator = AppValidator();
  var montanteEditController = TextEditingController();
  var tituloEditController = TextEditingController();
  var uid = Uuid();

   Future<void> _submitForm()async{
      if (_formKey.currentState!.validate()) {
              setState(() {
          isLoader = true;
          
        });
        final user = FirebaseAuth.instance.currentUser;
        int timestamp = DateTime.now().millisecondsSinceEpoch;
        var montante = int.parse(montanteEditController.text);
        DateTime date = DateTime.now();

        var id = uid.v4();
        String monthyear = DateFormat('MMM y').format(date);
        final userDoc = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();

        int montanteRestante = userDoc ['montanteRestante'];
        int creditoTotal = userDoc ['creditoTotal'];
        int debitoTotal = userDoc ['debitoTotal'];

        if (type == 'credito'){
          montanteRestante +=  montante;
          creditoTotal += montante;
        }else{
          montanteRestante -=  montante;
          debitoTotal += montante;

        }
        await FirebaseFirestore.instance.collection('users').
        doc(user!.uid).update({
          "montanteRestante" : montanteRestante,
          "creditoTotal" : creditoTotal,
          "debitoTotal" : debitoTotal,
          "data" : timestamp,

        });
      


         var data = {
           "id" : id,
           "titulo" : tituloEditController.text,
           "montante" : montante,
           "type" : type,
           "timestamp" : timestamp,
           "creditoTotal" : creditoTotal,
           "debitoTotal" : debitoTotal,
           "montanteRestante" : montanteRestante,
           "monthyear" : monthyear,
           "categoria" : category,

        
         };
         await FirebaseFirestore.instance.collection('users').
         doc(user!.uid).collection("transações").doc(id).set(data);

    //await authService.login(data, context);


  Navigator.pop(context);
    setState(() {
        isLoader = false;
          
        });
      }

      }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: tituloEditController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: appValidator.isEmptyCheck,
              decoration: InputDecoration(
                labelText: "Titulo"
              ),
            ),
            TextFormField(
              controller: montanteEditController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: appValidator.isEmptyCheck,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Total"
              ),
            ),
            CategoryDropdown(
              cattype: category,
              onChanged: (String? value) {
                if (value != null){
                  setState(() {
                    category = value;
                  });
                }
                },),
            DropdownButtonFormField(
              value : 'credito',
              items: [
              DropdownMenuItem(child: Text("Credito"),value : 'credito',),
              DropdownMenuItem(child: Text("Debito"),value : 'debito',),
            ], 
            onChanged: (value){
              if (value != null) {
                setState(() {
                  type = value;
                });
              }
                
            })
            ,

            SizedBox(
              height:16,
            ),
            ElevatedButton(onPressed: (){
              if (isLoader == false){
                _submitForm();
              }
              
            }, child:
             isLoader ? Center(child: CircularProgressIndicator()):
             Text("Adicionar transação"))
            ],
            ),
      ),
    );
  }
}