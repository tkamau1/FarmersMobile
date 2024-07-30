// lib/providers/mock_resource_data_provider.dart

class MockResourceDataProvider {
  static final List<Map<String, dynamic>> _inventory = [
    {
      'item': 'Seeds',
      'quantity': 100,
      'threshold': 20,
    },
    {
      'item': 'Fertilizer',
      'quantity': 50,
      'threshold': 10,
    },
    {'item': 'Pesticides', 'quantity': 30, 'threshold': 8},
  ];

  static final List<Map<String, dynamic>> _expenses = [
    {
      'item': 'Tractor Fuel',
      'date': '2023-07-20',
      'amount': 100.0,
    },
    {
      'item': 'Pesticides',
      'date': '2023-07-21',
      'amount': 50.0,
    },
    {'date': '2024-07-01', 'item': 'Seeds', 'amount': 100},

  ];

  static List<Map<String, dynamic>> getInventory() {
    return _inventory;
  }

  static List<Map<String, dynamic>> getExpenses() {
    return _expenses;
  }

  static void addInventory(Map<String, dynamic> item) {
    _inventory.add(item);
  }

  static void updateInventory(int index, Map<String, dynamic> updatedItem) {
    _inventory[index] = updatedItem;
  }

  static void addExpense(Map<String, dynamic> expense) {
    _expenses.add(expense);
  }

  static void updateExpense(int index, Map<String, dynamic> updatedExpense) {
    _expenses[index] = updatedExpense;
  }
}
