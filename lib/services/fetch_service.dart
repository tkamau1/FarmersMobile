import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/constants.dart';

class FetchService {
  final String baseUrl = Constants.backendUrl;

  Future<List<dynamic>> fetchPlantingSchedules() async {
    final url = '$baseUrl/planting-schedules';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load planting schedules');
    }
  }

  Future<List<dynamic>> fetchCropCareGuides() async {
    final url = '$baseUrl/crop-care-guides';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load crop care guides');
    }
  }

  Future<String> fetchWeather() async {
    final url = '$baseUrl/weather';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather information');
    }
  }

  Future<List<dynamic>> fetchMarketPrices() async {
    final url = '$baseUrl/market-prices';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load market prices');
    }
  }
}
