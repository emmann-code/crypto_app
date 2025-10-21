import 'dart:async';
import 'package:flutter/material.dart';
import 'trading_intro.dart';

class CopyTradingScreen extends StatefulWidget {
  const CopyTradingScreen({super.key});

  @override
  _CopyTradingScreenState createState() => _CopyTradingScreenState();
}

class _CopyTradingScreenState extends State<CopyTradingScreen> {
  bool _showMenu = false;

  void _handleMenuTap(String menuItem) {
    // Close the menu first
    setState(() => _showMenu = false);

    // Handle the menu item tap
    print('Tapped on: $menuItem');

    if (menuItem == 'Copy trading') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const CopyTradingIntroScreen()));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1D),
      body: Stack(
        children: [
          Column(
            children: [
              // Header with light gradient background
              _Header(),
              // Main content area with dark background and rounded corners
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF1A1A1D),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: _MainContent(),
                ),
              ),
            ],
          ),
          // Menu overlay
          if (_showMenu)
            _MenuOverlay(
              onClose: () => setState(() => _showMenu = false),
              onMenuTap: _handleMenuTap,
            ),
        ],
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onGridTap: () => setState(() => _showMenu = !_showMenu),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF0E3FF), Color(0xFFB8E8FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              // Crypto dropdown pill
              _CryptoPill(),
              const Spacer(),
              // Right side icons
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Color(0xFF1A1A1D),
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.headphones_outlined,
                  color: Color(0xFF1A1A1D),
                  size: 24,
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      color: Color(0xFF1A1A1D),
                      size: 24,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF0000),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              // UK flag dropdown
              _FlagPill(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CryptoPill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Crypto',
            style: TextStyle(
              color: const Color(0xFF1A1A1D),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF1A1A1D),
            size: 18,
          ),
        ],
      ),
    );
  }
}

class _FlagPill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🇬🇧', style: TextStyle(fontSize: 16)),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF1A1A1D),
            size: 16,
          ),
        ],
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // GBP Balance section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your GBP Balance',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.visibility_outlined,
                  size: 18,
                  color: Colors.grey[400],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Balance display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '£0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6, left: 2),
                  child: Text(
                    '.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            _QuickActionsRow(),
            const SizedBox(height: 8),
            Text(
              'See more',
              style: TextStyle(color: Colors.blue[200], fontSize: 12),
            ),

            const SizedBox(height: 20),
            _CopyTradingBanner(),

            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Stay Updated',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _StayUpdatedSection(),

            const SizedBox(height: 20),
            _ListedCoinsCard(),

            const SizedBox(height: 20),
            _TopGainersSection(),

            const SizedBox(height: 20),
            _TopLosersSection(),

            const SizedBox(height: 20),
            _WhatOthersTradingSection(),

            const SizedBox(height: 20),
            _NewCoinsSection(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _QuickActionsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF151B22),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _QuickAction(icon: Icons.savings_outlined, label: 'Deposit'),
          _QuickAction(icon: Icons.payments_outlined, label: 'Buy'),
          _QuickAction(icon: Icons.outbond_outlined, label: 'Withdraw'),
          _QuickAction(icon: Icons.sell_outlined, label: 'Sell'),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF0F1419),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}

class _CopyTradingBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFB8E8FF), Color(0xFFF0E3FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Copy Trading',
              style: TextStyle(
                color: Color(0xFF0F1419),
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Discover our latest feature. Follow and watch the PRO traders closely and win like a PRO! We are rooting for you!',
              style: TextStyle(color: Color(0xFF1B2430), fontSize: 12),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuOverlay extends StatelessWidget {
  final VoidCallback onClose;
  final Function(String) onMenuTap;

  const _MenuOverlay({required this.onClose, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: GestureDetector(
            onTap: () {}, // Prevent closing when tapping the menu itself
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1D),
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Trade Section
                    _MenuSection(
                      title: 'Trade',
                      items: [
                        _MenuItem(
                          icon: Icons.description_outlined,
                          title: 'Buy',
                          hasNewTag: false,
                          onPressed: () => onMenuTap('Buy'),
                        ),
                        _MenuItem(
                          icon: Icons.description_outlined,
                          title: 'Sell',
                          hasNewTag: false,
                          onPressed: () => onMenuTap('Sell'),
                        ),
                        _MenuItem(
                          icon: Icons.description_outlined,
                          title: 'Swap',
                          hasNewTag: false,
                          onPressed: () => onMenuTap('Swap'),
                        ),
                        _MenuItem(
                          icon: Icons.description_outlined,
                          title: 'Send',
                          hasNewTag: false,
                          onPressed: () => onMenuTap('Send'),
                        ),
                        _MenuItem(
                          icon: Icons.description_outlined,
                          title: 'Receive',
                          hasNewTag: false,
                          onPressed: () => onMenuTap('Receive'),
                        ),
                        _MenuItem(
                          icon: Icons.description_outlined,
                          title: 'Invest',
                          hasNewTag: true,
                          onPressed: () => onMenuTap('Invest'),
                        ),
                      ],
                    ),
                    const Divider(color: Color(0xFF2A2A2A), height: 1),
                    // Earn Section
                    _MenuSection(
                      title: 'Earn',
                      items: [
                        _MenuItem(
                          icon: Icons.description_outlined,
                          title: "Roqq'n'roll",
                          hasNewTag: true,
                          onPressed: () => onMenuTap("Roqq'n'roll"),
                        ),
                        _MenuItem(
                          icon: Icons.account_balance_wallet_outlined,
                          title: 'Savings',
                          hasNewTag: false,
                          onPressed: () => onMenuTap('Savings'),
                        ),
                        _MenuItem(
                          icon: Icons.description_outlined,
                          title: 'Savings',
                          hasNewTag: false,
                          onPressed: () => onMenuTap('Savings'),
                        ),
                        _MenuItem(
                          icon: Icons.description_outlined,
                          title: 'Missions',
                          hasNewTag: true,
                          onPressed: () => onMenuTap('Missions'),
                        ),
                        _MenuItem(
                          icon: Icons.description_outlined,
                          title: 'Copy trading',
                          hasNewTag: true,
                          onPressed: () => onMenuTap('Copy trading'),
                        ),
                      ],
                    ),
                    // Add bottom padding to prevent text cutoff
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  final String title;
  final List<_MenuItem> items;

  const _MenuSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          ...items,
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool hasNewTag;
  final VoidCallback? onPressed;
  // Kept for hot-reload compatibility; mapped to onPressed if provided
  final VoidCallback? onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.hasNewTag,
    this.onPressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
        alignment: Alignment.centerLeft,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF007AFF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF007AFF), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (hasNewTag) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFA500),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'New',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
        ],
      ),
    );
  }
}

class _StayUpdatedSection extends StatefulWidget {
  @override
  _StayUpdatedSectionState createState() => _StayUpdatedSectionState();
}

class _StayUpdatedSectionState extends State<_StayUpdatedSection> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;
  int _actualPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        _actualPage = _currentPage % _stayUpdatedCards.length;

        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );

        // If we've scrolled past the original cards, jump back to the beginning
        if (_currentPage >= _stayUpdatedCards.length) {
          Future.delayed(Duration(milliseconds: 600), () {
            if (_pageController.hasClients) {
              _currentPage = 0;
              _pageController.jumpToPage(0);
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 72,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _actualPage = index % _stayUpdatedCards.length;
              });
            },
            itemCount:
                _stayUpdatedCards.length *
                2, // Double the items for seamless loop
            itemBuilder: (context, index) {
              final cardIndex = index % _stayUpdatedCards.length;
              final card = _stayUpdatedCards[cardIndex];
              return Container(
                width: 240,
                margin: EdgeInsets.only(right: 12),
                child: _InfoCard(
                  title: card.title,
                  subtitle: card.subtitle,
                  showUrgent: card.showUrgent,
                  icon: card.icon,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Pagination indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_stayUpdatedCards.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: _actualPage == index ? 8 : 6,
              height: _actualPage == index ? 8 : 6,
              decoration: BoxDecoration(
                color: _actualPage == index ? Colors.white : Colors.grey[400],
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _StayUpdatedCard {
  final String title;
  final String subtitle;
  final bool showUrgent;
  final IconData icon;

  const _StayUpdatedCard({
    required this.title,
    required this.subtitle,
    this.showUrgent = false,
    required this.icon,
  });
}

const List<_StayUpdatedCard> _stayUpdatedCards = [
  _StayUpdatedCard(
    title: 'Delisting coins',
    subtitle: 'View the list of coins we are delisting',
    showUrgent: true,
    icon: Icons.notifications_active_outlined,
  ),
  _StayUpdatedCard(
    title: 'Exchange Rates',
    subtitle: 'View all currencies rate at a glance',
    icon: Icons.currency_exchange_outlined,
  ),
  _StayUpdatedCard(
    title: 'Roqqu Expands to Europe',
    subtitle: 'We are now on the shores of Europe!',
    icon: Icons.public_outlined,
  ),
];

class _InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showUrgent;
  final IconData icon;

  const _InfoCard({
    required this.title,
    required this.subtitle,
    this.showUrgent = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF151B22),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white70, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (showUrgent)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A0E0E),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Text(
                          'Urgent Notice',
                          style: TextStyle(
                            color: Color(0xFFFF6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _ListedCoinsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Listed Coins',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(color: Colors.blue[200], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF151B22),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _coins.length,
            separatorBuilder: (_, __) =>
                const Divider(color: Color(0xFF2A323A), height: 1),
            itemBuilder: (context, index) {
              final c = _coins[index];
              final isDown = c.changePct < 0;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: c.color.withOpacity(0.2),
                      child: Text(
                        c.symbol.substring(0, 1),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            c.symbol,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _formatUsd(c.price),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _formatPct(c.changePct),
                          style: TextStyle(
                            color: isDown
                                ? const Color(0xFFFF6B6B)
                                : const Color(0xFF2ECC71),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CoinData {
  final String name;
  final String symbol;
  final double price;
  final double changePct;
  final Color color;

  const _CoinData(
    this.name,
    this.symbol,
    this.price,
    this.changePct,
    this.color,
  );
}

const List<_CoinData> _coins = [
  _CoinData('Bitcoin', 'BTC', 27445.00, -0.61, Color(0xFFF7931A)),
  _CoinData('Ethereum', 'ETH', 1679.00, -0.61, Color(0xFF627EEA)),
  _CoinData('Tether', 'USDT', 1.00, -0.01, Color(0xFF26A17B)),
  _CoinData('Cardano', 'ADA', 0.36, -0.61, Color(0xFF0033AD)),
  _CoinData('Dogecoin', 'DOGE', 0.093, -0.61, Color(0xFFC2A633)),
];

String _formatUsd(double v) => '\$${v.toStringAsFixed(2)}';
String _formatPct(double v) {
  final sign = v > 0 ? '+' : '';
  return '$sign${v.toStringAsFixed(2)}%';
}

class _TopGainersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Gainers',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(color: Colors.blue[200], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: _topGainers.length,
            itemBuilder: (context, index) {
              final coin = _topGainers[index];
              return Container(
                width: 160,
                margin: EdgeInsets.only(
                  right: index < _topGainers.length - 1 ? 12 : 0,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF151B22),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: coin.color.withOpacity(0.2),
                          child: Text(
                            coin.symbol.substring(0, 1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            coin.symbol,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _formatUsd(coin.price),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          _formatPct(coin.changePct),
                          style: const TextStyle(
                            color: Color(0xFF2ECC71),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.trending_up,
                          color: Color(0xFF2ECC71),
                          size: 10,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Mini chart representation
                    Expanded(
                      child: SizedBox(
                        height: 16,
                        child: CustomPaint(
                          painter: _MiniChartPainter(
                            color: const Color(0xFF2ECC71),
                            isUpward: true,
                          ),
                          size: Size.infinite,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TopLosersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Losers',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(color: Colors.blue[200], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: _topLosers.length,
            itemBuilder: (context, index) {
              final coin = _topLosers[index];
              return Container(
                width: 160,
                margin: EdgeInsets.only(
                  right: index < _topLosers.length - 1 ? 12 : 0,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF151B22),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: coin.color.withOpacity(0.2),
                          child: Text(
                            coin.symbol.substring(0, 1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            coin.symbol,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _formatUsd(coin.price),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          _formatPct(coin.changePct),
                          style: const TextStyle(
                            color: Color(0xFFFF6B6B),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.trending_down,
                          color: Color(0xFFFF6B6B),
                          size: 10,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Mini chart representation
                    Expanded(
                      child: SizedBox(
                        height: 16,
                        child: CustomPaint(
                          painter: _MiniChartPainter(
                            color: const Color(0xFFFF6B6B),
                            isUpward: false,
                          ),
                          size: Size.infinite,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _WhatOthersTradingSection extends StatefulWidget {
  @override
  _WhatOthersTradingSectionState createState() =>
      _WhatOthersTradingSectionState();
}

class _WhatOthersTradingSectionState extends State<_WhatOthersTradingSection> {
  bool _isBuySelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What others are trading.',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _ToggleButton(
              label: 'Buy',
              isSelected: _isBuySelected,
              onTap: () => setState(() => _isBuySelected = true),
            ),
            const SizedBox(width: 12),
            _ToggleButton(
              label: 'Sell',
              isSelected: !_isBuySelected,
              onTap: () => setState(() => _isBuySelected = false),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ..._tradingData.map(
          (data) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _TradingItem(
              symbol: data.symbol,
              percentage: data.percentage,
              color: data.color,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'This is a summary of the trades on Roqqu from the last 24hrs, this is an independent data and Roqqu will not be held liable for whatever you do with this information.',
          style: TextStyle(color: Colors.grey[400], fontSize: 10, height: 1.3),
        ),
      ],
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ToggleButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF151B22) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.grey[600]!,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[400],
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _TradingItem extends StatelessWidget {
  final String symbol;
  final double percentage;
  final Color color;

  const _TradingItem({
    required this.symbol,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: color.withOpacity(0.2),
          child: Text(
            symbol.substring(0, 1),
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '$symbol - ${percentage.toInt()}%',
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const Spacer(),
        Container(
          width: 100,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(2),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage / 100,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NewCoinsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New coins on Roqqu',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(color: Colors.blue[200], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: _newCoins.length,
            itemBuilder: (context, index) {
              final coin = _newCoins[index];
              return Container(
                width: 160,
                margin: EdgeInsets.only(
                  right: index < _newCoins.length - 1 ? 12 : 0,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF151B22),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: coin.color.withOpacity(0.2),
                          child: Text(
                            coin.symbol.substring(0, 1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            coin.symbol,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _formatUsd(coin.price),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          _formatPct(coin.changePct),
                          style: const TextStyle(
                            color: Color(0xFF2ECC71),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.trending_up,
                          color: Color(0xFF2ECC71),
                          size: 10,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Mini chart representation
                    Expanded(
                      child: SizedBox(
                        height: 16,
                        child: CustomPaint(
                          painter: _MiniChartPainter(
                            color: const Color(0xFF2ECC71),
                            isUpward: true,
                          ),
                          size: Size.infinite,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MiniChartPainter extends CustomPainter {
  final Color color;
  final bool isUpward;

  _MiniChartPainter({required this.color, required this.isUpward});

  @override
  void paint(Canvas canvas, Size size) {
    // Create pixelated, jagged line chart like the image
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    // Generate pixelated data points with jagged movements
    final points = List.generate(12, (i) {
      final x = (i / 11) * size.width;
      double y;

      if (isUpward) {
        // Upward jagged trend
        switch (i) {
          case 0:
            y = size.height * 0.8;
            break;
          case 1:
            y = size.height * 0.7;
            break;
          case 2:
            y = size.height * 0.75;
            break;
          case 3:
            y = size.height * 0.6;
            break;
          case 4:
            y = size.height * 0.5;
            break;
          case 5:
            y = size.height * 0.55;
            break;
          case 6:
            y = size.height * 0.4;
            break;
          case 7:
            y = size.height * 0.35;
            break;
          case 8:
            y = size.height * 0.45;
            break;
          case 9:
            y = size.height * 0.3;
            break;
          case 10:
            y = size.height * 0.25;
            break;
          case 11:
            y = size.height * 0.2;
            break;
          default:
            y = size.height * 0.5;
        }
      } else {
        // Downward jagged trend
        switch (i) {
          case 0:
            y = size.height * 0.2;
            break;
          case 1:
            y = size.height * 0.25;
            break;
          case 2:
            y = size.height * 0.3;
            break;
          case 3:
            y = size.height * 0.35;
            break;
          case 4:
            y = size.height * 0.4;
            break;
          case 5:
            y = size.height * 0.45;
            break;
          case 6:
            y = size.height * 0.5;
            break;
          case 7:
            y = size.height * 0.55;
            break;
          case 8:
            y = size.height * 0.6;
            break;
          case 9:
            y = size.height * 0.65;
            break;
          case 10:
            y = size.height * 0.7;
            break;
          case 11:
            y = size.height * 0.8;
            break;
          default:
            y = size.height * 0.5;
        }
      }

      return Offset(x, y);
    });

    // Draw pixelated line segments (horizontal and vertical only)
    for (int i = 0; i < points.length - 1; i++) {
      final current = points[i];
      final next = points[i + 1];

      // Draw horizontal line first, then vertical (creating pixelated look)
      canvas.drawLine(current, Offset(next.dx, current.dy), paint);
      canvas.drawLine(Offset(next.dx, current.dy), next, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Data classes and lists
class _TopGainerData {
  final String symbol;
  final double price;
  final double changePct;
  final Color color;

  const _TopGainerData(this.symbol, this.price, this.changePct, this.color);
}

class _TradingData {
  final String symbol;
  final double percentage;
  final Color color;

  const _TradingData(this.symbol, this.percentage, this.color);
}

const List<_TopGainerData> _topGainers = [
  _TopGainerData('BTC', 27445000, 34, Color(0xFFF7931A)),
  _TopGainerData('ETH', 1679, 12, Color(0xFF627EEA)),
  _TopGainerData('BTC', 27445000, 23, Color(0xFFF7931A)),
];

const List<_TopGainerData> _topLosers = [
  _TopGainerData('BTC', 27445000, -34, Color(0xFFF7931A)),
  _TopGainerData('ETH', 1679, -12, Color(0xFF627EEA)),
  _TopGainerData('BTC', 27445000, -23, Color(0xFFF7931A)),
];

const List<_TradingData> _tradingData = [
  _TradingData('BTC', 76, Color(0xFFFF6B35)),
  _TradingData('ETH', 76, Color(0xFF007AFF)),
  _TradingData('MANA', 76, Color(0xFFFF0000)),
  _TradingData('TKN', 76, Color(0xFFFFFF00)),
  _TradingData('USDT', 76, Color(0xFF00FF00)),
];

const List<_TopGainerData> _newCoins = [
  _TopGainerData('BTC', 27445000, 34, Color(0xFFF7931A)),
  _TopGainerData('ETH', 1679, 12, Color(0xFF627EEA)),
  _TopGainerData('BTC', 27445000, 23, Color(0xFFF7931A)),
];

class _BottomNavigationBar extends StatelessWidget {
  final VoidCallback onGridTap;

  const _BottomNavigationBar({required this.onGridTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Color(0xFF1A1A1D)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            label: 'Home',
            isSelected: false,
            hasBadge: true,
          ),
          _NavItem(
            icon: Icons.account_balance_wallet_outlined,
            label: 'Wallet',
            isSelected: false,
            hasBadge: false,
          ),
          _NavItem(
            icon: Icons.grid_view_outlined,
            label: '',
            isSelected: true,
            hasBadge: false,
            onPressed: onGridTap,
          ),
          _NavItem(
            icon: Icons.swap_vert,
            label: 'History',
            isSelected: false,
            hasBadge: false,
          ),
          _NavItem(
            icon: Icons.person_outline,
            label: 'Profile',
            isSelected: false,
            hasBadge: false,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool hasBadge;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.hasBadge,
    this.onPressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF007AFF)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.grey[400],
                  size: 24,
                ),
              ),
              if (hasBadge && !isSelected)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF6B35),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          if (label.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
