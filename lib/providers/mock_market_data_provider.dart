// lib/services/mock_market_data_provider.dart

class MockMarketDataProvider {
  static Map<String, dynamic> getLiveMarketPrices() {
    return {
      'Wheat': '\$300/ton',
      'Corn': '\$250/ton',
      'Soybeans': '\$500/ton',
      'Milk': '\$1.50/liter',
    };
  }

  static List<Map<String, dynamic>> getPriceTrends() {
    return [
      {'crop': 'Wheat', 'month': 'Jan', 'price': 290},
      {'crop': 'Wheat', 'month': 'Feb', 'price': 295},
      {'crop': 'Corn', 'month': 'Jan', 'price': 245},
      {'crop': 'Corn', 'month': 'Feb', 'price': 250},
      // Add more historical data as needed
    ];
  }

  static List<Map<String, dynamic>> getPriceAlerts() {
    return [
      {'commodity': 'Wheat', 'alert': 'Price dropped below \$300/ton'},
      {'commodity': 'Corn', 'alert': 'Price exceeded \$250/ton'},
    ];
  }
}
