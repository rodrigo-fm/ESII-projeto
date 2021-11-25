import 'package:flutter/material.dart';
import 'app/app_widget.dart';

// o arquivo main.dart tem a função apenas de chamar o runApp()
void main() => runApp(const AppWidget());

// OBS: não foquei em configurar um provider para um gerenciamento de estado global
// nem nada do tipo porque isso pode ser colocado depois e não altera a estrutura de pastas tanto assim