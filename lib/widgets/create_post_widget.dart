import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:yoboshu/widgets/create_post_details.dart';

class CreatePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            buildOptions(constraints.maxWidth, constraints.maxHeight / 3,
                Icons.image, "Image", Colors.indigo, context),
            buildOptions(constraints.maxWidth, constraints.maxHeight / 3,
                Icons.text_fields, "Text", Colors.grey, context),
            buildOptions(constraints.maxWidth, constraints.maxHeight / 3,
                Icons.link, "Link", Colors.cyan, context)
          ],
        );
      },
    );
  }

  Widget buildOptions(double width, double height, IconData icon, String text,
      Color color, BuildContext ctx) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 90),
        child: GestureDetector(
          onTap: () => Navigator.of(ctx)
              .push(MaterialPageRoute(builder: (_) => CreatePostDetails(text))),
          child: DottedBorder(
              child: Container(
            width: width,
            color: color.withOpacity(0.1),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Icon(
                    icon,
                    size: 30,
                    color: color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Create $text post",
                    style: TextStyle(color: color),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
