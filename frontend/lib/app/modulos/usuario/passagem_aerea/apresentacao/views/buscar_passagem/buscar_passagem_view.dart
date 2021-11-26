import 'package:flutter/material.dart';

import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import 'widgets/escolher_data_widget.dart';
import 'widgets/ida_e_volta_widget.dart';

class BuscarPassagemView extends StatelessWidget {
  final ValueNotifier<bool> _idaEVolta = ValueNotifier<bool>(true);
  final Map<String, ValueNotifier<DateTime?>> _datasNotifier = {
    'ida': ValueNotifier<DateTime?>(null),
    'volta': ValueNotifier<DateTime?>(null),
  };
  final _formKey = GlobalKey<FormState>();
  BuscarPassagemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aterrissar'),
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            // TOOD: componentizar este container inteiro como o cabeçalho
            // da busca da tela inicial
            Container(
              color: const Color(0xFF001db4),
              padding: const EdgeInsets.all(35),
              child: Column(
                children: [
                  const Headline2('Passagens aéreas'),
                  const SizedBox(height: 30),
                  IdaEVoltaWidget(notifier: _idaEVolta),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 6,
                        child: EscolherDataWidget(
                            textoEscolherValor: 'Ida',
                            notifier: _datasNotifier['ida']!),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 6,
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _idaEVolta,
                          builder: (ctxV, value, _) {
                            if (!value) {
                              _datasNotifier['volta']!.value = null;
                              return const SizedBox();
                            }
                            return EscolherDataWidget(
                              notifier: _datasNotifier['volta']!,
                              textoEscolherValor: 'Volta',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
