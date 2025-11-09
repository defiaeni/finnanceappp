import 'package:flutter/material.dart';

class GridMenuItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const GridMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<GridMenuItem> createState() => _GridMenuItemState();
}

class _GridMenuItemState extends State<GridMenuItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 120), vsync: this);
    _scale = Tween(begin: 1.0, end: 0.93).animate(CurvedAnimation(
        parent: _controller, curve: Curves.easeOutCubic));
  }

  Future<void> _handleTap() async {
    await _controller.forward();
    await _controller.reverse();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: InkWell(
        onTap: _handleTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.8)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 22, color: Colors.black87),
              const SizedBox(height: 6),
              Text(widget.label,
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}