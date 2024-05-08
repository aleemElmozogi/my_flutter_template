import 'package:url_launcher/url_launcher.dart';

class AppLauncher {
  final _appFacebookUri = Uri.https('facebook.com', 'zakatlibya');
  final _appEmailUri = Uri(
    scheme: 'mailto',
    path: 'aafa@zakatfund.gov.ly',
    query: 'subject=رسالة بخصوص برنامج زكاتي',
  );
  void sendEmail() async {
    launchUrl(
      _appEmailUri,
    );
  }
  void callPhoneNumber() async {
    final phoneUri = Uri(scheme: 'tel', path: '0924397976');
    launchUrl(phoneUri);
  }
  void launchFacebook() async {
    launchUrl(
      _appFacebookUri,
    );
  }
}
