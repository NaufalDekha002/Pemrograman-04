import 'package:flutter/material.dart';

class MyInputValidation extends StatefulWidget {
  const MyInputValidation({super.key});

  @override
  State<MyInputValidation> createState() => _MyInputValidationState();
}

class _MyInputValidationState extends State<MyInputValidation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerNama.dispose();
    super.dispose();
  }

  String? validateEmail(String? value) {
    const String expression = "[a-zA-Z0-9+._%-+]{1,256}"
        "\\@"
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
        "("
        "\\."
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
        ")+";
    final RegExp regExp = RegExp(expression);

    if (value == null || value.isEmpty) {
      return 'Email Tidak Boleh Kosong !';
    }
    if (!regExp.hasMatch(value)) {
      return 'Email Tidak Valid !';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama Tidak Boleh Kosong !';
    }
    if (value.length < 3) {
      return 'Nama Minimal 10 Karakter !';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Form Validation'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerNama,
                    decoration: const InputDecoration(
                        hintText: 'Write your name here...',
                        labelText: 'Your Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        filled: true),
                    validator: validateName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: 'Write your email here...',
                        labelText: 'Your Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        filled: true),
                    validator: validateEmail,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                'Nama: ${_controllerNama.text}'),
                                            const SizedBox(height: 20),
                                            Text(
                                                'Email: ${_controllerEmail.text}'),
                                          ]),
                                    );
                                  });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Please fill the form correctly'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          child: const Text('Submit')),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}