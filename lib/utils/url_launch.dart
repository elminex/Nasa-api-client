import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(url) async {
  final Uri parsedUrl = Uri.parse(url);

  if (!await launchUrl(parsedUrl)) {
    throw Exception('Could not launch $parsedUrl');
  }
}
