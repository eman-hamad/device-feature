import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayAudio extends StatefulWidget {
  @override
  PlayAudioState createState() => PlayAudioState();
}

// play , record sound
class PlayAudioState extends State<PlayAudio> {
  FlutterSoundPlayer? player;
  FlutterSoundRecorder? recorder;
  bool isRecording = false;
  bool isPlaying = false;
  String? audioPath;

//iniT RECORDER ,PLAYER
  @override
  void initState() {
    super.initState();
    recorder = FlutterSoundRecorder();
    player = FlutterSoundPlayer();
    initRecPlay();
  }

  Future<void> initRecPlay() async {
    await Permission.microphone.request();
    await recorder!.openRecorder();
    await player!.openPlayer();
  }

  Future<void> startRecording() async {
    Directory tempDir = await getApplicationDocumentsDirectory();
    audioPath = '${tempDir.path}/audio_record.aac';

    await recorder!.startRecorder(toFile: audioPath!);
    setState(() => isRecording = true);
  }

  Future<void> stopRecording() async {
    await recorder!.stopRecorder();
    setState(() => isRecording = false);
  }

  Future<void> playAudio() async {
    if (audioPath != null && File(audioPath!).existsSync()) {
      await player!.startPlayer(fromURI: audioPath!);
      setState(() => isPlaying = true);
      player!.setSubscriptionDuration(Duration(milliseconds: 500));
      player!.onProgress!.listen((event) {
        if (event.duration == event.position) {
          setState(() => isPlaying = false);
        }
      });
    }
  }

// close player resources
  @override
  void dispose() {
    recorder!.closeRecorder();
    player!.closePlayer();
    super.dispose();
  }

  //ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Audio Recorder"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              onPressed: isRecording ? stopRecording : startRecording,
              child: Text(
                isRecording ? "Stop Recording" : "Record Audio",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 25),
            if (audioPath != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent),
                onPressed: isPlaying ? null : playAudio,
                child: Text(
                  "Play Audio",
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
