import 'package:upgrade_traine_project/core/navigation/navigation_service.dart';
import 'package:upgrade_traine_project/core/notifications/calls/payload_extractor.dart';
import 'package:upgrade_traine_project/core/ui/error_ui/toast.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/video_call_screen.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/voice_call_screen.dart';

abstract class CallsNavigator {
  static Future<void> goToVideoCallScreen(String? payload) async =>
      await NavigationService().navigateTo(VideoCallScreen.routeName,
          arguments: (PayLoadDataExtractor.getChannelNameAndId(payload)));

  static Future<void> goToVoiceCallScreen(String? payload) async {
    Toast.show("here ${PayLoadDataExtractor.getChannelNameAndId(payload)}");
    return await NavigationService().navigateTo(VoiceCallScreen.routeName,
        arguments: (PayLoadDataExtractor.getChannelNameAndId(payload)));
  }
}
