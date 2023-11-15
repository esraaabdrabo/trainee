import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/controllers/rtc_buttons.dart';
import 'package:agora_uikit/src/buttons/cloud_recording_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A UI class to style how the buttons look. Use this class to add, remove or customize the buttons in your live video calling application.
class CustomAgoraVideoButtons extends StatefulWidget {
  final AgoraClient client;

  /// List of enabled buttons. Use this to remove any of the default button or change their order.
  final List<BuiltInButtons>? enabledButtons;

  /// List of buttons that are added next to the default buttons. The buttons class contains a horizontal scroll view.
  final List<Widget>? extraButtons;

  /// Automatically hides the button class after a default time of 5 seconds if not set otherwise.
  final bool? autoHideButtons;

  /// The default auto hide time = 5 seconds
  final int autoHideButtonTime;

  /// Adds a vertical padding to the set of button
  final double? verticalButtonPadding;

  /// Alignment for the button class
  final Alignment buttonAlignment;

  /// Use this to style the disconnect button as per your liking while still keeping the default functionality.
  final Widget? disconnectButtonChild;

  /// Use this to style the mute mic button as per your liking while still keeping the default functionality.
  final Widget? muteButtonChild;

  /// Use this to style the switch camera button as per your liking while still keeping the default functionality.
  final Widget? switchCameraButtonChild;

  /// Use this to style the disabled video button as per your liking while still keeping the default functionality.
  final Widget? disableVideoButtonChild;

  final Widget? screenSharingButtonWidget;

  final Widget? cloudRecordingButtonWidget;

  /// Agora VideoUIKit takes care of leaving the channel and destroying the engine. But if you want to add any other functionality to the disconnect button, use this.
  final Function()? onDisconnect;

  /// Adds Screen Sharing button to the layout and let's user share their screen using the same. Currently only on Android and iOS. The deafult value is set to `false`. So, if you want to add screen sharing set [addScreenSharing] to `true`.
  ///
  /// Note: This feature is currently in beta
  final bool? addScreenSharing;

  final bool? cloudRecordingEnabled;

  const CustomAgoraVideoButtons({
    Key? key,
    required this.client,
    this.enabledButtons,
    this.extraButtons,
    this.autoHideButtons,
    this.autoHideButtonTime = 5,
    this.verticalButtonPadding,
    this.buttonAlignment = Alignment.bottomCenter,
    this.disconnectButtonChild,
    this.muteButtonChild,
    this.switchCameraButtonChild,
    this.disableVideoButtonChild,
    this.screenSharingButtonWidget,
    this.cloudRecordingButtonWidget,
    this.onDisconnect,
    this.addScreenSharing = false,
    this.cloudRecordingEnabled = false,
  }) : super(key: key);

  @override
  State<CustomAgoraVideoButtons> createState() =>
      _CustomAgoraVideoButtonsState();
}

class _CustomAgoraVideoButtonsState extends State<CustomAgoraVideoButtons> {
  List<Widget> buttonsEnabled = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: widget.autoHideButtonTime),
      () {
        if (mounted) {
          setState(() {
            toggleVisible(
              value: widget.client.sessionController.value,
            );
          });
        }
      },
    );

    Map buttonMap = <BuiltInButtons, Widget>{
      BuiltInButtons.toggleMic: _MuteMicButton(widget.client),
      BuiltInButtons.callEnd: _DisconnectCallButton(widget.client),
      BuiltInButtons.switchCamera: _SwitchCameraButton(widget.client),
      BuiltInButtons.toggleCamera: _DisableVideoButton(widget.client),
      BuiltInButtons.screenSharing: _screenSharingButton(),
      BuiltInButtons.cloudRecording:
          CloudRecordingButton(client: widget.client),
    };

    if (widget.enabledButtons != null) {
      for (var i = 0; i < widget.enabledButtons!.length; i++) {
        for (var j = 0; j < buttonMap.length; j++) {
          if (buttonMap.keys.toList()[j] == widget.enabledButtons![i]) {
            buttonsEnabled.add(buttonMap.values.toList()[j]);
          }
        }
      }
    }
  }

  Widget toolbar(List<Widget>? buttonList) {
    return Container(
      alignment: widget.buttonAlignment,
      padding: widget.verticalButtonPadding == null
          ? const EdgeInsets.only(bottom: 48)
          : EdgeInsets.symmetric(vertical: widget.verticalButtonPadding!),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: .05.sw),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  if (widget.enabledButtons!.contains(BuiltInButtons.callEnd))
                    _DisconnectCallButton(widget.client),
                  if (widget.enabledButtons!.contains(BuiltInButtons.toggleMic))
                    _MuteMicButton(widget.client),
                  if (widget.enabledButtons!
                      .contains(BuiltInButtons.switchCamera))
                    _SwitchCameraButton(widget.client),
                  if (widget.enabledButtons!
                      .contains(BuiltInButtons.toggleCamera))
                    _DisableVideoButton(widget.client),
                  if (widget.enabledButtons!
                      .contains(BuiltInButtons.cloudRecording))
                    CloudRecordingButton(
                      client: widget.client,
                    ),
                  if (widget.enabledButtons!
                      .contains(BuiltInButtons.screenSharing))
                    _screenSharingButton(),
                  if (widget.extraButtons != null)
                    for (var i = 0; i < widget.extraButtons!.length; i++)
                      widget.extraButtons![i]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _screenSharingButton() {
    return widget.screenSharingButtonWidget != null
        ? RawMaterialButton(
            constraints: BoxConstraints(maxWidth: .25.sw),
            onPressed: () =>
                shareScreen(sessionController: widget.client.sessionController),
            child: widget.screenSharingButtonWidget,
          )
        : RawMaterialButton(
            constraints: BoxConstraints(maxWidth: .25.sw),
            onPressed: () =>
                shareScreen(sessionController: widget.client.sessionController),
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: widget.client.sessionController.value.turnOnScreenSharing
                ? Colors.blueAccent
                : Colors.white,
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              widget.client.sessionController.value.turnOnScreenSharing
                  ? Icons.stop_screen_share_outlined
                  : Icons.screen_share_outlined,
              color: widget.client.sessionController.value.turnOnScreenSharing
                  ? Colors.white
                  : Colors.blueAccent,
              size: 20.0,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.client.sessionController,
        builder: (context, counter, something) {
          return widget.autoHideButtons != null
              ? widget.autoHideButtons!
                  ? Visibility(
                      visible: widget.client.sessionController.value.visible,
                      child: toolbar(widget.enabledButtons == null
                          ? null
                          : buttonsEnabled),
                    )
                  : toolbar(
                      widget.enabledButtons == null ? null : buttonsEnabled)
              : toolbar(widget.enabledButtons == null ? null : buttonsEnabled);
        });
  }
}

class _MuteMicButton extends StatelessWidget {
  final AgoraClient client;
  const _MuteMicButton(this.client);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(maxWidth: .25.sw),
      onPressed: () => toggleMute(sessionController: client.sessionController),
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: client.sessionController.value.isLocalUserMuted
          ? Colors.blueAccent
          : Colors.white,
      padding: const EdgeInsets.all(5.0),
      child: Icon(
        client.sessionController.value.isLocalUserMuted
            ? Icons.mic_off
            : Icons.mic,
        color: client.sessionController.value.isLocalUserMuted
            ? Colors.white
            : Colors.blueAccent,
        size: 20.0,
      ),
    );
  }
}


class _DisconnectCallButton extends StatelessWidget {
  final AgoraClient client;
  const _DisconnectCallButton(this.client);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(maxWidth: .25.sw),
      onPressed: () => _onCallEnd(context),
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.redAccent,
      padding: const EdgeInsets.all(5.0),
      child: const Icon(Icons.call_end, color: Colors.white, size: 20),
    );
  }

  /// Default functionality of disconnect button is such that it pops the view and navigates the user to the previous screen.
  Future<void> _onCallEnd(BuildContext context) async {
    Navigator.pop(context);
    await client.release();
  }
}
