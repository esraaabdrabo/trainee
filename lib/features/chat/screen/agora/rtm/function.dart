// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:agora_rtm/agora_rtm.dart';
import 'package:upgrade_traine_project/core/dioHelper/dio_helper.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/agoraConfig.dart';

abstract class RTMfunction {
  static Future<String> getRTMtoken(String id) async {
    return await DioHelper.get("/services/app/Agora/GetRtmToken?Uid=$id")
        .then((value) => value.data['result']['token']);
  }

  static Future<AgoraRtmClient> createClient() async {
    AgoraRtmClient client;

    client = await AgoraRtmClient.createInstance(AgoraConstants.appId);

    client.onMessageReceived = (RtmMessage message, String peerId) {
      print("Peer msg: $peerId, msg: ${message.messageType} ${message.text}");
    };
    client.onPeersOnlineStatusChanged =
        (Map<String, RtmPeerOnlineState> peersStatus) {
      print("Peers online status changed ${peersStatus.toString()}");
    };

    var callManager = client.getRtmCallManager();

    callManager.onLocalInvitationReceivedByPeer =
        (LocalInvitation localInvitation) {
      print(
          'Local invitation received by peer: ${localInvitation.calleeId}, content: ${localInvitation.content}');
    };
    callManager.onLocalInvitationAccepted =
        (LocalInvitation localInvitation, String response) {
      print(
          'Local invitation accepted by peer: ${localInvitation.calleeId}, response: $response');
    };
    callManager.onLocalInvitationRefused =
        (LocalInvitation localInvitation, String response) {
      print(
          'Local invitation refused by peer: ${localInvitation.calleeId}, response: $response');
    };
    callManager.onLocalInvitationCanceled = (LocalInvitation localInvitation) {
      print(
          'Local invitation canceled: ${localInvitation.calleeId}, content: ${localInvitation.content}');
    };
    callManager.onLocalInvitationFailure =
        (LocalInvitation localInvitation, int errorCode) {
      print(
          'Local invitation failure: ${localInvitation.calleeId}, errorCode: $errorCode');
    };
    callManager.onRemoteInvitationReceived =
        (RemoteInvitation remoteInvitation) {
      print(
          'Remote invitation received by peer: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
    };
    callManager.onRemoteInvitationAccepted =
        (RemoteInvitation remoteInvitation) {
      print(
          'Remote invitation accepted by peer: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
    };
    callManager.onRemoteInvitationRefused =
        (RemoteInvitation remoteInvitation) {
      print(
          'Remote invitation refused by peer: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
    };
    callManager.onRemoteInvitationCanceled =
        (RemoteInvitation remoteInvitation) {
      print(
          'Remote invitation canceled: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
    };
    callManager.onRemoteInvitationFailure =
        (RemoteInvitation remoteInvitation, int errorCode) {
      print(
          'Remote invitation failure: ${remoteInvitation.callerId}, errorCode: $errorCode');
    };
    return client;
  }
}
