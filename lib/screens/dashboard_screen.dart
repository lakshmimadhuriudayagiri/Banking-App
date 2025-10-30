// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [IconButton(icon: const Icon(Icons.notifications), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            Card(
              color: Colors.purple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Available Balance', style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8),
                    Text('₹12,450.00', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Balance: ₹12,450.00'))),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.purple),
              child: const Text('Check Balance'),
            ),
            const SizedBox(height: 24),

            // Quick Actions
            const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1.2,
              children: [
                _ActionBtn(icon: Icons.send, label: 'To Mobile', route: '/transfer', ctx: context),
                _ActionBtn(icon: Icons.phone_android, label: 'Recharge', route: '/recharge', ctx: context),
                _ActionBtn(icon: Icons.electric_bolt, label: 'Electricity', route: '/electricity', ctx: context),
                _ActionBtn(icon: Icons.credit_card, label: 'Loan Repay', route: '/loan', ctx: context),
                _ActionBtn(icon: Icons.qr_code_scanner, label: 'Scan', route: '/scan', ctx: context),
                _ActionBtn(icon: Icons.history, label: 'History', route: '/history', ctx: context),
              ],
            ),
            const SizedBox(height: 24),

            // Recent Transactions
            const Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const _TransactionItem(title: 'SAI BABU KOVURI', amount: '₹45', date: '1 day ago', recent: true),
            const _TransactionItem(title: 'Anu_Foods', amount: '₹140', date: '1 day ago', recent: true),
            const _TransactionItem(title: 'THE ICECREAM BAKERY', amount: '₹150', date: '24 Oct 2025', recent: false),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
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

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final BuildContext ctx;
  const _ActionBtn({required this.icon, required this.label, required this.route, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(ctx, route),
      child: Column(
        children: [
          CircleAvatar(radius: 28, backgroundColor: Colors.purple[50], child: Icon(icon, color: Colors.purple)),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
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