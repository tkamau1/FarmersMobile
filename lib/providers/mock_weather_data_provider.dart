// lib/services/mock_weather_data_provider.dart
class MockWeatherDataProvider {
  static Map<String, dynamic> getCurrentWeather() {
    return {
      'temperature': '28°C',
      'condition': 'Sunny',
      'location': 'Farmer\'s Location',
    };
  }

  static List<Map<String, String>> getWeeklyForecast() {
    return [
      {'day': 'Monday', 'forecast': 'Sunny, 30°C'},
      {'day': 'Tuesday', 'forecast': 'Partly Cloudy, 28°C'},
      {'day': 'Wednesday', 'forecast': 'Rainy, 25°C'},
      {'day': 'Thursday', 'forecast': 'Sunny, 29°C'},
      {'day': 'Friday', 'forecast': 'Thunderstorms, 27°C'},
      {'day': 'Saturday', 'forecast': 'Sunny, 31°C'},
      {'day': 'Sunday', 'forecast': 'Cloudy, 26°C'},
    ];
  }

  static List<String> getWeatherAlerts() {
    return [
      'Storm expected on Friday. Secure your equipment.',
      'High temperatures expected tomorrow. Water your crops in the evening.',
    ];
  }

  static Map<String, String> getPreparationAdvice() {
    return {
      'Storm': 'Secure loose items, cover sensitive crops, and stay indoors.',
      'High Temperature': 'Ensure adequate water supply and shade for crops.',
    };
  }
}