// lib/screens/recharge_screen.dart
import 'package:flutter/material.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({super.key});
  @override State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  final _mobileCtrl = TextEditingController();
  String? _operator;
  String? _pack;

  final _operators = ['Jio', 'Airtel', 'Vi', 'BSNL'];
  final Map<String, List<String>> _packs = {
    'Jio': ['₹149 - 1GB/day', '₹249 - 2GB/day', '₹299 - 3GB/day'],
    'Airtel': ['₹155 - 1GB', '₹299 - 2GB/day', '₹399 - 3GB/day'],
    'Vi': ['₹149 - 1GB/day', '₹269 - 2GB/day', '₹379 - 3GB/day'],
    'BSNL': ['₹107 - 3GB', '₹187 - 50GB', '₹247 - 50GB'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Recharge')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _mobileCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
                prefixText: '+91 ',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _operator,
              hint: const Text('Select Operator'),
              items: _operators.map((op) => DropdownMenuItem(value: op, child: Text(op))).toList(),
              onChanged: (v) => setState(() => _operator = v),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            if (_operator != null)
              DropdownButtonFormField<String>(
                value: _pack,
                hint: const Text('Select Plan'),
                items: _packs[_operator]!.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                onChanged: (v) => setState(() => _pack = v),
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_mobileCtrl.text.length == 10 && _pack != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Recharging $_pack on ${_mobileCtrl.text}')),
                  );
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Proceed to Pay', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}