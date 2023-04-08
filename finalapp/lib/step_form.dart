import 'package:flutter/material.dart';
import 'page_indicator.dart';
import 'body_page.dart';

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
    pageBody(
        'Flutter',
        'Flutter é um kit de desenvolvimento de interface de usuário, de código aberto, criado pela empresa Google em 2015, baseado na linguagem de programação Dart, que possibilita a criação de aplicativos compilados nativamente, para os sistemas operacionais Android, iOS, Windows, Mac, Linux e, Fuchsia e Web',
        'https://img1.gratispng.com/20180710/hul/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed38607c1.934218061531268819549.jpg'),
    pageBody(
        'Dart',
        'Dart é uma linguagem de script voltada à web desenvolvida pela Google. Ela foi lançada na GOTO Conference 2011, que aconteceu de 10 a 11 de outubro de 2011 em Aarhus, na Dinamarca. O objetivo da linguagem Dart foi inicialmente a de substituir a JavaScript como a linguagem principal embutida nos navegadores.',
        'https://img2.gratispng.com/20180706/uer/kisspng-dart-flutter-google-software-development-kit-past-and-future-5b3fba1bcf3131.7664747015309030678487.jpg'),
    pageBody(
        'Multi Plataforma',
        'Multiplataforma: os desenvolvedores conseguem criar aplicativos para vários sistemas operacionais;',
        'https://img1.gratispng.com/20180617/pfa/kisspng-svg-animation-comparison-of-vector-graphics-editor-android-studio-5b26cb51c8a500.2324320815292690738219.jpg')
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
            pageIndicator(_pageNumb == 0),
            pageIndicator(_pageNumb == 1),
            pageIndicator(_pageNumb == 2),
            TextButton(onPressed: () => _changeStep(true), child: Text('Next'))
            // criei o bottonnavigation, depois coloquei o textbutton e seus nomes e
            //função(cuja a declaração está la em cima)
          ]),
    ); //Retornei o scaffold PERCEBA
  }
}
