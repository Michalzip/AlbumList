import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key, required this.model}) : super(key: key);
  final ApiModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(model.title));
  }
}
