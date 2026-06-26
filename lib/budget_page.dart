import 'package:flutter/material.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A365D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A365D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Budgets',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              // TODO: Implement 'Add Budget' modal or screen
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Monthly Budgets',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),
              const Text(
                'Track your spending limits for this month.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 32),

              // Budget List
              _buildBudgetCard(
                category: 'Food',
                icon: Icons.fastfood_outlined,
                usedAmount: 9000,
                totalLimit: 10000,
              ),
              _buildBudgetCard(
                category: 'Shopping',
                icon: Icons.shopping_bag_outlined,
                usedAmount: 2500,
                totalLimit: 5000,
              ),
              _buildBudgetCard(
                category: 'Transport',
                icon: Icons.directions_car_outlined,
                usedAmount: 1500,
                totalLimit: 3000,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetCard({
    required String category,
    required IconData icon,
    required double usedAmount,
    required double totalLimit,
  }) {
    final double progress = usedAmount / totalLimit;
    final double remaining = totalLimit - usedAmount;
    final bool isWarning = progress >= 0.90; // Alert threshold from documentation

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: isWarning ? Border.all(color: Colors.redAccent.withOpacity(0.5), width: 1) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    category,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                '\$${totalLimit.toStringAsFixed(0)}',
                style: const TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation<Color>(
                isWarning ? Colors.redAccent : const Color(0xFF1E88E5),
              ),
            ),
          ),
          const SizedBox(height: 12),
          
          // Metrics
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Spent: \$${usedAmount.toStringAsFixed(0)}',
                style: TextStyle(
                  color: isWarning ? Colors.redAccent : Colors.white70, 
                  fontSize: 14,
                  fontWeight: isWarning ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Text(
                'Left: \$${remaining.toStringAsFixed(0)}',
                style: const TextStyle(color: Colors.greenAccent, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          
          // Alert Message (Conditional Rendering)
          if (isWarning)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'You are approaching your limit (${(progress * 100).toInt()}% used).',
                    style: const TextStyle(color: Colors.redAccent, fontSize: 12),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}