import 'package:financas_pessoais/screens/dashboard.dart';
import 'package:financas_pessoais/screens/login2.dart';
import 'package:financas_pessoais/services/auth_service.dart';
import 'package:financas_pessoais/utilitarios/appvalidator.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();

  final _emailController = TextEditingController();

  final _numeroController = TextEditingController();

  final _senhaController = TextEditingController();

var authService =  AuthService();
var isLoader = false;

    Future<void> _submitForm() async {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoader = true;
          
        });

        var data = {
          "nome" : _nomeController.text,
          "email" : _emailController.text,
          "numero" : _numeroController.text,
          "senha" : _senhaController.text,
          'montanteRestante':0,
          'creditoTotal':0,
          'debitoTotal':0
        };

    await authService.createUser(data, context);
    
    
       
    setState(() {
        isLoader = false;
          
        });
          // ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
          //   const SnackBar(content : Text('Seus dados foram enviados com sucesso.')),
          //   );

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
                "Crie sua conta no G3X Investimentos",
                textAlign: TextAlign.center,
                 style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),),),
            SizedBox(
              height: 50.0,
              ),
            TextFormField(
             controller : _nomeController,
              style: TextStyle(color: Colors.white),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _buildInputDecoration("Nome completo", Icons.person),
              validator: appValidator.validateUsername
            ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
               controller:_emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Email", Icons.email),
                validator: appValidator.validateEmail),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
               controller: _numeroController,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Numero de celular", Icons.call),
                validator: appValidator.validatePhoneNumber,
            ),
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
                  
                  
                  Text("Criar Conta",style: TextStyle(color:Colors.white,fontSize:20)))),
              SizedBox(
                height: 30.0,
              ),
                TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Login_final()),
                  );

                } ,child: Text(
                  "Login", 
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