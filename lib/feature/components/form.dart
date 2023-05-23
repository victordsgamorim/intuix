import 'package:flutter/material.dart';

class FormBase extends StatefulWidget {
  final List<Widget>? texts;
  final List<Widget> forms;
  final List<Widget> Function(FormState? state) buttons;

  const FormBase({
    super.key,
    required this.forms,
    required this.buttons,
    this.texts,
  });

  @override
  State<FormBase> createState() => _FormBaseState();
}

class _FormBaseState extends State<FormBase> {
  late final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (widget.texts != null) ...?widget.texts,
          ...widget.forms,
          ...widget.buttons(_formState.currentState)
        ],
      ),
    );
  }
}
