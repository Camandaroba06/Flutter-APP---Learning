import 'package:flutter/material.dart';
import 'step_form.dart'; //Aqui importo o arquivo do widget StepForm()

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override //Sobrescrevendo o widget (aparentemente é o padrão da criação)
  Widget build(BuildContext context) {
    //Aqui ele passa o context (ainda n sei qual a necessidade)
    return MaterialApp(
      title: 'Step App',
      home:
          StepForm(), //Falo que a homepage será o widget StepForm e referencio ele usando o home:
    ); //Sempre no fim retorne a página
  }
}
