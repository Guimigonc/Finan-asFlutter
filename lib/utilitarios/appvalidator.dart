class AppValidator {
  String? validateEmail(value) {
    if (value!. isEmpty){
      return "Por favor, digite o email corretamente.";
    }
    RegExp emailRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailRegExp.hasMatch(value)){
      return 'Por favor, coloque um email valido';
    }
    return null;

    }
      
String? validatePhoneNumber(value){
  if(value!.isEmpty){
    return 'Por favor, coloque o numero de celular';
  }
  if (value.length !=10){
    return 'Por favor, digite um numero corretamente';
  }
  return null;
}

String? validateSenha(value){
  if(value!.isEmpty){
    return 'Por favor, coloque sua senha';
  }

  return null;
}

String? validateUsername(value){
    if (value!.isEmpty) {
      return 'Por favor,coloque seu nome completo';
    }
    return null;

  }

  String? isEmptyCheck(value){
    if (value!.isEmpty) {
      return 'Por favor, preencha os detalhes';
    }
    return null;

  }

}