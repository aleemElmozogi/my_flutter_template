import 'package:my_flutter_template/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLauncher {
  final _appFacebookUri = Uri.https('facebook.com', 'zakatlibya');

  void sendEmail() async {
    final appEmailUri = Uri(
      scheme: 'mailto',
      path: 'aafa@zakatfund.gov.ly',
      queryParameters: {'subject': S.current.emailSubject},
    );
    launchUrl(appEmailUri);
  }

  void openLocation(String lat, String lng, {int zoom = 15}) async {
    final Uri googleMapsUri = Uri(
      scheme: 'geo',
      host: '0,0',
      queryParameters: {
        'q': '$lat,$lng($zoom)',
        'z': zoom.toString(), // Optional, sometimes respected
      },
    );
    launchUrl(googleMapsUri);
  }

  void callPhoneNumber() async {
    final phoneUri = Uri(scheme: 'tel', path: '0924397976');
    launchUrl(phoneUri);
  }

  void launchFacebook() async {
    launchUrl(_appFacebookUri);
  }
}
