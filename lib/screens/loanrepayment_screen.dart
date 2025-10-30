// lib/screens/loan_repayment_screen.dart
import 'package:flutter/material.dart';

class LoanRepaymentScreen extends StatelessWidget {
  const LoanRepaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loan Repayment')),
      body: const Center(
        child: Text('Loan Repayment Feature\n(Coming Soon)', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}