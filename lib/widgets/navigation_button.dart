import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoboshu/providers/navigation_provider.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = Provider.of<NavigationProvider>(context);
    return LayoutBuilder(builder: (context, constraints) {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () => navigator.selectedTile(index),
          child: Container(
            width: constraints.maxWidth / 5,
            height: constraints.maxHeight,
            child: Column(
              children: [
                Container(
                    height: constraints.maxHeight * 0.45,
                    padding: EdgeInsets.only(top: 8),
                    child: Image.asset(
                        navigator.tileCurrentState[index] == false
                            ? navigator.navigationImages[index]
                            : navigator.navigationImagesColored[index])),
                Container(
                    height: constraints.maxHeight * 0.55,
                    alignment: Alignment.center,
                    child: Text(
                      navigator.navigationTitles[index],
                      style: TextStyle(
                          fontSize: 12,
                          color: navigator.tileCurrentState[index] == false
                              ? Colors.black
                              : Color(0xff050069)),
                    ))
              ],
            ),
          ),
        ),
        itemCount: navigator.navigationTitles.length,
      );
    });
  }
}
