import "package:flutter/material.dart";

class AnimatedLogo extends StatefulWidget {
  final String assetPath;
  final double size;
  const AnimatedLogo({super.key, required this.assetPath, required this.size});

  @override
  State<AnimatedLogo> createState() => AnimatedLogoState();
}

class AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _scale = Tween<double>(
      begin: 0.88,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _c, curve: Curves.elasticOut));
    _opacity = CurvedAnimation(parent: _c, curve: Curves.easeIn);
    _c.forward();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
      child: const Icon(Icons.shield, size: 48, color: Colors.white),
    );

    return ScaleTransition(
      scale: _scale,
      child: FadeTransition(
        opacity: _opacity,
        child: Container(
          width: widget.size,
          height: widget.size,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.white.withAlpha((255 * 0.14).toInt()),
                Colors.white.withAlpha((255 * 0.06).toInt()),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((255 * 0.18).toInt()),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              widget.assetPath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stack) => placeholder,
            ),
          ),
        ),
      ),
    );
  }
}
