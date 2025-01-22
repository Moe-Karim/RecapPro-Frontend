import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final Widget subtitle;
  final IconData icon;
  final Widget? child;
  final EdgeInsetsGeometry margin;
  final ShapeBorder shape;
  final Icon downloadIcon;
  final VoidCallback onIconTap;
  final VoidCallback onDownloadTap;

  CustomCard({
    required this.onIconTap,
    required this.onDownloadTap,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.child,
    this.downloadIcon = const Icon(
      Icons.download_outlined,
      color: Color(0xFF61DBFB),
      size: 30.0,
    ),
    this.margin = const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
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
      child: Card(
        margin: margin,
        shape: shape,
        child: Column(
          children: [
            Row(
              spacing: 15,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(title,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: subtitle,
                  ),
                ),
                GestureDetector(
                  onTap: onIconTap,
                  child: Icon(
                    icon,
                    color: Color(0xFF61DBFB),
                    size: 30,
                  ),
                ),
                GestureDetector(
                  onTap: onDownloadTap,
                  child: downloadIcon,
                ),
                SizedBox()
              ],
            ),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
