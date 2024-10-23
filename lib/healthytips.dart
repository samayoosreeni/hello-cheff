import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class healthtips extends StatefulWidget {
  final String tipUrl;
  const healthtips({super.key, required this.tipUrl});

  @override
  State<healthtips> createState() => _healthtipsState();
}

class _healthtipsState extends State<healthtips> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onHttpError: (HttpResponseError error) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(widget.tipUrl??
                '')),
        ),
      ),
    );
  }
}
