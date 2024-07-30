import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildFeatureTile(
                context,
                'Crop Management',
                Icons.agriculture,
                '/crop-management',
              ),
              const SizedBox(height: 10),
              _buildFeatureTile(
                context,
                'Weather Forecast',
                Icons.wb_sunny,
                '/weather-forecast',
              ),
              const SizedBox(height: 10),
              _buildFeatureTile(
                context,
                'Market Prices',
                Icons.show_chart,
                '/market-prices',
              ),
              const SizedBox(height: 10),
              _buildFeatureTile(
                context,
                'Expert Advice',
                Icons.support_agent,
                '/expert-advice',
              ),
              const SizedBox(height: 10),
              _buildFeatureTile(
                context,
                'Task Management',
                Icons.task,
                '/task-management',
              ),
              const SizedBox(height: 10),
              _buildFeatureTile(
                context,
                'Resource Management',
                Icons.inventory,
                '/resource-management',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureTile(
      BuildContext context, String title, IconData icon, String route) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        leading: Icon(icon, size: 40.0, color: Colors.green),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward, color: Colors.green),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
