import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  const MyInput({super.key});
  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  TextEditingController _controller = TextEditingController();
  bool lightOn = false;
  String? language;
  bool agree = false;

  void showSnackbar(String selectedLanguage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Anda memilih bahasa: $selectedLanguage'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widget'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Write your name here...',
                  labelText: 'Your Name',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text('Hello ${_controller.text}'),
                        );
                      });
                },
              ),
              Switch(
                  value: lightOn,
                  onChanged: (bool value) {
                    setState(() {
                      lightOn = value;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(lightOn ? 'Light On' : 'Light Off'),
                      duration: const Duration(seconds: 1),
                    ));
                  }),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Radio<String>(
                      value: 'Dart',
                      groupValue: language,
                      onChanged: (String? value) {
                        setState(() {
                          language = value;
                          showSnackbar('Dart');
                        });
                      },
                    ),
                    title: Text('Dart'),
                  ),
                  ListTile(
                    leading: Radio<String>(
                      value: 'Kotlin',
                      groupValue: language,
                      onChanged: (String? value) {
                        setState(() {
                          language = value;
                          showSnackbar('Kotlin');
                        });
                      },
                    ),
                    title: Text('Kotlin'),
                  ),
                  ListTile(
                    leading: Radio<String>(
                      value: 'Swift',
                      groupValue: language,
                      onChanged: (String? value) {
                        setState(() {
                          language = value;
                          showSnackbar('Swift');
                        });
                      },
                    ),
                    title: Text('Swift'),
                  ),
                ],
              ),
              ListTile(
                leading: Checkbox(
                  value: agree,
                  onChanged: (bool? value) {
                    setState(() {
                      agree = value!;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(agree ? 'Agree' : 'Disagree'),
                      duration: const Duration(seconds: 1),
                    ));
                  },
                ),
                title: Text('Agree / Disagree'),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

