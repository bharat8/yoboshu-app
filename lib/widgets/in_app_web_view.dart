import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewWidget extends StatefulWidget {
  final String url;
  InAppWebViewWidget(this.url);

  @override
  _InAppWebViewWidgetState createState() => _InAppWebViewWidgetState();
}

class _InAppWebViewWidgetState extends State<InAppWebViewWidget> {
  InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.url),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(useOnDownloadStart: true),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
              },
            ),
          ),
        ]),
      ),
    );
  }
}
