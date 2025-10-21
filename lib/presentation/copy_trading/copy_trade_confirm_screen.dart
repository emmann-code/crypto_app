import 'package:flutter/material.dart';
import 'copy_trade_pin_screen.dart';
class CopyTradeConfirmScreen extends StatelessWidget {
  final double amount;
  final String currency;
  final double youGet;
  final double fee;
  final String traderName;
  const CopyTradeConfirmScreen({
    super.key,
    required this.amount,
    required this.currency,
    required this.youGet,
    required this.fee,
    required this.traderName,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Confirm transaction',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF232428),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white24,
                      child: Text('US', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Copy trading amount',
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${amount.toStringAsFixed(0)} $currency',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _kv('PRO trader', traderName),
                    const Divider(color: Colors.white10),
                    _kv(
                      'What you get',
                      '${youGet.toStringAsFixed(0)} $currency',
                    ),
                    const Divider(color: Colors.white10),
                    _kv(
                      'Transaction fee',
                      '${fee.toStringAsFixed(2)} $currency',
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6A7CFF), Color(0xFFFF6BB7)],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CopyTradePinScreen(
                            amount: amount,
                            currency: currency,
                            traderName: traderName,
                          ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Confirm transaction',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _kv(String k, String v) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(k, style: const TextStyle(color: Colors.white70)),
          const Spacer(),
          Text(v, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
