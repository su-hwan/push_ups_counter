import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:push_ups_counter/config/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  FocusNode textFocus = FocusNode();
  final TextEditingController _intervalInputController =
      TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();

    _prefs
        .then((SharedPreferences prefs) =>
            prefs.getDouble('push-ups.interval') ?? 0.0)
        .then((double interval) {
      print('interval : $interval');
      if (interval == 0) {
        _intervalInputController.text = '1';
      } else if (interval % 1 != 0) {
        _intervalInputController.text = interval.toString();
      } else {
        _intervalInputController.text = interval.toInt().toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double mainScreenWidth = MediaQuery.of(context).size.width * 0.95;

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
            //print('onTap............');
            //FocusScope.of(context).unfocus();
            textFocus.unfocus();
          },
          child: Center(
            child: Container(
              width: mainScreenWidth * 0.90,
              //height: 120,
              padding: const EdgeInsets.only(right: 30),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.black54, width: 0),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                          // onChanged: (val) {
                          //   print(val);
                          // },
                          controller: _intervalInputController,
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
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_intervalInputController.text == '') return;
                        _prefs.then((SharedPreferences prefs) {
                          prefs.setDouble('push-ups.interval',
                              double.parse(_intervalInputController.text));
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Saved count interval')),
                        );
                      },
                      icon: const Icon(Icons.save),
                      label: const Text('Save'),
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
