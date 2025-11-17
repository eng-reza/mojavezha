import "package:flutter/material.dart";

class MainCard extends StatefulWidget {
  final double width;
  final String title;
  final String subtitle;
  final List<IconData> icons;
  final VoidCallback onTap;

  const MainCard({
    super.key,
    required this.width,
    required this.title,
    required this.subtitle,
    required this.icons,
    required this.onTap,
  });

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _tapController;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _tapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.0,
      upperBound: 0.04,
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: 0.96,
    ).animate(CurvedAnimation(parent: _tapController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _tapController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails d) => _tapController.forward();
  void _onTapUp(TapUpDetails d) => _tapController.reverse();
  void _onTapCancel() => _tapController.reverse();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.title,
      hint: widget.subtitle,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: (d) {
          _onTapUp(d);
          widget.onTap();
        },
        onTapCancel: _onTapCancel,
        child: AnimatedBuilder(
          animation: _scale,
          builder: (context, child) {
            return Transform.scale(scale: _scale.value, child: child);
          },
          child: Container(
            width: widget.width,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((255 * 0.22).toInt()),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: Colors.white.withAlpha((255 * 0.28).toInt()),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((255 * 0.08).toInt()),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              backgroundBlendMode: BlendMode.overlay,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 10,
                  children: widget.icons
                      .map((icon) => Icon(icon, size: 26, color: Colors.white))
                      .toList(),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
