import 'package:flutter/material.dart';
import 'copy_trade_success_screen.dart';
class CopyTradePinScreen extends StatefulWidget {
  final double amount;
  final String currency;
  final String traderName;
  const CopyTradePinScreen({
    super.key,
    required this.amount,
    required this.currency,
    required this.traderName,
  });
  @override
  State<CopyTradePinScreen> createState() => _CopyTradePinScreenState();
}
class _CopyTradePinScreenState extends State<CopyTradePinScreen> {
  String _pin = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Confirm Transaction',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Icon(
                Icons.account_balance_wallet,
                color: Colors.amber,
                size: 60,
              ),
              const SizedBox(height: 20),
              const Text(
                'Confirm Transaction',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Input your 6 digit transaction PIN to confirm your transaction and authenticate your request.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: index < _pin.length
                          ? Colors.white
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white70, width: 1),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 40),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Biometric authentication not implemented',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF232428),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.fingerprint,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildNumPad(),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Forgot PIN functionality not implemented'),
                    ),
                  );
                },
                child: const Text(
                  'Forgot PIN?',
                  style: TextStyle(color: Color(0xFF3DA9FF), fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildNumPad() {
    void addDigit(String digit) {
      if (_pin.length < 6) {
        setState(() => _pin += digit);
        if (_pin.length == 6) {
          
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => CopyTradeSuccessScreen(
                  amount: widget.amount,
                  currency: widget.currency,
                  traderName: widget.traderName,
                ),
              ),
            );
          });
        }
      }
    }
    void deleteDigit() {
      if (_pin.isNotEmpty) {
        setState(() => _pin = _pin.substring(0, _pin.length - 1));
      }
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.2,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          if (index == 9) {
            return const SizedBox(); 
          } else if (index == 10) {
            return _NumKey(label: '0', onTap: () => addDigit('0'));
          } else if (index == 11) {
            return _NumKey(
              label: '',
              icon: Icons.backspace,
              onTap: deleteDigit,
            );
          } else {
            final digit = (index + 1).toString();
            return _NumKey(label: digit, onTap: () => addDigit(digit));
          }
        },
      ),
    );
  }
}
class _NumKey extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;
  const _NumKey({required this.label, this.icon, required this.onTap});
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
        child: icon != null
            ? Icon(icon, color: Colors.white, size: 20)
            : Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
