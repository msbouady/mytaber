import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytaber/controllers/recap/storage_controller.dart';
import 'package:mytaber/utils/palette.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StorageController());

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recap FDT - Edition 2024",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: defaultPadding),
          Obx(() {
            final total = controller.getTotalParticipants();
            return Chart(totalParticipant: total);
          }),
          const SizedBox(height: defaultPadding),
          Obx(() {
            final bonouflaData = controller.bonouflaData;
            final totalParticipants = bonouflaData.fold<int>(
                0, (sum, item) => sum + (item['participant'] as int));
            return StorageInfoCard(
              svgSrc: "assets/icons/folder.svg",
              title: "Bonoufla",
              amountOfFiles: totalParticipants.toString(),
              numOfFiles: bonouflaData.length,
            );
          }),
          Obx(() {
            final angreData = controller.angreData;
            final totalParticipants = angreData.fold<int>(
                0, (sum, item) => sum + (item['participant'] as int));
            return StorageInfoCard(
              svgSrc: "assets/icons/folder.svg",
              title: "Angre",
              amountOfFiles: totalParticipants.toString(),
              numOfFiles: angreData.length,
            );
          }),
          Obx(() {
            final yopougonData = controller.yopougonData;
            final totalParticipants = yopougonData.fold<int>(
                0, (sum, item) => sum + (item['participant'] as int));
            return StorageInfoCard(
              svgSrc: "assets/icons/folder.svg",
              title: "Yopougon",
              amountOfFiles: totalParticipants.toString(),
              numOfFiles: yopougonData.length,
            );
          }),
          Obx(() {
            final sikensiData = controller.sikensiData;
            final totalParticipants = sikensiData.fold<int>(
                0, (sum, item) => sum + (item['participant'] as int));
            return StorageInfoCard(
              svgSrc: "assets/icons/folder.svg",
              title: "Sikensi",
              amountOfFiles: totalParticipants.toString(),
              numOfFiles: sikensiData.length,
            );
          }),
          Obx(() {
            final adiakeData = controller.adiakeData;
            final totalParticipants = adiakeData.fold<int>(
                0, (sum, item) => sum + (item['participant'] as int));
            return StorageInfoCard(
              svgSrc: "assets/icons/folder.svg",
              title: "Adiake",
              amountOfFiles: totalParticipants.toString(),
              numOfFiles: adiakeData.length,
            );
          }),
          Obx(() {
            final gonzagueData = controller.gonzagueData;
            final totalParticipants = gonzagueData.fold<int>(
                0, (sum, item) => sum + (item['participant'] as int));
            return StorageInfoCard(
              svgSrc: "assets/icons/folder.svg",
              title: "Gonzague",
              amountOfFiles: totalParticipants.toString(),
              numOfFiles: gonzagueData.length,
            );
          }),
          Obx(() {
            final inviteData = controller.inviteData;
            final totalParticipants = inviteData.fold<int>(
                0, (sum, item) => sum + (item['participant'] as int));
            return StorageInfoCard(
              svgSrc: "assets/icons/folder.svg",
              title: "Invite",
              amountOfFiles: totalParticipants.toString(),
              numOfFiles: inviteData.length,
            );
          }),
          Obx(() {
            final portBouetData = controller.portBouetData;
            final totalParticipants = portBouetData.fold<int>(
                0, (sum, item) => sum + (item['participant'] as int));
            return StorageInfoCard(
              svgSrc: "assets/icons/folder.svg",
              title: "Port-Bouet",
              amountOfFiles: totalParticipants.toString(),
              numOfFiles: portBouetData.length,
            );
          }),
        ],
      ),
    );
  }
}
