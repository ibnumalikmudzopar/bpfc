import 'package:flutter/material.dart';

class Mockup extends StatefulWidget {
  @override
  _MockupState createState() => _MockupState();
}

class _MockupState extends State<Mockup> {
  final _formKey = GlobalKey<FormState>(); // Kunci untuk Form
  final TextEditingController _tanggalLahirController = TextEditingController();
  String? _name;
  String? _whatsappNumber;
  String? _birthDate;
  String? _gender;
  String? _status;
  String? _job;
  String? _address;
  String? _email;
  DateTime? _tanggalLahir;
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Menghindari tampilan terpotong saat keyboard muncul
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Form(
              key: _formKey, // Menambahkan FormKey
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  // Banner Foto
                  Container(
                    height: screenHeight * 0.2, // Ukuran responsif
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/banner.jpeg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Jarak responsif

                  // Input Nama
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _name = value;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Input Nomor WhatsApp
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nomor WhatsApp',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor WhatsApp tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _whatsappNumber = value;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Tanggal Lahir dan Jenis Kelamin dalam satu Row
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _tanggalLahirController,
                          decoration: InputDecoration(
                            labelText: 'Tanggal Lahir',
                            suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: _tanggalLahir ?? DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                _tanggalLahir = pickedDate;
                                _tanggalLahirController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                              });
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tanggal lahir tidak boleh kosong';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _birthDate = value;
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Jenis Kelamin',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          items: ['Laki-laki', 'Perempuan'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _gender = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Jenis kelamin harus dipilih';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Status dan Pekerjaan dalam satu Row
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Status',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          items: ['Menikah', 'Belum Menikah'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _status = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Status harus dipilih';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Pekerjaan',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          items: ['PNS', 'Swasta', 'Lainnya'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _job = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Pekerjaan harus dipilih';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Input Alamat
                  TextFormField(
                    maxLines: 2, // txtfield 2baris
                    decoration: InputDecoration(
                      labelText: 'Alamat',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _address = value;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Input Email
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _email = value;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Tombol Simpan
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Jika form valid, simpan data
                          // Anda bisa melakukan sesuatu dengan data di sini
                          print('Nama: $_name');
                          print('Nomor WhatsApp: $_whatsappNumber');
                          print('Tanggal Lahir: $_birthDate');
                          print('Jenis Kelamin: $_gender');
                          print('Status: $_status');
                          print('Pekerjaan: $_job');
                          print('Alamat: $_address');
                          print('Email: $_email');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,  
                      ),
                      child: Text(
                        'Simpan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
