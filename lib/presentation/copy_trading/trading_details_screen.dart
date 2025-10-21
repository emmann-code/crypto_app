import 'package:flutter/material.dart';
import 'copy_trade_amount_screen.dart';

class TradingDetailsScreen extends StatefulWidget {
  const TradingDetailsScreen({super.key});

  @override
  State<TradingDetailsScreen> createState() => _TradingDetailsScreenState();
}

class _TradingDetailsScreenState extends State<TradingDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedTimeRange = '7 days';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showCopyTradeDisclaimer(BuildContext context) {
    bool isChecked = false;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1F2023),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  top: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close, color: Colors.white70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Container(
                        width: 100,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A2A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.sms, color: Colors.white70),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'Important message!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Don't invest unless you're prepared and understand the risks involved in copy trading. ",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Learn more',
                        style: TextStyle(
                          color: Color(0xFF3DA9FF),
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (v) {
                            setState(() => isChecked = v ?? false);
                          },
                          side: const BorderSide(color: Colors.white38),
                          activeColor: const Color(0xFF6A7CFF),
                          checkColor: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      'Check this box to agree to Roqqu\'s copy trading ',
                                ),
                                TextSpan(
                                  text: 'policy',
                                  style: TextStyle(
                                    color: Color(0xFF3DA9FF),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: Opacity(
                        opacity: isChecked ? 1 : 0.5,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6A7CFF), Color(0xFFFF6BB7)],
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: TextButton(
                            onPressed: isChecked
                                ? () {
                                    Navigator.of(context).pop();
                                    _showCopyTradeRisksSheet(context);
                                  }
                                : null,
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text(
                              'Proceed to copy trade',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showCopyTradeRisksSheet(BuildContext context) {
    final List<Map<String, String>> risks = [
      {
        'title': 'Market risks',
        'body':
            'Crypto markets are volatile. Prices can move quickly against positions, leading to losses.',
      },
      {
        'title': 'Dependency on others',
        'body':
            'Copy trading relies on another trader\'s decisions which may not always align with your goals.',
      },
      {
        'title': 'Mismatched risk profiles',
        'body':
            'The trader you copy may have a higher risk tolerance than you are comfortable with.',
      },
      {
        'title': 'Control and understanding',
        'body':
            'You might not fully understand the strategy or timing behind trades being executed.',
      },
      {
        'title': 'Emotional decisions',
        'body':
            'Past performance can trigger emotional bias and FOMO; it is not a guarantee of future results.',
      },
      {
        'title': 'Costs involved',
        'body':
            'Fees, spreads and profit share can reduce returns, especially during low performance periods.',
      },
      {
        'title': 'Diversify',
        'body':
            'Avoid concentrating all funds in a single trader or strategy to reduce idiosyncratic risk.',
      },
      {
        'title': 'Execution risks',
        'body':
            'Latency, slippage, and partial fills can cause your results to differ from the lead trader\'s.',
      },
      {
        'title': 'Copy trading investments can be complex',
        'body':
            'Before allocating funds, be sure you understand position sizing, leverage, and drawdowns.',
      },
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1F2023),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              top: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Risks involved in copy trading',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please make sure you read the following risks involved in copy trading before making a decision.',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF232428),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemBuilder: (context, index) {
                        final item = risks[index];
                        return Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            collapsedIconColor: Colors.white70,
                            iconColor: Colors.white70,
                            title: Text(
                              item['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            childrenPadding: const EdgeInsets.fromLTRB(
                              16,
                              0,
                              16,
                              12,
                            ),
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  item['body']!,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1, color: Colors.transparent),
                      itemCount: risks.length,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const CopyTradeAmountScreen(),
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
                        'I have read the risks',
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
        );
      },
    );
  }

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
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Trading details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Trader Profile Section
            _TraderProfileSection(),
            const SizedBox(height: 24),
            // Navigation Tabs
            TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFF3DA9FF),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: const [
                Tab(text: 'Chart'),
                Tab(text: 'Stats'),
                Tab(text: 'All Trades'),
                Tab(text: 'Copiers'),
              ],
            ),
            const SizedBox(height: 24),
            // Tab Content
            SizedBox(
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _ChartTab(),
                  _StatsTab(),
                  _AllTradesTab(),
                  _CopiersTab(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Copy Trade Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
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
                      _showCopyTradeDisclaimer(context);
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Copy trade',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CopyTradeSetupScreen extends StatelessWidget {
  const CopyTradeSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = TextEditingController();
    String riskLevel = 'Balanced';
    double allocation = 50;

    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          backgroundColor: const Color(0xFF1A1A1D),
          appBar: AppBar(
            backgroundColor: const Color(0xFF1A1A1D),
            elevation: 0,
            title: const Text(
              'Copy trade setup',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Allocation amount (USD)',
                            style: TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Enter amount',
                              hintStyle: const TextStyle(color: Colors.white38),
                              filled: true,
                              fillColor: const Color(0xFF232428),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Allocation %',
                                style: TextStyle(color: Colors.white70),
                              ),
                              Text(
                                '${allocation.toStringAsFixed(0)}%',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Slider(
                            value: allocation,
                            min: 0,
                            max: 100,
                            divisions: 20,
                            label: allocation.toStringAsFixed(0),
                            onChanged: (v) => setState(() => allocation = v),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Risk level',
                            style: TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF232428),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: const Color(0xFF232428),
                                value: riskLevel,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Conservative',
                                    child: Text(
                                      'Conservative',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Balanced',
                                    child: Text(
                                      'Balanced',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Aggressive',
                                    child: Text(
                                      'Aggressive',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                                onChanged: (v) =>
                                    setState(() => riskLevel = v ?? riskLevel),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
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
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Copy trading started'),
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
                          'Start copying',
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
      },
    );
  }
}

class _TraderProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Avatar and Name
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFF4CAF50),
                    child: const Text(
                      'BM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    right: -2,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Color(0xFF9C27B0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'BTC master',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.people,
                          color: Colors.white70,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '500 Copiers',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Key Metrics
          Row(
            children: [
              Expanded(
                child: _MetricItem(label: '43 trading days', value: ''),
              ),
              Expanded(
                child: _MetricItem(label: '15% profit-share', value: ''),
              ),
              Expanded(
                child: _MetricItem(label: '56 total orders', value: ''),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Badges Row
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _Badge(
                label: 'Certified PROtrader',
                color: const Color(0xFF007AFF),
              ),
              _Badge(label: 'High win rate', color: const Color(0xFF4CAF50)),
              _Badge(
                label: 'Great risk control',
                color: const Color(0xFFFFA500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricItem extends StatelessWidget {
  final String label;
  final String value;

  const _MetricItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ChartTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ROI Chart
          _ChartSection(
            title: 'ROI',
            timeRange: '7 days',
            chartHeight: 120,
            chartType: 'line',
          ),
          const SizedBox(height: 12),
          // Total PNL Chart
          _ChartSection(
            title: 'Total PNL',
            timeRange: '7 days',
            chartHeight: 120,
            chartType: 'line',
          ),
          const SizedBox(height: 12),
          // Assets Allocation
          _AssetsAllocationSection(),
          const SizedBox(height: 12),
          // Holding Period
          _HoldingPeriodSection(),
        ],
      ),
    );
  }
}

class _ChartSection extends StatelessWidget {
  final String title;
  final String timeRange;
  final double chartHeight;
  final String chartType;

  const _ChartSection({
    required this.title,
    required this.timeRange,
    required this.chartHeight,
    required this.chartType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  timeRange,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
        Container(
          height: chartHeight,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return CustomPaint(
                painter: _LineChartPainter(),
                size: Size(constraints.maxWidth, constraints.maxHeight),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AssetsAllocationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Assets allocation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '7 days',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 120,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: CustomPaint(
              painter: _DonutChartPainter(),
              size: const Size(80, 80),
            ),
          ),
        ),
      ],
    );
  }
}

class _HoldingPeriodSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Holding period',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '7 days',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 120,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomPaint(
                      painter: _ScatterPlotPainter(),
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                    );
                  },
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LegendItem(color: const Color(0xFF4CAF50), label: 'Profit'),
                  const SizedBox(width: 16),
                  _LegendItem(color: const Color(0xFFF44336), label: 'Loss'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}

class _StatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text('Stats Tab Content', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class _AllTradesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          'All Trades Tab Content',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _CopiersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          'Copiers Tab Content',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4CAF50)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = const Color(0xFF4CAF50).withOpacity(0.2)
      ..style = PaintingStyle.fill;

    // Draw Y-axis labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Y-axis values
    final yValues = ['123%', '123%', '123%', '123%', '123%'];
    final yPositions = [0.1, 0.3, 0.5, 0.7, 0.9];

    for (int i = 0; i < yValues.length; i++) {
      textPainter.text = TextSpan(
        text: yValues[i],
        style: const TextStyle(color: Colors.white70, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(8, size.height * yPositions[i] - textPainter.height / 2),
      );
    }

    // Draw X-axis labels
    final xValues = ['03-23', '03-24', '03-25', '03-26', '03-27', '03-28'];
    final xPositions = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0];

    for (int i = 0; i < xValues.length; i++) {
      textPainter.text = TextSpan(
        text: xValues[i],
        style: const TextStyle(color: Colors.white70, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          size.width * xPositions[i] - textPainter.width / 2,
          size.height - 20,
        ),
      );
    }

    // Create upward trending line with proper margins
    final marginLeft = 60.0;
    final marginRight = 20.0;
    final marginTop = 20.0;
    final marginBottom = 40.0;

    final chartWidth = size.width - marginLeft - marginRight;
    final chartHeight = size.height - marginTop - marginBottom;

    final path = Path();
    final fillPath = Path();

    final points = [
      Offset(marginLeft, marginTop + chartHeight * 0.8),
      Offset(marginLeft + chartWidth * 0.2, marginTop + chartHeight * 0.6),
      Offset(marginLeft + chartWidth * 0.4, marginTop + chartHeight * 0.4),
      Offset(marginLeft + chartWidth * 0.6, marginTop + chartHeight * 0.3),
      Offset(marginLeft + chartWidth * 0.8, marginTop + chartHeight * 0.2),
      Offset(marginLeft + chartWidth, marginTop + chartHeight * 0.1),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    fillPath.moveTo(points[0].dx, marginTop + chartHeight);
    fillPath.lineTo(points[0].dx, points[0].dy);

    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
      fillPath.lineTo(points[i].dx, points[i].dy);
    }

    fillPath.lineTo(marginLeft + chartWidth, marginTop + chartHeight);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Draw orange segment (100% BTCUSDT)
    final paint = Paint()
      ..color = const Color(0xFFFF9800)
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * 3.14159,
      true,
      paint,
    );

    // Draw inner circle for donut effect
    final innerPaint = Paint()
      ..color = const Color(0xFF2A2A2A)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.6, innerPaint);

    // Draw text
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'BTCUSDT\n100.00%',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ScatterPlotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final profitPaint = Paint()
      ..color = const Color(0xFF4CAF50)
      ..style = PaintingStyle.fill;

    final lossPaint = Paint()
      ..color = const Color(0xFFF44336)
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Draw Y-axis labels
    final yValues = ['64k', '64k', '64k', '64k', '64k'];
    final yPositions = [0.1, 0.3, 0.5, 0.7, 0.9];

    for (int i = 0; i < yValues.length; i++) {
      textPainter.text = TextSpan(
        text: yValues[i],
        style: const TextStyle(color: Colors.white70, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(8, size.height * yPositions[i] - textPainter.height / 2),
      );
    }

    // Draw X-axis labels
    final xValues = ['1m', '24h', '5d', '15d'];
    final xPositions = [0.2, 0.4, 0.6, 0.8];

    for (int i = 0; i < xValues.length; i++) {
      textPainter.text = TextSpan(
        text: xValues[i],
        style: const TextStyle(color: Colors.white70, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          size.width * xPositions[i] - textPainter.width / 2,
          size.height - 20,
        ),
      );
    }

    // Draw scatter points with proper margins
    final marginLeft = 60.0;
    final marginRight = 20.0;
    final marginTop = 20.0;
    final marginBottom = 40.0;

    final chartWidth = size.width - marginLeft - marginRight;
    final chartHeight = size.height - marginTop - marginBottom;

    final points = [
      {'x': 0.2, 'y': 0.3, 'type': 'profit'},
      {'x': 0.4, 'y': 0.5, 'type': 'profit'},
      {'x': 0.6, 'y': 0.2, 'type': 'profit'},
      {'x': 0.8, 'y': 0.4, 'type': 'profit'},
      {'x': 0.2, 'y': 0.7, 'type': 'loss'},
    ];

    for (final point in points) {
      final paint = point['type'] == 'profit' ? profitPaint : lossPaint;
      canvas.drawCircle(
        Offset(
          marginLeft + chartWidth * (point['x'] as double),
          marginTop + chartHeight * (point['y'] as double),
        ),
        4,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
