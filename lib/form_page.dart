import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_hadmc/src/features/forms/controllers/form_controller.dart';
import 'package:project_hadmc/src/core/di/injection.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  var textScreen = 'Dados';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    final formController = getIt<FormController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 203, 150, 168),
        title: const Text('Formulário'),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Nome'),
                hintText: 'Digite seu nome',
              ),
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('E-mail'),
                hintText: 'Digite seu e-mail',
              ),
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Endereço'),
                hintText: 'Digite seu endereço',
              ),
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Name'),
              ],
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    formController.clearInformations();
                    _nameController.clear();
                    _emailController.clear();
                    _addressController.clear();
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => formController.updateInformations(
                    _nameController.text,
                    _emailController.text,
                    _addressController.text,
                  ),
                  child: const Text('Confirm'),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(8.0)),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text(textScreen)),
            ),
          ],
        ),
      ),
    );
  }
//a

}
