import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/models/kegiatan.dart';

class KegiatanForm extends StatefulWidget {
  final Kegiatan? kegiatan; // Optional parameter for editing existing kegiatan

  const KegiatanForm({Key? key, this.kegiatan}) : super(key: key);

  @override
  _KegiatanFormState createState() => _KegiatanFormState();
}

class _KegiatanFormState extends State<KegiatanForm> {
  final _formKey = GlobalKey<FormState>();
  final _judul = TextEditingController();
  final _nama = TextEditingController();
  final _deskripsi = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.kegiatan != null) {
      // Initialize controllers for editing
      _judul.text = widget.kegiatan!.judul;
      _nama.text = widget.kegiatan!.nama;
      _deskripsi.text = widget.kegiatan!.deskripsi;
      _selectedDate = widget.kegiatan!.tanggal;
    }
  }

  // fingsi untuk memilih Tanggal
  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  //fungsi untuk menyimpan data
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Kegiatan newKegiatan = Kegiatan(
        judul: _judul.text,
        nama: _nama.text,
        tanggal: _selectedDate,
        deskripsi: _deskripsi.text,
      );
      Navigator.pop(context, newKegiatan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.kegiatan == null
          ? Text('Tambah Kegiatan')
          : Text('Edit Kegiatan'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _judul,
                  decoration: InputDecoration(
                    labelText: 'Judul Kegiatan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan judul kegiatan';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _nama,
                  decoration: InputDecoration(
                    labelText: 'Nama Anda',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan Nama Anda';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                ListTile(
                  title: Text(
                    "Tanggal Kegiatan",
                  ),
                  subtitle: Text(
                      DateFormat('EEEE, d MMMM yyyy').format(_selectedDate)),
                  trailing: Icon(Icons.calendar_today, color: Colors.amber),
                  onTap: _pickDate,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _deskripsi,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi Kegiatan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap masukkan deskripsi kegiatan';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Batal',
            style: TextStyle(color: Colors.red),
          ),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: Text(
            widget.kegiatan == null ? 'Tambah' : 'Simpan',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }
}
