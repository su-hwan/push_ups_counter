import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:push_ups_counter/config/values.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double countInterval = 1.0;
  FocusNode textFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final double mainScreenWidth = MediaQuery.of(context).size.width * 0.95;
    final intervalInputController = TextEditingController(text: countInterval.toString());

    return Scaffold(
        //backgroundColor: MyStyle.mainBackgroundColor,
        appBar: AppBar(
          backgroundColor: MyStyle.mainBackgroundColor,
          title: Text(
            'Settings',
            style: GoogleFonts.montserrat(),
          ),
          leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: GestureDetector(
          onTap: () {
            //FocusScope.of(context).unfocus();
            textFocus.unfocus();
          },
          child: Center(
            child: Container(
              width: mainScreenWidth * 0.90,
              height: 120,
              padding: const EdgeInsets.only(right: 30),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.black54, width: 0),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.access_time,
                              color: MyStyle.mainBackgroundColor),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 200,
                            height: 20,
                            child: Text(
                              'count interval(per second)',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 70,
                        height: 30,
                        child: TextField(
                          onChanged: (val) {
                            print(val);
                          },
                          controller: intervalInputController,
                          maxLength: 5,
                          textAlign: TextAlign.center,
                          focusNode: textFocus,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: false, decimal: true),
                          //55style: ,
                          decoration: const InputDecoration(
                            counterText: '',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: MyStyle.mainBackgroundColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: MyStyle.mainBackgroundColor),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: MyStyle.mainBackgroundColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (intervalInputController.text == null) return;
                        double interval = double.parse(intervalInputController.text);
                        print('interval : $interval');
                      },
                      icon: Icon(Icons.save),
                      label: Text('Save'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyStyle.mainBackgroundColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
