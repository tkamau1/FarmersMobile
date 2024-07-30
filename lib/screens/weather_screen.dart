import 'package:flutter/material.dart';
import '../providers/mock_weather_data_provider.dart';

class WeatherForecastScreen extends StatelessWidget {
  final Map<String, dynamic> currentWeather;
  final List<Map<String, String>> weeklyForecast;
  final List<String> weatherAlerts;
  final Map<String, String> preparationAdvice;

  // Remove `const` and use a regular constructor
  WeatherForecastScreen({super.key})
      : currentWeather = MockWeatherDataProvider.getCurrentWeather(),
        weeklyForecast = MockWeatherDataProvider.getWeeklyForecast(),
        weatherAlerts = MockWeatherDataProvider.getWeatherAlerts(),
        preparationAdvice = MockWeatherDataProvider.getPreparationAdvice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildCurrentWeatherSection(),
              const SizedBox(height: 20),
              _buildWeeklyForecastSection(),
              const SizedBox(height: 20),
              _buildWeatherAlertsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentWeatherSection() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        leading: const Icon(Icons.wb_sunny, size: 50.0, color: Colors.orange),
        title: Text(
          '${currentWeather['temperature']} - ${currentWeather['condition']}',
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Location: ${currentWeather['location']}',
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  Widget _buildWeeklyForecastSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weekly Forecast',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...weeklyForecast.map((dayForecast) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.blue),
              title: Text(dayForecast['day']!),
              subtitle: Text(dayForecast['forecast']!),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildWeatherAlertsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weather Alerts',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...weatherAlerts.map((alert) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: const Icon(Icons.warning, color: Colors.red),
              title: Text(alert),
              subtitle: Text(preparationAdvice[_getAlertType(alert)] ?? ''),
            ),
          );
        }),
      ],
    );
  }

  String _getAlertType(String alert) {
    if (alert.contains('Storm')) {
      return 'Storm';
    } else if (alert.contains('High Temperature')) {
      return 'High Temperature';
    }
    return 'General';
  }
}
