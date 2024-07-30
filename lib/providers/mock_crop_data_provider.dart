// lib/services/mock_crop_data_provider.dart

class MockCropDataProvider {
  static List<Map<String, dynamic>> getPlantingSchedules() {
    return [
      {'crop': 'Wheat', 'optimalTime': 'Spring', 'details': 'Wheat should be planted in spring when the soil temperature is around 10°C.'},
      {'crop': 'Corn', 'optimalTime': 'Late Spring', 'details': 'Corn should be planted after the last frost in late spring.'},
      {'crop': 'Tea', 'optimalTime': 'Spring', 'details': 'Tea should be planted in spring when the soil temperature is around 10°C.'},
      {'crop': 'Tomato', 'optimalTime': 'Early Summer', 'details': 'Tomatoes should be planted in early summer when the soil is warm.'},
    ];
  }

  static List<Map<String, dynamic>> getCropCareGuides() {
    return [
      {'crop': 'Wheat', 'care': 'Pest control: Use appropriate pesticides. Fertilization: Apply nitrogen-rich fertilizers. Irrigation: Water moderately.'},
      {'crop': 'Corn', 'care': 'Pest control: Monitor for pests like corn borers. Fertilization: Apply phosphorus and potassium. Irrigation: Ensure adequate moisture during the growing season.'},
      {'crop': 'Tomato', 'care': 'Pest control: Use organic pesticides. Fertilization: Use balanced fertilizers. Irrigation: Water regularly, avoid wetting leaves.'},
    ];
  }
}
