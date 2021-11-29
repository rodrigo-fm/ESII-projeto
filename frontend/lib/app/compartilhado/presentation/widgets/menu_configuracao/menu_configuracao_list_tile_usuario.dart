import 'package:flutter/material.dart';

import '../textos_widget.dart';

class MenuConfiguracaoListTileUsuario extends StatelessWidget {
  final String email;
  const MenuConfiguracaoListTileUsuario({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        // ignore: prefer_const_constructors
        leading: Icon(
          Icons.account_circle,
          size: 70.0,
        ),
        subtitle: BodyText2(email),
      ),
    );
  }
}
