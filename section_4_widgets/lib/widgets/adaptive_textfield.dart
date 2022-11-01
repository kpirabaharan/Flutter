import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveTextField extends StatelessWidget {
  final String textPlaceHolder;
  final TextInputType txtInput;
  final TextEditingController controller;
  final Function handler;

  AdaptiveTextField(
      this.textPlaceHolder, this.txtInput, this.controller, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            style: TextStyle(fontSize: 24),
            controller: controller,
            placeholder: textPlaceHolder,
            decoration: BoxDecoration(
              color: CupertinoColors.extraLightBackgroundGray,
              border: Border.all(
                width: 2,
                color: CupertinoColors.lightBackgroundGray,
              ),
            ),
            keyboardType: txtInput,
            onSubmitted: (_) => handler(),
          )
        : TextField(
            controller: controller,
            decoration: InputDecoration(labelText: '${textPlaceHolder}: '),
            keyboardType: txtInput,
            onSubmitted: (_) => handler(),
          );
  }
}
