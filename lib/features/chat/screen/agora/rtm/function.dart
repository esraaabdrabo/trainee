import 'package:agora_uikit/agora_uikit.dart';

abstract class RTMfunction {
  static //first step
  void _createClient() async {
    _client =
        await AgoraRtmClient.createInstance("f7182aee25064259a00c0af909e551dd");

    _client?.onMessageReceived = (RtmMessage message, String peerId) {
      _log("Peer msg: $peerId, msg: ${message.messageType} ${message.text}");
    };
    _client?.onPeersOnlineStatusChanged =
        (Map<String, RtmPeerOnlineState> peersStatus) {
      _log("Peers online status changed ${peersStatus.toString()}");
    };

    var callManager = _client?.getRtmCallManager();

    callManager?.onLocalInvitationReceivedByPeer =
        (LocalInvitation localInvitation) {
      _log(
          'Local invitation received by peer: ${localInvitation.calleeId}, content: ${localInvitation.content}');
    };
    callManager?.onLocalInvitationAccepted =
        (LocalInvitation localInvitation, String response) {
      _log(
          'Local invitation accepted by peer: ${localInvitation.calleeId}, response: $response');
      setState(() {
        _localInvitation = null;
      });
    };
    callManager?.onLocalInvitationRefused =
        (LocalInvitation localInvitation, String response) {
      _log(
          'Local invitation refused by peer: ${localInvitation.calleeId}, response: $response');
      setState(() {
        _localInvitation = null;
      });
    };
    callManager?.onLocalInvitationCanceled = (LocalInvitation localInvitation) {
      _log(
          'Local invitation canceled: ${localInvitation.calleeId}, content: ${localInvitation.content}');
      setState(() {
        _localInvitation = null;
      });
    };
    callManager?.onLocalInvitationFailure =
        (LocalInvitation localInvitation, int errorCode) {
      _log(
          'Local invitation failure: ${localInvitation.calleeId}, errorCode: $errorCode');
      setState(() {
        _localInvitation = null;
      });
    };
    callManager?.onRemoteInvitationReceived =
        (RemoteInvitation remoteInvitation) {
      _log(
          'Remote invitation received by peer: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
      setState(() {
        _remoteInvitation = remoteInvitation;
      });
    };
    callManager?.onRemoteInvitationAccepted =
        (RemoteInvitation remoteInvitation) {
      _log(
          'Remote invitation accepted by peer: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
      setState(() {
        _remoteInvitation = null;
      });
    };
    callManager?.onRemoteInvitationRefused =
        (RemoteInvitation remoteInvitation) {
      _log(
          'Remote invitation refused by peer: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
      setState(() {
        _remoteInvitation = null;
      });
    };
    callManager?.onRemoteInvitationCanceled =
        (RemoteInvitation remoteInvitation) {
      _log(
          'Remote invitation canceled: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
      setState(() {
        _remoteInvitation = null;
      });
    };
    callManager?.onRemoteInvitationFailure =
        (RemoteInvitation remoteInvitation, int errorCode) {
      _log(
          'Remote invitation failure: ${remoteInvitation.callerId}, errorCode: $errorCode');
      setState(() {
        _remoteInvitation = null;
      });
    };
  }

}