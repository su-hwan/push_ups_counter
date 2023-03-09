import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:push_ups_counter/model/pushups_model.dart';
import 'package:push_ups_counter/service/pushups_file_io.dart';

import '../config/values.dart';

class PushupsStatisticsScreen extends StatelessWidget {
  const PushupsStatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<PushupsModel> list;
    return FutureBuilder<List<PushupsModel>>(
      future: PushupsFileIO().load(),
      builder: (context, snapshot) {
        list = snapshot.data ?? [];
        //print('list.length: ${list.length}');
        return Scaffold(
          //backgroundColor: MyStyle.mainBackgroundColor,
          appBar: AppBar(
            backgroundColor: MyStyle.mainBackgroundColor,
            title: Text(
              'Statistics',
              style: GoogleFonts.montserrat(),
            ),
            leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                PushupsModel item = list[index];
                return listItemWidget(item, context);
              },
            ),
          ),
        );
      },
    );
  }

  Widget listItemWidget(PushupsModel item, BuildContext context) {
    List countSets = item.countSets ?? [];
    String strSets = '';
    for (int i = 0; i < countSets!.length; i++) {
      strSets += countSets[i].toString();
      if (countSets.length - 1 > i) {
        strSets += ' + ';
      }
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 70,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: MyStyle.mainBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Text(
              '${item.count}',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.saveTime}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: MyStyle.mainLineColor,
                  ),
                ),
                Text(
                  strSets,
                  style: const TextStyle(
                    fontSize: 18,
                    color: MyStyle.mainBackgroundColor,
                  ),
                ),
                const Divider(
                  color: MyStyle.mainLineColor,
                  thickness: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
