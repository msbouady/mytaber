import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mytaber/service/recap/storage.dart';
import 'package:mytaber/utils/palette.dart';

class StorageController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  var bonouflaData = <Map<String, dynamic>>[].obs;
  var angreData = <Map<String, dynamic>>[].obs;
  var yopougonData = <Map<String, dynamic>>[].obs;
  var sikensiData = <Map<String, dynamic>>[].obs;
  var adiakeData = <Map<String, dynamic>>[].obs;
  var gonzagueData = <Map<String, dynamic>>[].obs;
  var inviteData = <Map<String, dynamic>>[].obs;
  var portBouetData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData() async {
    bonouflaData.value = await _firebaseService.getBonouflaData();
    debugPrint('bonoufla :$bonouflaData');

    angreData.value = await _firebaseService.getAngreData();
    debugPrint('angre :$angreData');

    yopougonData.value = await _firebaseService.getYopougonData();
    debugPrint('yopougon :$yopougonData');

    sikensiData.value = await _firebaseService.getSikensiData();
    debugPrint('sikensi :$sikensiData');

    adiakeData.value = await _firebaseService.getAdiakeData();
    debugPrint('adiake :$adiakeData');

    gonzagueData.value = await _firebaseService.getGonzagueData();
    debugPrint('gonzague :$gonzagueData');

    inviteData.value = await _firebaseService.getInviteData();
    debugPrint('invite :$inviteData');

    portBouetData.value = await _firebaseService.getPortBouetData();
    debugPrint('portbouet :$portBouetData');
  }

  int getTotalParticipants() {
    return _getTotalParticipants(bonouflaData) +
        _getTotalParticipants(angreData) +
        _getTotalParticipants(yopougonData) +
        _getTotalParticipants(sikensiData) +
        _getTotalParticipants(adiakeData) +
        _getTotalParticipants(gonzagueData) +
        _getTotalParticipants(inviteData) +
        _getTotalParticipants(portBouetData);
  }

  int _getTotalParticipants(List<Map<String, dynamic>> data) {
    return data.fold(0, (sum, item) => sum + item['participant'] as int);
  }

  List<PieChartSectionData> getPieChartData() {
    final totalParticipants = getTotalParticipants();
    final bonouflaParticipants = _getTotalParticipants(bonouflaData);
    final angreParticipants = _getTotalParticipants(angreData);
    final yopougonParticipants = _getTotalParticipants(yopougonData);
    final sikensiParticipants = _getTotalParticipants(sikensiData);
    final adiakeParticipants = _getTotalParticipants(adiakeData);
    final gonzagueParticipants = _getTotalParticipants(gonzagueData);
    final inviteParticipants = _getTotalParticipants(inviteData);
    final portBouetParticipants = _getTotalParticipants(portBouetData);

    return [
      PieChartSectionData(
        color: primaryColor,
        value: (bonouflaParticipants / totalParticipants) * 100,
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: const Color(0xFF26E5FF),
        value: (angreParticipants / totalParticipants) * 100,
        showTitle: false,
        radius: 22,
      ),
      PieChartSectionData(
        color: const Color(0xFFFFCF26),
        value: (yopougonParticipants / totalParticipants) * 100,
        showTitle: false,
        radius: 19,
      ),
      PieChartSectionData(
        color: const Color(0xFFEE2727),
        value: (sikensiParticipants / totalParticipants) * 100,
        showTitle: false,
        radius: 16,
      ),
      PieChartSectionData(
        color: const Color(0xFF8BC34A),
        value: (adiakeParticipants / totalParticipants) * 100,
        showTitle: false,
        radius: 13,
      ),
      PieChartSectionData(
        color: const Color(0xFF673AB7),
        value: (gonzagueParticipants / totalParticipants) * 100,
        showTitle: false,
        radius: 10,
      ),
      PieChartSectionData(
        color: const Color(0xFFFF5722),
        value: (inviteParticipants / totalParticipants) * 100,
        showTitle: false,
        radius: 7,
      ),
      PieChartSectionData(
        color: const Color(0xFF03A9F4),
        value: (portBouetParticipants / totalParticipants) * 100,
        showTitle: false,
        radius: 4,
      ),
    ];
  }
}
