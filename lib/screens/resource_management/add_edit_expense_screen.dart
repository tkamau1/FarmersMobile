// lib/screens/resource_management/add_edit_expense_screen.dart

import 'package:flutter/material.dart';
import '../../providers/mock_resource_data_provider.dart';

class AddEditExpenseScreen extends StatefulWidget {
  final Map<String, dynamic>? expense;
  final int? expenseIndex;

  const AddEditExpenseScreen({Key? key, this.expense, this.expenseIndex}) : super(key: key);

  @override
  _AddEditExpenseScreenState createState() => _AddEditExpenseScreenState();
}

class _AddEditExpenseScreenState extends State<AddEditExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _itemName;
  late String _date;
  late double _amount;

  @override
  void initState() {
    super.initState();
    _itemName = widget.expense?['item'] ?? '';
    _date = widget.expense?['date'] ?? '';
    _amount = widget.expense?['amount']?.toDouble() ?? 0.0;
  }

  void _saveExpense() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newExpense = {
        'item': _itemName,
        'date': _date,
        'amount': _amount,
      };

      if (widget.expense == null) {
        MockResourceDataProvider.addExpense(newExpense);
      } else {
        MockResourceDataProvider.updateExpense(widget.expenseIndex!, newExpense);
      }

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.expense == null ? 'Add Expense' : 'Edit Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: _itemName,
                  decoration: const InputDecoration(labelText: 'Item Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an item name';
                    }
                    return null;
                  },
                  onSaved: (value) => _itemName = value!,
                ),
                TextFormField(
                  initialValue: _date,
                  decoration: const InputDecoration(labelText: 'Date'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a date';
                    }
                    return null;
                  },
                  onSaved: (value) => _date = value!,
                ),
                TextFormField(
                  initialValue: _amount.toString(),
                  decoration: const InputDecoration(labelText: 'Amount'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an amount';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) => _amount = double.parse(value!),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveExpense,
                  child: const Text('Save Expense'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
