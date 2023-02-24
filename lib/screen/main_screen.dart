import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const Color mainBackgroundColor = Color(0xff00a989);
const Color mainLineColor = Color(0xff5ed3c0);
const Color mainLineColor2 = Color(0xff33bb9f);
const Color mainFontColor = Color(0xffffffff);

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: Container(
        margin: const EdgeInsets.only(top: 70),
        child: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: mainLineColor)),
                child: const Text(
                  'Push-ups counter',
                  style: TextStyle(fontSize: 16, color: mainFontColor),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.check_circle_outline_rounded,
                    color: mainLineColor, size: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
