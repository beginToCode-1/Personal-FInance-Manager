import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  bool isIncome = false; 
  String selectedCategory = 'Food'; 
  
  // NEW: Controllers to grab text input
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<String> expenseCategories = [
    'Food', 'Transport', 'Shopping', 'Bills', 'Education', 'Entertainment', 'Healthcare', 'Other'
  ];
  
  final List<String> incomeCategories = [
    'Salary', 'Freelancing', 'Business', 'Investment', 'Gift', 'Other'
  ];

  // NEW: The function that talks to Firebase
  Future<void> saveTransaction() async {
    if (amountController.text.isEmpty || descriptionController.text.isEmpty) {
      // Don't save if fields are empty
      return; 
    }

    try {
      // Parse the amount string to a double
      double amount = double.parse(amountController.text);

      // Create a map of the data to send to Firestore
      Map<String, dynamic> transactionData = {
        'amount': amount,
        'category': selectedCategory,
        'description': descriptionController.text,
        'isIncome': isIncome,
        'date': Timestamp.now(), // Firebase uses Timestamp instead of DateTime
      };

      // Push to the 'transactions' collection in Firestore
      await FirebaseFirestore.instance.collection('transactions').add(transactionData);

      // If successful, close the page and go back to Dashboard
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      print("Error saving transaction: $e");
    }
  }

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> currentCategories = isIncome ? incomeCategories : expenseCategories;
    if (!currentCategories.contains(selectedCategory)) {
      selectedCategory = currentCategories.first;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1A365D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Add Transaction', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ... [Keep your Income/Expense Toggle UI exactly the same here] ...
              
              const SizedBox(height: 32),
              const Text('Amount', style: TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 8),
              
              // UPDATED: Attach the amountController
              TextField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  prefixText: '\$ ',
                  prefixStyle: const TextStyle(color: Colors.white70, fontSize: 32),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.05),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 24),

              // ... [Keep your Category Dropdown UI exactly the same here] ...
              
              const SizedBox(height: 24),
              const Text('Description', style: TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 8),
              
              // UPDATED: Attach the descriptionController
              TextField(
                controller: descriptionController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'e.g., Grocery at Walmart',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.05),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 48),

              // UPDATED: Call the saveTransaction function
              ElevatedButton(
                onPressed: saveTransaction, // Calls the Firebase write function
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E88E5),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Save Transaction', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}