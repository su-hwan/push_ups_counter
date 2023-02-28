import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class PushupsFileIO {
  final String _fileName = 'push-ups_log.dat';

  final DateTime dateTime;
  final int count;
  final int countPerSett;

  PushupsFileIO(
      {required this.dateTime,
      required this.count,
      required this.countPerSett});

  void save() async {
    final file = await _localFile;
    String data = await file.readAsString();
    dynamic jsonData = jsonDecode(data);

    // Write the file
    //file.writeAsString('$counter');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }
}
