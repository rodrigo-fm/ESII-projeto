import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../compartilhado/presentation/routes/usuario_routes.dart';
import '../../../../../../compartilhado/presentation/widgets/inputs_widget.dart';
import '../../../../../../compartilhado/presentation/widgets/textos_widget.dart';
import '../../../../compra/dominio/provider/compra_provider.dart';
import 'buscar_passagem_viewcontroller.dart';
import 'widgets/escolher_data_widget.dart';
import 'widgets/ida_e_volta_widget.dart';

class BuscarPassagemView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _viewcontroller = BuscarPassagemViewcontroller();
  BuscarPassagemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final compraProvider = Provider.of<CompraProvider>(context, listen: false);
    compraProvider.passagemEscolhida = null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aterrissar'),
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(UsuarioRoutes.menu);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              color: const Color(0xFF001db4),
              padding: const EdgeInsets.all(35),
              child: Column(
                children: [
                  const Headline2('Passagens aéreas'),
                  const SizedBox(height: 30),
                  IdaEVoltaWidget(notifier: _viewcontroller.idaEVolta),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 6,
                        child: EscolherDataWidget(
                            textoEscolherValor: 'Ida',
                            notifier: _viewcontroller.datasNotifier['ida']!),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 6,
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _viewcontroller.idaEVolta,
                          builder: (ctxV, value, _) {
                            if (!value) {
                              _viewcontroller.datasNotifier['volta']!.value =
                                  null;
                              return const SizedBox();
                            }
                            return EscolherDataWidget(
                              notifier: _viewcontroller.datasNotifier['volta']!,
                              textoEscolherValor: 'Volta',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InputDropdown(
                        opcoes: const ['AJU', 'GRU'],
                        label: 'Origem',
                        retornarValor: _viewcontroller.inputValores['origem'],
                      ),
                      InputDropdown(
                        opcoes: const ['AJU', 'GRU'],
                        label: 'Destino',
                        retornarValor: _viewcontroller.inputValores['destino'],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const BodyText1('Passageiros'),
                  SpinBox(
                    min: 1,
                    max: 5,
                    value: _viewcontroller.inputValores['passageiros'],
                    onChanged: (double valor) {
                      _viewcontroller.inputValores['passageiros'] = valor;
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => _viewcontroller.buscarPassagens(context),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    child: const BodyText1('Buscar passagens'),
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
