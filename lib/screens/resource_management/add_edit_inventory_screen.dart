// lib/screens/resource_management/add_edit_inventory_screen.dart

import 'package:flutter/material.dart';
import '../../providers/mock_resource_data_provider.dart';

class AddEditInventoryScreen extends StatefulWidget {
  final Map<String, dynamic>? item;
  final int? itemIndex;

  const AddEditInventoryScreen({Key? key, this.item, this.itemIndex}) : super(key: key);

  @override
  _AddEditInventoryScreenState createState() => _AddEditInventoryScreenState();
}

class _AddEditInventoryScreenState extends State<AddEditInventoryScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _itemName;
  late int _quantity;
  late int _threshold;

  @override
  void initState() {
    super.initState();
    _itemName = widget.item?['item'] ?? '';
    _quantity = widget.item?['quantity'] ?? 0;
    _threshold = widget.item?['threshold'] ?? 0;
  }

  void _saveInventory() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newItem = {
        'item': _itemName,
        'quantity': _quantity,
        'threshold': _threshold,
      };

      if (widget.item == null) {
        MockResourceDataProvider.addInventory(newItem);
      } else {
        MockResourceDataProvider.updateInventory(widget.itemIndex!, newItem);
      }

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null ? 'Add Inventory' : 'Edit Inventory'),
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
                  initialValue: _quantity.toString(),
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a quantity';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) => _quantity = int.parse(value!),
                ),
                TextFormField(
                  initialValue: _threshold.toString(),
                  decoration: const InputDecoration(labelText: 'Threshold'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a threshold';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) => _threshold = int.parse(value!),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveInventory,
                  child: const Text('Save Inventory'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
