import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const appId = "004e78b9715c4733b1541590b261c7a8";
const token =
    "007eJxTYAh47rLvtLuq4rRdtaHPkhxsxGWffT+aZJBia6S8br9rXokCg4GBSaq5RZKluaFpsom5sXGSoamJoamlQZKRmWGyeaLFtsXP0hsCGRki2dxYGRkgEMTnZUhMzy9KjE/LKS0pSS1iYAAA5B8g6w==";
const channel = "agora_flutter";

class AgoraConnectView extends StatefulWidget {
  const AgoraConnectView({super.key});

  @override
  State<AgoraConnectView> createState() => _MyAppState();
}

class _MyAppState extends State<AgoraConnectView> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(
      const RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ),
    );

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (
          RtcConnection connection,
          int remoteUid,
          UserOfflineReasonType reason,
        ) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
            '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token',
          );
        },
      ),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: token,
      channelId: channel,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _dispose();
  }

  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agora Video Call')),
      body: Stack(
        children: [
          Center(child: _remoteVideo()),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child:
                    _localUserJoined
                        ? AgoraVideoView(
                          controller: VideoViewController(
                            rtcEngine: _engine,
                            canvas: const VideoCanvas(uid: 0),
                          ),
                        )
                        : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: const RtcConnection(channelId: channel),
        ),
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
