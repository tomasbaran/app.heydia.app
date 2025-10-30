import 'package:url_launcher/url_launcher.dart';
import '../errors_strings.dart';

class UrlService {
  /// Launches a URL in the same tab/window
  ///
  /// Throws an exception if the URL cannot be launched
  static Future<void> launchUrlInSameTab(String urlString) async {
    final Uri url = Uri.parse(urlString);

    // print('Attempting to launch URL: ${url.toString()}');

    try {
      if (await canLaunchUrl(url)) {
        // print('URL can be launched, launching...');
        await launchUrl(url, webOnlyWindowName: '_self');
        // print('URL launched successfully');
      } else {
        // print('URL cannot be launched');
        throw Exception('${ErrorsStrings.couldNotLaunchUrl} $urlString');
      }
    } catch (e) {
      // print('Error launching URL: $e');
      rethrow;
    }
  }
}
