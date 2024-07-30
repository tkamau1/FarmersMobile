// lib/screens/market_prices_screen.dart

import 'package:flutter/material.dart';
import '../providers/mock_market_data_provider.dart';

class MarketPricesScreen extends StatelessWidget {
  final Map<String, dynamic> livePrices;
  final List<Map<String, dynamic>> priceTrends;
  final List<Map<String, dynamic>> priceAlerts;

  // Remove `const` and use a regular constructor
  MarketPricesScreen({super.key})
      : livePrices = MockMarketDataProvider.getLiveMarketPrices(),
        priceTrends = MockMarketDataProvider.getPriceTrends(),
        priceAlerts =MockMarketDataProvider.getPriceAlerts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Prices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildLiveMarketPricesSection(),
              const SizedBox(height: 20),
              _buildPriceTrendsSection(),
              const SizedBox(height: 20),
              _buildPriceAlertsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLiveMarketPricesSection() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        title: const Text(
          'Live Market Prices',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: livePrices.entries.map((entry) {
            return Text('${entry.key}: ${entry.value}');
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPriceTrendsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Trends',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // You can use a chart library here to visualize the trends
        // For now, we'll just list the trends
        ...priceTrends.map((trend) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: const Icon(Icons.trending_up, color: Colors.blue),
              title: Text('${trend['crop']} - ${trend['month']}'),
              subtitle: Text('Price: \$${trend['price']}'),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildPriceAlertsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price Alerts',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...priceAlerts.map((alert) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.red),
              title: Text(alert['commodity']),
              subtitle: Text(alert['alert']),
            ),
          );
        }),
      ],
    );
  }
}


// Consider integrating a chart library (like fl_chart or charts_flutter) if you need graphical representation of price trends.

