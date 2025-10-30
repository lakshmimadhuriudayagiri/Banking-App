import 'package:flutter/material.dart';
import '../models/user.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accounts')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: User.accounts.length,
        itemBuilder: (_, i) {
          final acc = User.accounts[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(acc['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('**** ${acc['number'].substring(acc['number'].length - 4)}'),
              trailing: Text('\$${acc['balance'].toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, color: Colors.green)),
            ),
          );
        },
      ),
    );
  }
}