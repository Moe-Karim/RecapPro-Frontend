import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final Widget subtitle;
  final IconData icon;
  final Widget? child;
  final VoidCallback onTap;
  final EdgeInsetsGeometry margin;
  final ShapeBorder shape;

  CustomCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.child,
    required this.onTap,
    this.margin = const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
    this.shape = const RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xFF61DBFB),
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: margin,
        shape: shape,
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon, color: Color(0xFF61DBFB)),
              title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: (subtitle),
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
