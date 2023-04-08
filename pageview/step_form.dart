import 'package:flutter/material.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StepFormState();
  }
}

class _StepFormState extends State<StepForm> {
  final _StepFormController = PageController();
  int _pageNumb = 0;

  List _pagesList = [
    Text('Page 1'),
    Text('Page 2'),
    Text('Page 3'),
  ];

  void _changeStep(bool nextPage) {
    if (_pageNumb < 2 && nextPage) {
      setState(() {
        _pageNumb++;
      });
      _StepFormController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      //Aqui utilizei o controlador criado no pageview para chamar a função de nextpage e previouspage
      //com isso, consegui colocar a animação com o duration e o curves
    } else if (!nextPage) {
      setState(() {
        _pageNumb--;
      });
      _StepFormController.previousPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step App Page')),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _StepFormController,
        itemBuilder: (BuildContext context, int index) {
          return _pagesList[index];
        },
      ),
      bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //Coloquei o argumento de alinhamento no eixo q estou (main axis) q é a horizontal com o spacebetween igual o css
          children: [
            TextButton(
                onPressed: () => _changeStep(false), child: Text('Back')),
            TextButton(onPressed: () => _changeStep(true), child: Text('Next'))
            // criei o bottonnavigation, depois coloquei o textbutton e seus nomes e
            //função(cuja a declaração está la em cima)
          ]),
    ); //Retornei o scaffold PERCEBA
  }
}
