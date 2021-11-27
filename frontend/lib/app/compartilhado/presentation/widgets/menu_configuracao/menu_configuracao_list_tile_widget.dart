import 'package:flutter/material.dart';

import '../textos_widget.dart';

class MenuConfiguracaoListTileWidget extends StatelessWidget {
  final String opcao;
  final Icon icone;
  const MenuConfiguracaoListTileWidget({
    Key? key,
    required this.opcao,
    required this.icone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: icone,
        title: BodyText1(opcao),
      ),
    );
  }
}
