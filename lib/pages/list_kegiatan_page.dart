import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/models/kegiatan.dart';
import 'form_kegiatan_page.dart';

class ListKegiatanPage extends StatelessWidget {
  final List<Kegiatan> kegiatanList;

  ListKegiatanPage({required this.kegiatanList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Kegiatan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('kegiatan').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var docs = snapshot.data!.docs;
          var kegiatanList = docs
              .map(
                  (doc) => Kegiatan.fromMap(doc.data() as Map<String, dynamic>))
              .toList();

          return kegiatanList.isEmpty
              ? Center(child: Text('Belum ada kegiatan'))
              : ListView.builder(
                  itemCount: kegiatanList.length,
                  itemBuilder: (context, index) {
                    Kegiatan kegiatan = kegiatanList[index];
                    return GestureDetector(
                      onTap: () {
                        _showDetailDialog(context, kegiatan);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(kegiatan.judul),
                          subtitle: Text(DateFormat('EEEE, d MMMM yyyy')
                              .format(kegiatan.tanggal)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                                onPressed: () async {
                                  Kegiatan? editedKegiatan =
                                      await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => KegiatanForm(
                                        kegiatan: kegiatan,
                                      ),
                                    ),
                                  );

                                  if (editedKegiatan != null) {
                                    final docRef = FirebaseFirestore.instance
                                        .collection('kegiatan')
                                        .doc(docs[index].id);
                                    try {
                                      await docRef
                                          .update(editedKegiatan.toMap());
                                      print('Kegiatan updated successfully!');
                                    } on FirebaseException catch (e) {
                                      // Handle update error gracefully
                                      print(
                                          'Error updating kegiatan: ${e.message}');
                                    }
                                  }
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () => showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Konfirmasi Hapus'),
                                    content: const Text(
                                        'Apakah Anda yakin ingin menghapus kegiatan ini?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: const Text('Batal'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: const Text(
                                          'Hapus',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).then((confirmed) async {
                                  if (confirmed ?? false) {
                                    // Delete activity if confirmed
                                    await FirebaseFirestore.instance
                                        .collection('kegiatan')
                                        .doc(docs[index].id)
                                        .delete();
                                  }
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Kegiatan? newKegiatan = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => KegiatanForm(),
            ),
          );
          if (newKegiatan != null) {
            await FirebaseFirestore.instance
                .collection('kegiatan')
                .add(newKegiatan.toMap());
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.amberAccent,
      ),
    );
  }

  void _showDetailDialog(BuildContext context, Kegiatan kegiatan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Kegiatan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Judul:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(kegiatan.judul),
              SizedBox(height: 12.0),
              Text(
                'Nama:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(kegiatan.nama),
              SizedBox(height: 12.0),
              Text(
                'Tanggal:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                DateFormat('EEEE, d MMMM yyyy').format(kegiatan.tanggal),
              ),
              SizedBox(height: 12.0),
              Text(
                'Deskripsi:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(kegiatan.deskripsi),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Tutup',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        );
      },
    );
  }
}
