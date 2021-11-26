import 'package:flutter/material.dart';

class Headline1 extends StatelessWidget {
  final String texto;
  final Color? color;
  const Headline1(
    this.texto, {
    Key? key,
    this.color,
  }) : super(key: key);

  TextStyle? _estiloEscolhido(BuildContext ctx) {
    TextStyle? retorno = Theme.of(ctx).textTheme.headline1;
    if (color != null) {
      retorno = retorno!.copyWith(
        color: color,
      );
    }
    return retorno;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: _estiloEscolhido(context),
    );
  }
}

class Headline2 extends StatelessWidget {
  final String texto;
  final Color? color;
  const Headline2(
    this.texto, {
    Key? key,
    this.color,
  }) : super(key: key);

  TextStyle? _estiloEscolhido(BuildContext ctx) {
    TextStyle? retorno = Theme.of(ctx).textTheme.headline2;
    if (color != null) {
      retorno = retorno!.copyWith(
        color: color,
      );
    }
    return retorno;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: _estiloEscolhido(context),
    );
  }
}

class Headline3 extends StatelessWidget {
  final String texto;
  final Color? color;
  const Headline3(
    this.texto, {
    Key? key,
    this.color,
  }) : super(key: key);

  TextStyle? _estiloEscolhido(BuildContext ctx) {
    TextStyle? retorno = Theme.of(ctx).textTheme.headline3;
    if (color != null) {
      retorno = retorno!.copyWith(
        color: color,
      );
    }
    return retorno;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: _estiloEscolhido(context),
    );
  }
}

class BodyText1 extends StatelessWidget {
  final String texto;
  final Color? color;
  final TextAlign? textAlign;
  const BodyText1(
    this.texto, {
    Key? key,
    this.color,
    this.textAlign,
  }) : super(key: key);

  TextStyle? _estiloEscolhido(BuildContext ctx) {
    TextStyle? retorno = Theme.of(ctx).textTheme.bodyText1;
    if (color != null) {
      retorno = retorno!.copyWith(
        color: color,
      );
    }
    return retorno;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: _estiloEscolhido(context),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
