// lib/main.dart
import 'package:flutter/material.dart';

// Import all screens (use correct file names)
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/transfer_screen.dart';
import 'screens/recharge_screen.dart';
import 'screens/electricitybill_screen.dart';     // Fixed name
import 'screens/loanrepayment_screen.dart';        // Fixed name
import 'screens/scan_screen.dart';
import 'screens/transaction_history_screen.dart';

void main() {
  runApp(const BankingApp());
}

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/dashboard': (_) => const DashboardScreen(),
        '/transfer': (_) => const TransferScreen(),
        '/recharge': (_) => const RechargeScreen(),
        '/electricity': (_) => const ElectricityBillScreen(),      // Match class name
        '/loan': (_) => const LoanRepaymentScreen(),               // Match class name
        '/scan': (_) => const ScanScreen(),
        '/history': (_) => const TransactionHistoryScreen(),
      },
    );
  }
}