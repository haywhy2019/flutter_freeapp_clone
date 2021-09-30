import 'package:flutter/material.dart';
import 'package:free_app/widgets/sectionItemWidget.dart';

class SectionGridWidget extends StatelessWidget {
  final gridItems;
  SectionGridWidget(this.gridItems);

  @override
  Widget build(BuildContext context) {
    print(gridItems);
    print("grid----item");

    return Container(
      height: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Comedy",
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white38,
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 3 / 3),
              itemBuilder: (ctx, i) => SectionItem(
                gridItems[i].imageUrl,
                gridItems[i].title,
                gridItems[i].subtitle,
              ),
              itemCount: gridItems.length,
            ),
          )
        ],
      ),
    );
  }
}
