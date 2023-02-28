import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:push_ups_counter/config/values.dart';
import 'package:push_ups_counter/screen/setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _count1 = 0;
  int _count2 = 0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  double _interval = 0;
  Timer? _timer;
  bool _isPlaying = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getInterval();
  }

  void _getInterval() {
    _prefs
        .then((SharedPreferences prefs) =>
    prefs.getDouble('push-ups.interval') ?? 1.0)
        .then((double interval) {
      _interval = interval;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double mainScreenWidth = MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
      backgroundColor: MyStyle.mainBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: mainScreenWidth * 0.8,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: MyStyle.mainLineColor)),
              child: Text(
                'Push-ups counter',
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: MyStyle.mainFontColor,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Container(
              //alignment: Alignment.topCenter,
              width: mainScreenWidth * 0.9,
              height: 150,
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    decoration: const BoxDecoration(
                      border: Border(
                        //left: BorderSide(color: MyStyle.mainLineColor, width: 2),
                        right:
                            BorderSide(color: MyStyle.mainLineColor, width: 1),
                      ),
                    ),
                    child: Text(
                      _count1.toString(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                        fontSize: 80,
                        color: MyStyle.mainFontColor,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    decoration: const BoxDecoration(
                      border: Border(
                        left:
                            BorderSide(color: MyStyle.mainLineColor, width: 2),
                        //right: BorderSide(color: MyStyle.mainLineColor, width: 2),
                      ),
                    ),
                    child: Text(
                      _count2.toString(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                        fontSize: 80,
                        color: MyStyle.mainFontColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: mainScreenWidth * 0.8,
              height: 180,
              margin: const EdgeInsets.only(top: 50),
              //decoration: BoxDecoration(border: Border.all(color: Colors.white),),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 95,
                        child: IconButton(
                          onPressed: () {
                            !_isPlaying ? _start() : _pause();
                          },
                          padding: EdgeInsets.zero,
                          tooltip: 'Play',
                          icon: Icon(
                              !_isPlaying
                                  ? Icons.play_circle_outline
                                  : Icons.pause_circle_outline,
                              color: MyStyle.mainLineColor,
                              size: 90),
                        ),
                      ),
                      SizedBox(
                        width: 95,
                        child: IconButton(
                          onPressed: () {
                            _stop();
                          },
                          tooltip: 'Stop',
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.stop_circle_outlined,
                              color: MyStyle.mainLineColor, size: 90),
                        ),
                      ),
                      SizedBox(
                        width: 95,
                        child: IconButton(
                          onPressed: () {
                            _reset();
                          },
                          tooltip: 'Reset',
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.lock_reset_outlined,
                              color: MyStyle.mainLineColor, size: 90),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: mainScreenWidth * 0.7,
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {

                          },
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.save,
                              color: MyStyle.mainLineColor, size: 50),
                        ),
                        const SizedBox(width: 20,),
                        IconButton(
                          onPressed: () {

                          },
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.list_alt,
                              color: MyStyle.mainLineColor, size: 50),
                        ),
                        const SizedBox(width: 20,),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingScreen()),
                            );
                          },
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.settings,
                              color: MyStyle.mainLineColor, size: 50),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _start() {
    setState(() {
      _isPlaying = true;
      _count1 = 0;
    });
    _timer = Timer.periodic(Duration(milliseconds: (_interval * 1000).toInt()),
        (timer) {
      setState(() {
        _count1++;
        _count2++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
    setState(() {
      _isPlaying = false;
    });
  }

  void _stop() {
    _timer?.cancel();
    setState(() {
      _isPlaying = false;
    });
  }

  void _reset() {
    _getInterval();
    setState(() {
      _isPlaying = false;
      _timer?.cancel();
      _count1 = 0;
      _count2 = 0;
    });
  }
}
