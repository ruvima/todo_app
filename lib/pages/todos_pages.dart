import 'package:flutter/material.dart';

class TodosPages extends StatelessWidget {
  const TodosPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
      ),
      body: const Center(
        child: Text('TodosPages'),
      ),
    );
  }
}
