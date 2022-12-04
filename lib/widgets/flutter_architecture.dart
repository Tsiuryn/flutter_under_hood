import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_under_hood/generated/resources.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterArchitecture extends StatelessWidget {
  const FlutterArchitecture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _onTapLink(String text, String? href, String title) async {
      if (href == null) return;
      final _url = Uri.parse(href);
      if (await canLaunchUrl(_url)) {
        await launchUrl(_url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong address: $href'),
          ),
        );
      }
    }

    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(AppResources.flutterArchitecture.substring(7)),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            data: snapshot.data ?? '',
            onTapLink: _onTapLink,
              styleSheet: MarkdownStyleSheet(code: TextStyle(fontWeight: FontWeight.bold, fontSize: 32))
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
