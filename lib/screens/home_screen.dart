import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../widgets/grid_menu_item.dart';
import '../models/transaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final transactions = [
    TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
    TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
    TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
    TransactionModel('Concert Ticket', '-Rp120.000', 'Event'),
    TransactionModel('Salary', '+Rp5.000.000', 'Income'),
  ];

  final categories = ["Health 🏋‍♀", "Event 🎟", "Food 🍔", "Travel ✈"];
  int selectedCategory = 0;

  final pastelColors = [
    const Color(0xFFFFE4E1), // pink muda
    const Color(0xFFD8BFD8), // ungu muda
    const Color(0xFFFAFAD2), // kuning pastel
    const Color(0xFFB0E0E6), // biru muda
  ];

  final categoryIcons = [
    Icons.favorite, // Health
    Icons.event, // Event
    Icons.fastfood, // Food
    Icons.travel_explore, // Travel
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Mate',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("My Cards",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // ===== 4 ATM Cards =====
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                      bankName: 'BRI',
                      cardNumber: '**** 2345',
                      balance: 'Rp12.500.000',
                      color1: Color(0xFFFFC1CC),
                      color2: Color(0xFFFFE4E1)),
                  AtmCard(
                      bankName: 'BJB',
                      cardNumber: '**** 8765',
                      balance: 'Rp7.350.000',
                      color1: Color(0xFFB0E0E6),
                      color2: Color(0xFFD1EAF0)),
                  AtmCard(
                      bankName: 'Mandiri',
                      cardNumber: '**** 4455',
                      balance: 'Rp8.240.000',
                      color1: Color(0xFFD8BFD8),
                      color2: Color(0xFFE6E6FA)),
                  AtmCard(
                      bankName: 'BNI',
                      cardNumber: '**** 6677',
                      balance: 'Rp3.940.000',
                      color1: Color(0xFFFAFAD2),
                      color2: Color(0xFFFFF8DC)),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text("Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            // ===== Kategori kecil pastel dengan emoji =====
            SizedBox(
              height: 75,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GridMenuItem(
                    icon: categoryIcons[index],
                    label: categories[index],
                    color: pastelColors[index],
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
            const Text("Recent Transactions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // ===== Filter transaksi berdasarkan kategori =====
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final tx = transactions[index];
                final categoryName =
                    categories[selectedCategory].split(' ')[0]; // ambil teks saja
                if (tx.category == categoryName || tx.category == 'Income') {
                  return TransactionItem(transaction: tx);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}