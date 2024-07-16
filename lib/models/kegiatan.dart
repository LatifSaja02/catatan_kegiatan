import 'package:cloud_firestore/cloud_firestore.dart';

class Kegiatan {
  String judul;
  String nama;
  DateTime tanggal;
  String deskripsi;

  Kegiatan({
    required this.judul,
    required this.nama,
    required this.tanggal,
    required this.deskripsi,
  });

  Map<String, dynamic> toMap() {
    return {
      'judul': judul,
      'nama': nama,
      'tanggal': tanggal,
      'deskripsi': deskripsi,
    };
  }

  static Kegiatan fromMap(Map<String, dynamic> map) {
    return Kegiatan(
      judul: map['judul'],
      nama: map['nama'],
      tanggal: (map['tanggal'] as Timestamp).toDate(),
      deskripsi: map['deskripsi'],
    );
  }
}
