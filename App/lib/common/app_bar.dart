import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
    @override
    final Size preferredSize;

    final String title;

    CustomAppBar({ this.title }) : preferredSize = Size.fromHeight(50.0);

    @override
    Widget build(BuildContext context) {
        return AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/barking.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0), child: Text('WOOF - $title')
                )
              ],
            ),
        );
    }
}