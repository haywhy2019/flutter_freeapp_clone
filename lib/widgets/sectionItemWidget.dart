import 'package:flutter/material.dart';
import 'package:free_app/const.dart';
import '../model/sectionModel.dart';

class SectionItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  SectionItem(this.imageUrl, this.title, this.subtitle);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                imageUrl,
                height: 120,
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              title,
              style: sectionTitle,
            ),
            Text(
              subtitle,
              style: sectionSubtitle,
            ),
          ],
        ),
      ],
    );
  }
}
