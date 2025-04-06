import 'package:flutter/material.dart';

class ConsultDoctorScreen extends StatelessWidget {
  const ConsultDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consult a doctor'),
      ),
      body: const Center(
        child: Text('Consult a doctor Screen Content'),
      ),
    );
  }
}