// lib/screens/add_funds_screen.dart

import 'package:flutter/material.dart';
import '../models/user.dart';

class AddFundsScreen extends StatefulWidget {
  const AddFundsScreen({super.key});

  @override
  State<AddFundsScreen> createState() => _AddFundsScreenState();
}

class _AddFundsScreenState extends State<AddFundsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _to = User.accounts[0]['name']; // Default account
  double _amount = 0.0;

  void _addFunds() {
    if (_formKey.currentState!.validate()) {
      User.updateBalance(_amount, true);
      User.updateAccountBalance(_to, _amount, true);
      User.addTransaction('Added Funds to $_to', _amount, 'credit');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Funds added successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Funds')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Fixed: Use initialValue + proper generic type
              DropdownButtonFormField<String>(
                value: _to,
                decoration: const InputDecoration(
                  labelText: 'To Account',
                  border: OutlineInputBorder(),
                ),
                items: User.accounts.map((account) {
                  return DropdownMenuItem<String>(
                    value: account['name'] as String,
                    child: Text(account['name'] as String),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() => _to = newValue);
                  }
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                  prefixText: '\$ ',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Enter a valid positive amount';
                  }
                  return null;
                },
                onChanged: (value) {
                  _amount = double.tryParse(value) ?? 0.0;
                },
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _addFunds,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Add Funds', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}