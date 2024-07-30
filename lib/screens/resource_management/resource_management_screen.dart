// lib/screens/resource_management/resource_management_screen.dart

import 'package:flutter/material.dart';
import '../../providers/mock_resource_data_provider.dart';

class ResourceManagementScreen extends StatelessWidget {
  final List<Map<String, dynamic>> inventory;
  final List<Map<String, dynamic>> expenses;

  ResourceManagementScreen({super.key})
      : inventory = MockResourceDataProvider.getInventory(),
        expenses = MockResourceDataProvider.getExpenses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resource Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildInventorySection(context),
              const SizedBox(height: 20),
              _buildExpenseManagementSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInventorySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Inventory Tracking',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...inventory.map((item) {
          final isLow = item['quantity'] <= item['threshold'];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: Icon(
                Icons.inventory_2,
                color: isLow ? Colors.red : Colors.green,
              ),
              title: Text(item['item']),
              subtitle: Text('Quantity: ${item['quantity']}'),
              trailing: isLow ? const Text('Low', style: TextStyle(color: Colors.red)) : null,
              onTap: () {
                _showInventoryDetails(context, item);
              },
            ),
          );
        }),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addInventoryScreen');
          },
          child: const Text('Add New Inventory'),
        ),
      ],
    );
  }

  Widget _buildExpenseManagementSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Expense Management',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...expenses.map((expense) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: const Icon(Icons.monetization_on, color: Colors.blue),
              title: Text(expense['item']),
              subtitle: Text('Date: ${expense['date']}'),
              trailing: Text('\$${expense['amount']}'),
            ),
          );
        }),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addExpenseScreen');
          },
          child: const Text('Add New Expense'),
        ),
      ],
    );
  }

  void _showInventoryDetails(BuildContext context, Map<String, dynamic> item) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item['item'],
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('Quantity: ${item['quantity']}'),
              Text('Threshold: ${item['threshold']}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/addInventoryScreen',
                    arguments: {'item': item, 'index': inventory.indexOf(item)},
                  );
                },
                child: const Text('Edit Inventory'),
              ),
            ],
          ),
        );
      },
    );
  }
}
