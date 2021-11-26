import 'package:flutter/material.dart';

import '../../../../../../../compartilhado/presentation/widgets/textos_widget.dart';

class IdaEVoltaWidget extends StatelessWidget {
  final ValueNotifier<bool> notifier;

  const IdaEVoltaWidget({
    Key? key,
    required this.notifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: notifier,
      builder: (ctx, value, _) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Estes dois GestureDetectors podem ser componentizados,
          // mas não pensei em um nome criativo para dar a eles
          GestureDetector(
            onTap: () {
              notifier.value = true;
            },
            child: Container(
              child: const BodyText1('IDA E VOLTA'),
              decoration: value
                  ? const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    )
                  : const BoxDecoration(),
            ),
          ),
          GestureDetector(
            onTap: () {
              notifier.value = false;
            },
            child: Container(
              child: const BodyText1('SÓ IDA'),
              decoration: !value
                  ? const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    )
                  : const BoxDecoration(),
            ),
          ),
        ],
      ),
    );
  }
}
