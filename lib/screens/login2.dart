import 'package:financas_pessoais/screens/dashboard.dart';
import 'package:financas_pessoais/screens/login.dart';
import 'package:financas_pessoais/services/auth_service.dart';
import 'package:financas_pessoais/utilitarios/appvalidator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login_final extends StatefulWidget {
  Login_final({super.key});

  @override
  State<Login_final> createState() => _LoginViewState();
}

class _LoginViewState extends State<Login_final> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  var isLoader = false;
  var authService =  AuthService();

    Future<void> _submitForm()async{
      if (_formKey.currentState!.validate()) {
              setState(() {
          isLoader = true;
          
        });

        var data = {
          "email" : _emailController.text,
          "senha" : _senhaController.text
        };

    await authService.login(data, context);
    setState(() {
        isLoader = false;
          
        });

      }
    }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252634),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
        key : _formKey,
            child: Column(
          children: [
            SizedBox(
              height: 80.0,
              ),
            SizedBox(
              width: 250,
              child: Text(
                "Fazer login",
                textAlign: TextAlign.center,
                 style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),),),
      
            
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
               controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Email", Icons.email),
                validator: appValidator.validateEmail),
              
              SizedBox(
                  height: 16.0,
              ),
              TextFormField(
               controller: _senhaController,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Senha", Icons.lock),
                validator: appValidator.validateSenha,
                  ),
              SizedBox(
                height: 40.0,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 201, 184, 30)),
                  onPressed:(){
                    isLoader ? print("Carregando..."):_submitForm();

                  }, 
                  child:  isLoader
                   ? Center(child: CircularProgressIndicator()):
                  
                  
                  Text("Fazer Login",style: TextStyle(color:Colors.white,fontSize:20)))),
              SizedBox(
                height: 30.0,
              ),
                TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Login()),
                  );

                } ,child: Text(
                  "Criar nova conta", 
                  style:
                  TextStyle(color:Color.fromARGB(255, 201, 184, 30),fontSize:20) ),)
              
          ],
        )),
      )
        
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon){
    return InputDecoration(
      
      fillColor : Color(0xAA494A59),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0x35949494))),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white )),
      
      filled: true,
      labelStyle: TextStyle(color: Color(0xFF949494)),
      labelText: label, suffixIcon : Icon(suffixIcon, color: Color(0xFF949494)), border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)));
  }
}