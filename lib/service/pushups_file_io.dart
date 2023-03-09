import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:push_ups_counter/model/pushups_model.dart';

class PushupsFileIO {
  final String _fileName = 'push-ups_log.dat';

  Future<void> save(PushupsModel model) async {
    final file = await _localFile;
    //List<Map<String, dynamic>>? jsonData;
    List? jsonData;
    try {
      if (await file.exists()) {
        String data = await file.readAsString();
        jsonData = jsonDecode(data);
      } else {
        jsonData ??= [];
      }
    } catch (e) {
      print(e.toString());
      jsonData ??= [];
    }

    jsonData?.add(model.toJson());
    //print(jsonEncode(jsonData));
    // Write the file
    file.writeAsString(jsonEncode(jsonData));
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    //print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  Future<List<PushupsModel>> load() async {
    final file = await _localFile;
    List? jsonData;
    try {
      if (await file.exists()) {
        String data = await file.readAsString();
        jsonData = jsonDecode(data);
      } else {
        jsonData ??= [];
      }
    } catch (e) {
      print(e.toString());
      jsonData ??= [];
    }

    try {
      //print('jsonData.length: ${jsonData?.length}');
      List<PushupsModel> historyList = [];
      for (int i = 0; i < jsonData!.length; i++) {
        PushupsModel data = PushupsModel.fromJson(jsonData[i]);
        historyList.add(data);
      }
      return historyList;
    } catch(e) {
      print(e);
      throw e;
    }
  }

}

