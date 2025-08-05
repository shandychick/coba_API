import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/bike_network.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<BikeNetwork>> _networkFuture;

  @override
  void initState() {
    super.initState();
    _networkFuture = ApiService.fetchNetworks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Jaringan Sepeda'),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<BikeNetwork>>(
        future: _networkFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data jaringan tersedia.'));
          } else {
            final networks = snapshot.data!;
            return ListView.builder(
              itemCount: networks.length,
              itemBuilder: (context, index) {
                final network = networks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.pedal_bike),
                    title: Text(network.name),
                    subtitle: Text('ID: ${network.id}\nLokasi: ${network.location}'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
