import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoboshu/providers/create_post_model.dart';
import 'package:yoboshu/providers/feed_provider.dart';

class CreatePostDetails extends StatefulWidget {
  final String type;

  const CreatePostDetails(this.type);

  @override
  _CreatePostDetailsState createState() => _CreatePostDetailsState();
}

class _CreatePostDetailsState extends State<CreatePostDetails> {
  final _titleController = TextEditingController();
  final _captionController = TextEditingController();
  String userName = "Bharat Sundal";
  String selectedCommunity;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _captionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height * 0.12 - mediaQuery.padding.top,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.deepPurple[100], Colors.blue[100]],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
            child: Row(
              children: [
                Consumer<CreatePostData>(
                  builder: (ctx, value, child) => GestureDetector(
                    onTap: () {
                      Navigator.pop(ctx);
                      value.deallocate = null;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Text(
                  "${widget.type} Post",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            height: mediaQuery.size.height * 0.12,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Post as:",
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
                DropdownButton<String>(
                  value: userName,
                  items: <String>['Bharat Sundal', 'Anonymous']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    setState(() {
                      userName = value;
                    });
                  },
                ),
                Consumer2<CreatePostData, FeedProvider>(
                  builder: (ctx, value, value1, __) => ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    )),
                    onPressed: () {
                      value.postFeed(
                          widget.type,
                          userName,
                          selectedCommunity,
                          _titleController.text,
                          _captionController.text,
                          ctx,
                          value1);
                    },
                    child: Text(
                      "POST",
                      style: TextStyle(letterSpacing: 1.5),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: mediaQuery.size.height * 0.1,
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: mediaQuery.size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Community:",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500)),
                Consumer<CreatePostData>(
                  builder: (ctx, prov, __) => DropdownButton<String>(
                    value: selectedCommunity,
                    items: prov.communitiesList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      FocusScope.of(ctx).requestFocus(new FocusNode());
                      setState(() {
                        selectedCommunity = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: mediaQuery.size.height * 0.66,
            width: mediaQuery.size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: constraints.maxHeight * 0.1,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _titleController,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                      decoration: InputDecoration.collapsed(
                          hintText: "A catchy title (max 180 characters)",
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.05,
                    child: Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                  ),
                  if (widget.type == "Image")
                    Consumer<CreatePostData>(
                      builder: (BuildContext ctx, value, Widget child) =>
                          GestureDetector(
                        onTap: () => value.uploadImage(ctx),
                        child: Container(
                          height: constraints.maxHeight * 0.4,
                          child: Card(
                            child: Center(
                                child: value.pickedImage == null
                                    ? Icon(Icons.add)
                                    : Image.file(value.pickedImage)),
                          ),
                        ),
                      ),
                    ),
                  if (widget.type == "Image")
                    Container(
                      height: constraints.maxHeight * 0.05,
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                    ),
                  Container(
                    height: constraints.maxHeight * 0.4,
                    padding: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: _captionController,
                      maxLines: 1,
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                      decoration: InputDecoration.collapsed(
                        hintText: widget.type == "Image"
                            ? "Caption for the image (optional)"
                            : (widget.type == "Text"
                                ? "A detailed discription (optional)"
                                : "https://"),
                        hintStyle:
                            TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    )));
  }
}
