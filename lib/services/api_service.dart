import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/bike_network.dart';

class ApiService {
  static Future<List<BikeNetwork>> fetchNetworks() async {
    final url = Uri.parse('http://api.citybik.es/v2/networks?fields=id,name,location');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> networksJson = json.decode(response.body)['networks'];

      return networksJson.map((json) => BikeNetwork.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data jaringan');
    }
  }
}
