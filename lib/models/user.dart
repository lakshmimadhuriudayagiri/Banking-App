class User {
  static String name = 'John Doe';
  static String email = 'john.doe@example.com';
  static double balance = 1000.0;

  static List<Map<String, dynamic>> accounts = [
    {'name': 'Checking', 'number': '123456789', 'balance': 500.0},
    {'name': 'Savings',  'number': '987654321', 'balance': 500.0},
  ];

  static List<Map<String, dynamic>> transactions = [
    {
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'description': 'Initial Deposit',
      'amount': 1000.0,
      'type': 'credit'
    },
  ];

  static void addTransaction(String description, double amount, String type) {
    transactions.insert(0, {
      'date': DateTime.now(),
      'description': description,
      'amount': amount,
      'type': type,
    });
  }

  static void updateBalance(double amount, bool isCredit) {
    balance += isCredit ? amount : -amount;
  }

  static void updateAccountBalance(String accountName, double amount, bool isCredit) {
    for (var acc in accounts) {
      if (acc['name'] == accountName) {
        acc['balance'] += isCredit ? amount : -amount;
        break;
      }
    }
  }
}