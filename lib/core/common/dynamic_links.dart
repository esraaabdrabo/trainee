import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkService {
  void fetchLinkData({required Function(String? id) onHandle}) async {
    bool handled = false;
    // Get any initial links
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      handled = handleLinkData(data: initialLink, onHandle: onHandle);
    }
    if (!handled) {
      FirebaseDynamicLinks.instance.onLink;
    }

    /*
      FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
        DynamicLinkService dynamicLinkService = DynamicLinkService();
        dynamicLinkService.handleLinkData(
            data: dynamicLinkData, onHandle: onHandle);
      }).onError((error) {
        // Handle errors
      });*/
  }

  bool handleLinkData(
      {required PendingDynamicLinkData data,
      required Function(String? id) onHandle}) {
    final Uri uri = data.link;
    print('uuuri:$uri');
    final queryParams = uri.queryParameters;
    print(queryParams.length);
    if (queryParams.isNotEmpty) {
      String? id = queryParams["id"];
      if (id != null) print('uuuri:$id');
      onHandle(id);
      return true;
    }
    return false;
  }

  Future<Uri> createStoryDynamicLink(String id) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      // The Dynamic Link URI domain. You can view created URIs on your Firebase console
      uriPrefix: 'https://yacotch.page.link',
      // The deep Link passed to your application which you can use to affect change
      link: Uri.parse('https://www.yacotch.com/?id=$id'),
      // Android application details needed for opening correct app on device/Play Store
      androidParameters: const AndroidParameters(
        packageName: 'com.yacotch.trainee',
        minimumVersion: 1,
      ),
      // iOS application details needed for opening correct app on device/App Store
      /*iosParameters: const IOSParameters(
        bundleId: */ /*iosBundleId*/ /*,
        minimumVersion: '2',
      ),*/
    );

    /*  final ShortDynamicLink shortDynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    final Uri uri = shortDynamicLink.shortUrl;
*/
    final dynamicLink =
    await FirebaseDynamicLinks.instance.buildLink(parameters);
    return dynamicLink;
  }
}
/*Uri uri = await _dynamicLinkService.createFirstPostLink(widget.product.id.toString());
    print (uri.toString());
    print ("uriii");
    Share.share(uri.toString());*/
