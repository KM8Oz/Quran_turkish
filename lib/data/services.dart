import 'dart:convert';

import 'package:Quran/data/models/allasmaul.dart';
import 'package:Quran/data/models/alldoa.dart';
import 'package:Quran/data/models/allsurah.dart';
import 'package:Quran/data/models/ayatkursi.dart';
import 'package:Quran/data/models/surahinfo.dart';
import 'package:flutter/services.dart';

class ServiceData {
  var infosurah = 'surah/surah-info.json';
  var listdoa = 'surah/doa-harian.json';
  var listasmaulhusna = 'surah/asmaul-husna.json';
  var ayatkursi = 'surah/ayat-kursi.json';

  Future<List<SurahInfo>> loadInfo() async {
    var response = await rootBundle.loadString(infosurah);
    Iterable data = json.decode(response);
    return data.map((model) => SurahInfo.fromJson(model)).toList();
  }

  Future<AllSurah> loadSurah(int number) async {
    final response = await rootBundle.loadString('surah/$number.json');
    var res = json.decode(response);
    var data = res['$number'];
    return AllSurah.fromJson(data);
  }

  Future<List<AllDoa>> loadDoa() async {
    var response = await rootBundle.loadString(listdoa);
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllDoa.fromJson(model)).toList();
  }

  Future<List<AllAsmaul>> loadAsmaul() async {
    var response = await rootBundle.loadString(listasmaulhusna);
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllAsmaul.fromJson(model)).toList();
  }

  Future<AyathKursi> loadAyatKursi() async {
    var response = await rootBundle.loadString(ayatkursi);
    var res = json.decode(response);
    var data = res['data'];
    return AyathKursi.fromJson(data);
  }
}
