import 'package:flutter/material.dart';
import 'trading_details_screen.dart';

class ProTradersScreen extends StatelessWidget {
  const ProTradersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white70,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Copy trading',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              
              Row(
                children: [
                  Expanded(
                    child: _ActionCard(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4FC3F7), Color(0xFF66BB6A)],
                      ),
                      icon: Icons.analytics_outlined,
                      title: 'My dashboard',
                      subtitle: 'View trades',
                      onPressed: () {
                        print('My dashboard tapped');
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _ActionCard(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFBA68C8), Color(0xFFF06292)],
                      ),
                      icon: Icons.grid_view_outlined,
                      title: 'Become a PRO trader',
                      subtitle: 'Apply Now',
                      onPressed: () {
                        print('Become PRO trader tapped');
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              const Text(
                'PRO Traders',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final traders = [
                    {
                      'name': 'Jay isisou',
                      'initials': 'JI',
                      'avatarColor': const Color(0xFF2196F3),
                      'followers': '500',
                      'roi': '+120.42%',
                      'pnl': '\$38,667.29',
                      'winRate': '100%',
                      'aum': '38,667.29',
                    },
                    {
                      'name': 'Laura okobi',
                      'initials': 'LO',
                      'avatarColor': const Color(0xFFFF9800),
                      'followers': '500',
                      'roi': '+120.42%',
                      'pnl': '\$38,667.29',
                      'winRate': '100%',
                      'aum': '38,667.29',
                    },
                    {
                      'name': 'BTC master',
                      'initials': 'BM',
                      'avatarColor': const Color(0xFF4CAF50),
                      'followers': '500',
                      'roi': '+120.42%',
                      'pnl': '\$38,667.29',
                      'winRate': '100%',
                      'aum': '38,667.29',
                    },
                  ];

                  final trader = traders[index];
                  return _TraderCard(trader: trader);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final LinearGradient gradient;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const _ActionCard({
    required this.gradient,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.black, size: 20),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.black87, fontSize: 12),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TraderCard extends StatelessWidget {
  final Map<String, dynamic> trader;

  const _TraderCard({required this.trader});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: trader['avatarColor'],
                    child: Text(
                      trader['initials'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    left: -2,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color(0xFF9C27B0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trader['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color(0xFF3DA9FF),
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          trader['followers'],
                          style: const TextStyle(
                            color: Color(0xFF3DA9FF),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (trader['name'] == 'BTC master') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TradingDetailsScreen(),
                      ),
                    );
                  } else {
                    print('Copy ${trader['name']}');
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E2E2E),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Copy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          Container(height: 1, color: Colors.white.withOpacity(0.06)),
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ROI',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      trader['roi'],
                      style: const TextStyle(
                        color: Color(0xFF4CAF50),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total PNL',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      trader['pnl'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Win rate',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      trader['winRate'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              
              SizedBox(
                width: 64,
                height: 28,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    'assets/images/img_chart1.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF4CAF50),
                        child: const Center(
                          child: Icon(
                            Icons.show_chart,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.white70,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                          children: [
                            const TextSpan(text: 'AUM: '),
                            TextSpan(
                              text: trader['aum'],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          Container(height: 1, color: Colors.white.withOpacity(0.06)),
          const SizedBox(height: 12),
          
          Row(
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                  children: [
                    TextSpan(text: 'Win rate: '),
                    TextSpan(
                      text: '100%',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

