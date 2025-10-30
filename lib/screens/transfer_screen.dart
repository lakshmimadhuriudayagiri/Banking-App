// lib/screens/transfer_screen.dart
import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: const Text('Send Money'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('to any UPI app PhonePe BHIM G Pay paytm', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
        ),
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
                  hintText: 'Search any contact / name',
                  prefixIcon: Icon(Icons.search, color: Colors.purple),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Split Expenses
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(10)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.receipt, color: Colors.green),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Split Expenses', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Track & settle with friends', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  Text('New', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text('PAYMENTS & CHAT', style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 10),
            const _PaymentItem(initials: 'KR', name: 'Kavuri Ramesh', amount: '₹100', date: '24/10', message: 'You: ₹100 - Sent Securely'),
            const _PaymentItem(initials: 'CM', name: 'Chintalapatni Naga Mani', amount: '', date: '24/10', message: 'Thank you'),
            const _PaymentItem(initials: 'T', name: 'Thataya', amount: '₹100', date: '24/10', message: 'You: ₹100 - Sent Securely'),
            const _PaymentItem(initials: '', name: 'Ravuri John Baniyan', amount: '₹70', date: '23/10', message: 'You: ₹70 - Sent Securely'),
            const _PaymentItem(initials: '', name: 'Annaya', amount: '₹1,500', date: '22/10', message: '₹1,500 - Received Instantly', isReceived: true),
            const _PaymentItem(initials: 'A', name: 'Akhila', amount: '₹40', date: '22/10', message: '₹40 - Received Instantly', isReceived: true),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text('+ New Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentItem extends StatelessWidget {
  final String initials, name, amount, date, message;
  final bool isReceived;
  const _PaymentItem({
    required this.initials,
    required this.name,
    required this.amount,
    required this.date,
    required this.message,
    this.isReceived = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20, backgroundColor: Colors.purple[100], child: Text(initials, style: const TextStyle(color: Colors.purple))),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(message, style: TextStyle(color: isReceived ? Colors.green : Colors.black)),
                ],
              ),
            ],
          ),
          Text(date, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}