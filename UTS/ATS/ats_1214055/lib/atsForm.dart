import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';

class MyInputForm1 extends StatefulWidget {
  const MyInputForm1({Key? key}) : super(key: key);

  @override
  _MyInputForm1State createState() => _MyInputForm1State();
}

class _MyInputForm1State extends State<MyInputForm1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerPhoneNumber = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  final List<Map<String, dynamic>> _myDataList = [];
  Map<String, dynamic>? editedData;
  Color _currentColor = Color.fromARGB(255, 207, 5, 243);
  String? _dataFile;

  @override
  void dispose() {
    _controllerNama.dispose();
    _controllerPhoneNumber.dispose();
    _controllerDate.dispose();
    super.dispose();
  }

  void _addData() {
    final data = {
      'name': formatName(_controllerNama.text),
      'phonenumber': _controllerPhoneNumber.text,
      'date': _controllerDate.text,
      'color': _currentColor,
      'imagePath': _dataFile,
    };
    setState(() {
      if (editedData != null) {
        editedData!['name'] = data['name'];
        editedData!['phonenumber'] = data['phonenumber'];
        editedData!['date'] = data['date'];
        editedData!['color'] = data['color'];
        editedData!['imagePath'] = data['imagePath'];
        editedData = null;
      } else {
        _myDataList.add(data);
      }
      _controllerNama.clear();
      _controllerPhoneNumber.clear();
      _controllerDate.clear();
    });
  }

  void _editData(Map<String, dynamic> data) {
    setState(() {
      _controllerNama.text = data['name'];
      _controllerPhoneNumber.text = data['phonenumber'];
      _controllerDate.text = data['date'];
      _currentColor = data['color'];
      _dataFile = null;
      editedData = data;
    });
  }

  void _deleteData(Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Data'),
          content: const Text('Apakah anda yakin ingin menghapus data ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _myDataList.remove(data);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  bool isAlpha(String value) {
    return RegExp(r'^[a-zA-Z ]+$').hasMatch(value);
  }

  String? _validateNama(String? value) {
    if (value!.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    if (value.length < 2) {
      return 'Nama minimal 2 kata';
    }
    if (!isAlpha(value)) {
      return 'Nama tidak boleh mengandung angka atau karakter khusus';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }
    if (value.length < 8 || value.length > 13) {
      return 'Panjang nomor telepon harus antara 8 dan 13 digit';
    }
    if (value[0] != '0') {
      return 'Nomor telepon harus dimulai dengan angka 0';
    }
    return null;
  }

  String? _validateDate(String? value) {
    if (value!.isEmpty) {
      return 'Tanggal tidak boleh kosong';
    }
    return null;
  }

  String formatName(String name) {
    List<String> words = name.split(' ');
    List<String> formattedWords = [];

    for (String word in words) {
      if (word.isNotEmpty) {
        String formattedWord =
            word[0].toUpperCase() + word.substring(1).toLowerCase();
        formattedWords.add(formattedWord);
      }
    }
    return formattedWords.join(' ');
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime pickedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != pickedDate)
      setState(() {
        _controllerDate.text =
            DateFormat('MMMM dd yyyy').format(picked.toLocal());
      });
  }

  void _selectColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _currentColor,
              onColorChanged: (Color color) {
                setState(() {
                  _currentColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _pickFile() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    setState(() {
      _dataFile = pickedFile.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Contact'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerNama,
                    validator: _validateNama,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      hintText: 'Masukkan Nama anda Disini',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Color.fromARGB(255, 208, 250, 236),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerPhoneNumber,
                    validator: _validatePhoneNumber,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Masukkan Nomor telepon',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Color.fromARGB(255, 208, 250, 236),
                      filled: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerDate,
                    validator: _validateDate,
                    decoration: const InputDecoration(
                      labelText: 'Date',
                      hintText: 'Pilih Tanggal',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Color.fromARGB(255, 208, 250, 236),
                      filled: true,
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () => _selectDate(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Color',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 340,
                          height: 100,
                          child: ElevatedButton(
                            onPressed: _selectColor,
                            style: ElevatedButton.styleFrom(
                              primary: _currentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Container(),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: _selectColor,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _currentColor,
                      ),
                      child: Text('Pick Color'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Pick File',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: ElevatedButton(
                          child: Text('Pick and Open File'),
                          onPressed: () {
                            _pickFile();
                          },
                        ),
                      ),
                      if (_dataFile != null) Text('Image Path: $_dataFile')
                    ],
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  child: Text(editedData != null ? "Update" : "Submit"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addData();
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'List Contact',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _myDataList.length,
                  itemBuilder: (context, index) {
                    final data = _myDataList[index];
                    final firstName = (data['name'] ?? '').split(' ').first;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Text(
                              firstName.isNotEmpty ? firstName[0] : '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data['name'] ?? ''),
                                Text(data['phonenumber'] ?? ''),
                                Text(data['date'] ?? ''),
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: data['color'],
                                ),
                                if (_dataFile != null)
                                  Text('Image Path: $_dataFile')
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _editData(data);
                              });
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _deleteData(data);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
