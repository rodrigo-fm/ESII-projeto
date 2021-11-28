import 'package:flutter/material.dart';

import '../../../../../../../compartilhado/presentation/widgets/textos_widget.dart';

class InformacoesBuscaPassagemWidget extends StatelessWidget {
  const InformacoesBuscaPassagemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 84,
      color: const Color(0xff3300c5),
      child: ListView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(width: 20),
          Center(child: Headline3('AJU-GRU')),
          SizedBox(width: 20),
          VerticalDivider(
            thickness: 2,
            color: Colors.white,
          ),
          SizedBox(width: 20),
          Center(child: Headline3('Sáb 30, Out')),
          SizedBox(width: 20),
          VerticalDivider(
            thickness: 2,
            color: Colors.white,
          ),
          SizedBox(width: 20),
          Center(child: Headline3('X pessoa(s)')),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
