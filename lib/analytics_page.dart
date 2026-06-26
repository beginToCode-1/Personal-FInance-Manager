import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A365D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A365D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Analytics',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Spending Breakdown',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 24),
              
              // Pie Chart Container
              Container(
                height: 250,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 2,
                          centerSpaceRadius: 40,
                          sections: [
                            PieChartSectionData(
                              value: 35,
                              color: Colors.redAccent,
                              title: '35%',
                              radius: 40,
                              titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            PieChartSectionData(
                              value: 20,
                              color: Colors.orangeAccent,
                              title: '20%',
                              radius: 40,
                              titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            PieChartSectionData(
                              value: 15,
                              color: Colors.blueAccent,
                              title: '15%',
                              radius: 40,
                              titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            PieChartSectionData(
                              value: 30,
                              color: Colors.greenAccent,
                              title: '30%',
                              radius: 40,
                              titleStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLegendItem(Colors.redAccent, 'Food'),
                          const SizedBox(height: 8),
                          _buildLegendItem(Colors.orangeAccent, 'Shopping'),
                          const SizedBox(height: 8),
                          _buildLegendItem(Colors.blueAccent, 'Transport'),
                          const SizedBox(height: 8),
                          _buildLegendItem(Colors.greenAccent, 'Other'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              const Text(
                'Category Analysis',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildInsightCard('Highest Spend', 'Food', '\$1,200', Colors.redAccent)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildInsightCard('Lowest Spend', 'Healthcare', '\$50', Colors.greenAccent)),
                ],
              ),
              const SizedBox(height: 32),

              const Text(
                'Monthly Trends',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 24),

              // Line Chart Container
              Container(
                height: 250,
                padding: const EdgeInsets.only(right: 16, left: 0, top: 24, bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) => FlLine(color: Colors.white12, strokeWidth: 1),
                    ),
                    titlesData: FlTitlesData(
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 22,
                          getTitlesWidget: (double value, meta) {
                            const style = TextStyle(color: Colors.white54, fontSize: 12);
                            String text;
                            switch (value.toInt()) {
                              case 0: text = 'Jan'; break;
                              case 2: text = 'Mar'; break;
                              case 4: text = 'May'; break;
                              case 6: text = 'Jul'; break;
                              default: text = ''; break;
                            }
                            return SideTitleWidget(meta: meta, child: Text(text, style: style));
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            if (value == 0) return const SizedBox.shrink();
                            return Text('\$${value.toInt()}k', style: const TextStyle(color: Colors.white54, fontSize: 12));
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 3), FlSpot(1, 4), FlSpot(2, 3.5),
                          FlSpot(3, 5), FlSpot(4, 4.2), FlSpot(5, 6), FlSpot(6, 6.2),
                        ],
                        isCurved: true,
                        color: Colors.greenAccent,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.greenAccent.withOpacity(0.1),
                        ),
                      ),
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 2), FlSpot(1, 2.5), FlSpot(2, 2.2),
                          FlSpot(3, 3), FlSpot(4, 2.8), FlSpot(5, 3.5), FlSpot(6, 3.2),
                        ],
                        isCurved: true,
                        color: Colors.redAccent,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegendItem(Colors.greenAccent, 'Income'),
                  const SizedBox(width: 24),
                  _buildLegendItem(Colors.redAccent, 'Expense'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }

  Widget _buildInsightCard(String title, String category, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 12)),
          const SizedBox(height: 8),
          Text(category, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(amount, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}