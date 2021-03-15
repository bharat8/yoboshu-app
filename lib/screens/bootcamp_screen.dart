import 'package:flutter/material.dart';

class BootCampScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Column(
              children: [
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.65,
                  // color: Colors.black12,
                  child: Image.asset(
                    "assets/images/no-work.jpg",
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                Container(
                    width: constraints.maxWidth,
                    padding: EdgeInsets.all(20),
                    child: FittedBox(
                        child: Text(
                      "Currently, there are no bootcamps",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )))
              ],
            ));
  }
}
