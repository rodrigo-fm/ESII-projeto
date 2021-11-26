import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../../compartilhado/presentation/widgets/textos_widget.dart';

class EscolherDataWidget extends StatelessWidget {
  final ValueNotifier<DateTime?> notifier;
  final String textoEscolherValor;
  const EscolherDataWidget({
    Key? key,
    required this.notifier,
    required this.textoEscolherValor,
  }) : super(key: key);

  void exibirDatePicker(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).then((dataEscolhida) {
      notifier.value = dataEscolhida;
    });
  }

  String formatarData(DateTime data) {
    return DateFormat('dd/MM/yyyy').format(data);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => exibirDatePicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ValueListenableBuilder<DateTime?>(
          valueListenable: notifier,
          builder: (ctx, value, _) => BodyText1(
            value != null ? formatarData(value) : textoEscolherValor,
            color: Colors.grey,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
