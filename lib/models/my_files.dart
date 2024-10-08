import 'package:flutter/material.dart';
import 'package:mytaber/utils/palette.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Jour 1 (bilan)",
    numOfFiles: 132,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "200",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Jour 2 (bilan)",
    numOfFiles: 1328,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "50",
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Jour 3 (bilan)",
    numOfFiles: 28,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "30",
    color: const Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Jour 4 (bilan)",
    numOfFiles: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "40",
    color: const Color(0xFF007EE5),
    percentage: 20,
  ),
];
