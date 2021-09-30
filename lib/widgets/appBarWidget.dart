import 'package:flutter/material.dart';

AppBar appBarWidget(title1, String title2, Icon menuIcon,
    {bool showIcon: true}) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title1,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title2,
          style: TextStyle(fontSize: 18, color: Colors.white30),
        ),
      ],
    ),
    actions: [
      showIcon
          ? IconButton(icon: menuIcon, iconSize: 30, onPressed: () {})
          : Container(),
      PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          color: Colors.black45,
          icon: Icon(
            Icons.more_vert,
            size: 30,
          ),
          itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text(
                    "Settings",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    "Notices",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    "Contact Us",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ])
    ],
  );
}
