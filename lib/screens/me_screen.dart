import 'package:flutter/material.dart';
import 'history_screen.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Container(
            color: const Color(0xFF00C853),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Color(0xFF00C853)),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Wisdom',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Level 3 | 08012345678',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildMenuItem(
            context, 
            icon: Icons.history, 
            title: 'Transaction History', 
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen())),
          ),
          _buildMenuItem(context, icon: Icons.account_balance_wallet, title: 'Bank Card/Account'),
          const SizedBox(height: 10),
          _buildMenuItem(context, icon: Icons.support_agent, title: 'Customer Support'),
          _buildMenuItem(context, icon: Icons.settings, title: 'Settings'),
          _buildMenuItem(context, icon: Icons.logout, title: 'Log Out', isDestructive: true),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, {required IconData icon, required String title, bool isDestructive = false, VoidCallback? onTap}) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: isDestructive ? Colors.red : Colors.grey[700]),
        title: Text(
          title,
          style: TextStyle(color: isDestructive ? Colors.red : Colors.black),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap ?? () {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('$title coming soon')),
           );
        },
      ),
    );
  }
}
