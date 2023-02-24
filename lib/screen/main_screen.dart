import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final double mainScreenWidth = MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
      backgroundColor: mainBackgroundColor,
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
                  border: Border.all(width: 2, color: mainLineColor)),
              child: Text(
                'Push-ups counter',
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: mainFontColor,
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
                        //left: BorderSide(color: mainLineColor, width: 2),
                        right: BorderSide(color: mainLineColor, width: 1),
                      ),
                    ),
                    child: Text(
                      '11',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                        fontSize: 80,
                        color: mainFontColor,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(color: mainLineColor, width: 2),
                        //right: BorderSide(color: mainLineColor, width: 2),
                      ),
                    ),
                    child: Text(
                      '99',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.oswald(
                        fontSize: 80,
                        color: mainFontColor,
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
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          tooltip: 'Play',
                          icon: const Icon(Icons.play_circle_outline,
                              color: mainLineColor, size: 90),
                        ),
                      ),
                      SizedBox(
                        width: 95,
                        child: IconButton(
                          onPressed: () {},
                          tooltip: 'Stop',
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.stop_circle_outlined,
                              color: mainLineColor, size: 90),
                        ),
                      ),
                      SizedBox(
                        width: 95,
                        child: IconButton(
                          onPressed: () {},
                          tooltip: 'Reset',
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.lock_reset_outlined,
                              color: mainLineColor, size: 90),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: mainScreenWidth * 0.7,
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.settings,
                          color: mainLineColor, size: 50),
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
}
