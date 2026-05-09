import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: WorkshopPage());
  }
}

class WorkshopPage extends StatelessWidget {
  WorkshopPage({super.key});

  // 1. Kita buat daftar datanya di sini agar mudah ditambah/dikurangi
  final List<Map<String, String>> dataWorkshop = [
    {
      'judul': 'Flutter Mobile Development',
      'tanggal': '10 Mei 2026',
      'lokasi': 'Lab Komp 1',
      'kuota': '15/30',
    },
    {
      'judul': 'Web Security Seminar',
      'tanggal': '15 Mei 2026',
      'lokasi': 'Aula Utama',
      'kuota': '5/50',
    },
    {
      'judul': 'UI/UX Design Masterclass',
      'tanggal': '18 Mei 2026',
      'lokasi': 'Ruang Vicon',
      'kuota': '20/40',
    },
    {
      'judul': 'Machine Learning Basics',
      'tanggal': '20 Mei 2026',
      'lokasi': 'Lab Komp 2',
      'kuota': '30/30 (Penuh)',
    },
    {
      'judul': 'Cloud Computing with AWS',
      'tanggal': '22 Mei 2026',
      'lokasi': 'Aula Utama',
      'kuota': '10/100',
    },
    {
      'judul': 'Data Science Bootcamp',
      'tanggal': '25 Mei 2026',
      'lokasi': 'Lab Komp 3',
      'kuota': '12/25',
    },
    {
      'judul': 'Game Dev with Unity',
      'tanggal': '28 Mei 2026',
      'lokasi': 'Lab Game',
      'kuota': '8/20',
    },
    {
      'judul': 'DevOps Engineering',
      'tanggal': '01 Jun 2026',
      'lokasi': 'Ruang Server',
      'kuota': '5/15',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop Kampus'),
        backgroundColor: Colors.blueAccent,
      ),
      // 2. Gunakan ListView.builder untuk data yang banyak
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: dataWorkshop.length, // Menghitung jumlah data otomatis
        itemBuilder: (context, index) {
          final ws = dataWorkshop[index]; // Mengambil data ke-N
          return WorkshopCard(
            judul: ws['judul']!,
            tanggal: ws['tanggal']!,
            lokasi: ws['lokasi']!,
            kuota: ws['kuota']!,
          );
        },
      ),
    );
  }
}

class WorkshopCard extends StatelessWidget {
  final String judul;
  final String tanggal;
  final String lokasi;
  final String kuota;

  const WorkshopCard({
    super.key,
    required this.judul,
    required this.tanggal,
    required this.lokasi,
    required this.kuota,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('📅 $tanggal'), Text('📍 $lokasi')],
            ),
            const SizedBox(height: 10),
            Text(
              'Sisa Kuota: $kuota',
              style: TextStyle(
                // Mengubah warna jadi abu-abu jika kuota penuh
                color: kuota.contains('Penuh') ? Colors.grey : Colors.redAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: kuota.contains('Penuh')
                    ? null
                    : () {}, // Tombol mati jika penuh
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  kuota.contains('Penuh')
                      ? 'Pendaftaran Ditutup'
                      : 'Daftar Sekarang',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
