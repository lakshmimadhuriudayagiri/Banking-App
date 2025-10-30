// lib/screens/transaction_history_screen.dart
import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [IconButton(icon: const Icon(Icons.file_download_outlined), onPressed: () {}, tooltip: 'My Statements')],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search
            Container(
              decoration: BoxDecoration(color: Colors.purple[50], borderRadius: BorderRadius.circular(10)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search transactions',
                  prefixIcon: Icon(Icons.search, color: Colors.purple),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Referral
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.purple[50], borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Refer and earn ₹200', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Invite your friends and family to PhonePe'),
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white), child: const Text('Invite a friend')),
                  IconButton(icon: const Icon(Icons.close, color: Colors.grey), onPressed: () {}),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const _TransactionItem(title: 'SAI BABU KOVURI', amount: '₹45', date: '1 day ago', recent: true),
            const _TransactionItem(title: 'Anu_Foods', amount: '₹140', date: '1 day ago', recent: true),
            const _TransactionItem(title: 'THE ICECREAM BAKERY', amount: '₹150', date: '24 Oct 2025', recent: false),
            const _TransactionItem(title: 'RIYA ENTERPRISES', amount: '₹20', date: '24 Oct 2025', recent: false),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 4,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String title, amount, date;
  final bool recent;
  const _TransactionItem({required this.title, required this.amount, required this.date, required this.recent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.arrow_upward, color: Colors.grey),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Paid to', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text('Debited from', style: TextStyle(color: Colors.grey, fontSize: 12)),
              if (recent) const Icon(Icons.info_outline, color: Colors.blue, size: 16),
            ],
          ),
        ],
      ),
    );
  }
}