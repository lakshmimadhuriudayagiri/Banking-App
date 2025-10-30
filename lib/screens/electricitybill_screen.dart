// lib/screens/electricity_bill_screen.dart
import 'package:flutter/material.dart';

class ElectricityBillScreen extends StatelessWidget {
  const ElectricityBillScreen({super.key});

  void _goToServiceNumber(BuildContext context, String provider) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ServiceNumberScreen(provider: provider)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Select Provider'),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search by biller',
                  prefixIcon: Icon(Icons.search, color: Colors.purple),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Permission Banner
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Avoid missed bill payments and overdue charges',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Allow access to your text messages to fetch your bills and remind on time',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Allow'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Andhra Pradesh Billers
            const Text(
              'Billers in Andhra Pradesh',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _BillerItem(
              icon: 'assets/apcpdcl.png',
              name: 'Central Power Distribution Company Ltd. of Andhra Pradesh (APCPDCL)',
              onTap: () => _goToServiceNumber(context, 'APCPDCL'),
            ),
            _BillerItem(
              icon: 'assets/epdcl.png',
              name: 'Eastern Power Distribution Company of Andhra Pradesh Limited (EPDCL)',
              onTap: () => _goToServiceNumber(context, 'EPDCL'),
            ),
            _BillerItem(
              icon: 'assets/spdcl.png',
              name: 'Southern Power Distribution Co Ltd of Andhra Pradesh (SPDCL)',
              onTap: () => _goToServiceNumber(context, 'SPDCL'),
            ),

            const SizedBox(height: 20),

            // All Billers
            const Text(
              'All Billers',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _BillerItem(
              icon: 'assets/ademl.png',
              name: 'Adani Electricity Mumbai Limited (AEML)',
              onTap: () => _goToServiceNumber(context, 'AEML'),
            ),
            _BillerItem(
              icon: 'assets/avvnl.png',
              name: 'Ajmer Vidyut Vitran Nigam Ltd (AVVNL)',
              onTap: () => _goToServiceNumber(context, 'AVVNL'),
            ),
            _BillerItem(
              icon: 'assets/apddcl.png',
              name: 'Assam Power Distribution Company Limited (APDDCL - Bill Payment)',
              onTap: () => _goToServiceNumber(context, 'APDDCL'),
            ),
          ],
        ),
      ),
    );
  }
}

class _BillerItem extends StatelessWidget {
  final String icon;
  final String name;
  final VoidCallback onTap;

  const _BillerItem({
    required this.icon,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(
          icon,
          width: 40,
          height: 40,
          errorBuilder: (_, __, ___) => const Icon(Icons.electric_bolt, color: Colors.purple),
        ),
        title: Text(name),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}

// Service Number Screen
class ServiceNumberScreen extends StatefulWidget {
  final String provider;
  const ServiceNumberScreen({super.key, required this.provider});

  @override
  State<ServiceNumberScreen> createState() => _ServiceNumberScreenState();
}

class _ServiceNumberScreenState extends State<ServiceNumberScreen> {
  final _formKey = GlobalKey<FormState>();
  String _serviceNumber = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Proceeding to pay ${widget.provider}: $_serviceNumber')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay Bill - ${widget.provider}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Service Number',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Service Number',
                  border: OutlineInputBorder(),
                  hintText: 'e.g. 1234567890',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter service number';
                  }
                  return null;
                },
                onChanged: (value) => _serviceNumber = value,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Proceed to Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}