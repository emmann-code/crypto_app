import 'package:flutter/material.dart';
import 'copy_trade_confirm_screen.dart';
class CopyTradeAmountScreen extends StatefulWidget {
  const CopyTradeAmountScreen({super.key});
  @override
  State<CopyTradeAmountScreen> createState() => _CopyTradeAmountScreenState();
}
class _CopyTradeAmountScreenState extends State<CopyTradeAmountScreen> {
  final TextEditingController _amountController = TextEditingController(
    text: '100',
  );
  final double _balance = 240.73;
  final String _currency = 'USD';
  @override
  Widget build(BuildContext context) {
    final double amount = double.tryParse(_amountController.text) ?? 0;
    final double fee = amount * 0.01; 
    final double youGet = (amount - fee).clamp(0, double.infinity);
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Enter amount',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Center(
                child: Text(
                  '${amount.toStringAsFixed(0)} $_currency',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF232428),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Transaction fee (1%) - ${fee.toStringAsFixed(2)}$_currency',
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF232428),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Text(
                      'USD Balance',
                      style: TextStyle(color: Colors.white70),
                    ),
                    const Spacer(),
                    Text(
                      ' 4${_balance.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: () {
                        setState(
                          () => _amountController.text = _balance
                              .toStringAsFixed(2),
                        );
                      },
                      child: const Text('Use Max'),
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
                    onPressed: amount > 0
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => CopyTradeConfirmScreen(
                                  amount: amount,
                                  currency: _currency,
                                  youGet: youGet,
                                  fee: fee,
                                  traderName: 'BTC master',
                                ),
                              ),
                            );
                          }
                        : null,
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Continue',
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
      bottomNavigationBar: _buildNumPad(context),
    );
  }
  Widget _buildNumPad(BuildContext context) {
    void add(String d) {
      final text = _amountController.text;
      setState(() => _amountController.text = (text == '0' ? d : text + d));
    }
    void back() {
      final text = _amountController.text;
      if (text.isNotEmpty)
        setState(
          () => _amountController.text = text.substring(0, text.length - 1),
        );
    }
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        color: const Color(0xFF1A1A1D),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.4,
          ),
          itemBuilder: (context, index) {
            final labels = [
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
              '0',
              '.',
              '<',
            ];
            final label = labels[index];
            return _NumKey(
              label: label,
              onTap: () {
                if (label == '<') return back();
                add(label);
              },
            );
          },
        ),
      ),
    );
  }
}
class _NumKey extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NumKey({required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF232428),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
