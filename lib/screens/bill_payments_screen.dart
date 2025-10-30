// lib/screens/bill_payments_screen.dart

import 'package:flutter/material.dart';
import '../models/user.dart';

class BillPaymentsScreen extends StatefulWidget {
  const BillPaymentsScreen({super.key});

  @override
  State<BillPaymentsScreen> createState() => _BillPaymentsScreenState();
}

class _BillPaymentsScreenState extends State<BillPaymentsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Default to the first account
  String _fromAccount = User.accounts[0]['name'] as String;
  String _biller = '';
  double _amount = 0.0;

  void _payBill() {
    if (!_formKey.currentState!.validate()) return;

    if (_amount > User.balance) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Insufficient balance')),
      );
      return;
    }

    // Update model
    User.updateBalance(_amount, false);
    User.updateAccountBalance(_fromAccount, _amount, false);
    User.addTransaction('Bill – $_biller', _amount, 'debit');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bill paid successfully!')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pay Bills')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ---------- ACCOUNT DROPDOWN ----------
              DropdownButtonFormField<String>(
                value: _fromAccount,               // <-- state variable (no deprecation)
                decoration: const InputDecoration(
                  labelText: 'From Account',
                  border: OutlineInputBorder(),
                ),
                items: User.accounts.map((acc) {
                  final name = acc['name'] as String;
                  return DropdownMenuItem<String>(
                    value: name,
                    child: Text(name),
                  );
                }).toList(),
                onChanged: (String? newVal) {
                  if (newVal != null) {
                    setState(() => _fromAccount = newVal);
                  }
                },
              ),

              const SizedBox(height: 16),

              // ---------- BILLER ----------
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Biller Name',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? 'Enter biller name' : null,
                onChanged: (v) => _biller = v,
              ),

              const SizedBox(height: 16),

              // ---------- AMOUNT ----------
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                  prefixText: '\$ ',
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter amount';
                  final num = double.tryParse(v);
                  if (num == null || num <= 0) return 'Enter a valid amount';
                  return null;
                },
                onChanged: (v) => _amount = double.tryParse(v) ?? 0.0,
              ),

              const SizedBox(height: 32),

              // ---------- PAY BUTTON ----------
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _payBill,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Pay Bill', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}