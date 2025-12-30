import 'package:flutter/material.dart';
import 'transfer_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C853), // OPay Green
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Color(0xFF00C853)),
          ),
        ),
        title: const Text('Hi, User', style: TextStyle(color: Colors.white, fontSize: 16)),
        actions: [
          IconButton(
            icon: const Icon(Icons.headset_mic_outlined, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Customer Support - Coming Soon')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('QR Scanner - Coming Soon')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No new notifications')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBalanceCard(context),
            _buildQuickActions(context),
            _buildPromoBanner(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Container(
      color: const Color(0xFF00C853),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1B5E20),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Balance',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen()));
                  },
                  child: Row(
                    children: const [
                      Text(
                        'Transaction History',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      Icon(Icons.chevron_right, color: Colors.white70, size: 16),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.shield, color: Colors.white, size: 16),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    _isBalanceVisible ? '₦ 100,000,000.00' : '****',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isBalanceVisible = !_isBalanceVisible;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBalanceAction(context, Icons.add, 'Add Money', () {}),
                _buildBalanceAction(context, Icons.send, 'Transfer', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TransferScreen()));
                }),
                _buildBalanceAction(context, Icons.download, 'Withdraw', () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceAction(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 16),
            const SizedBox(width: 4),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {'icon': Icons.phone_android, 'label': 'Airtime', 'color': Colors.orange},
      {'icon': Icons.wifi, 'label': 'Data', 'color': Colors.blue},
      {'icon': Icons.sports_soccer, 'label': 'Betting', 'color': Colors.green},
      {'icon': Icons.tv, 'label': 'TV', 'color': Colors.red},
      {'icon': Icons.lightbulb, 'label': 'Electricity', 'color': Colors.yellow[700]},
      {'icon': Icons.public, 'label': 'Internet', 'color': Colors.purple},
      {'icon': Icons.school, 'label': 'School', 'color': Colors.pink},
      {'icon': Icons.more_horiz, 'label': 'More', 'color': Colors.grey},
    ];

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 8,
        ),
        itemCount: actions.length,
        itemBuilder: (context, index) {
          final action = actions[index];
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${action['label']} feature coming soon')),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: (action['color'] as Color).withOpacity(0.1),
                  child: Icon(action['icon'] as IconData, color: action['color'] as Color),
                ),
                const SizedBox(height: 8),
                Text(
                  action['label'] as String,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get up to 12% interest',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Save with OWealth today!',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.savings, size: 60, color: Colors.white.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}
