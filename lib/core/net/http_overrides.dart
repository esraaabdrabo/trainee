import 'dart:io';

/// For solving handshake error
class BadCertHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (
          X509Certificate cert,
          String host,
          int port,
          ) {
        return true;
      };
  }
}