import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mytaber/controllers/recap/recent_file_controller.dart';
import 'package:mytaber/utils/palette.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RecentFileController controller = Get.put(RecentFileController());

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recap par Eglises",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: Obx(() {
              print(
                  'Recent files in UI: ${controller.recentFiles}'); // Ajoutez ce log
              if (controller.recentFiles.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return DataTable(
                columnSpacing: defaultPadding,
                columns: const [
                  DataColumn(
                    label: Text("Noms"),
                  ),
                  DataColumn(
                    label: Text("Date"),
                  ),
                  DataColumn(
                    label: Text("Present"),
                  ),
                ],
                rows: List.generate(
                  controller.recentFiles.length,
                  (index) => recentFileDataRow(controller.recentFiles[index]),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(Map<String, dynamic> fileInfo) {
  debugPrint('File info: $fileInfo'); // Ajoutez ce log
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo['icon'],
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo['title']),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo['date'])),
      DataCell(Text(fileInfo['size'])),
    ],
  );
}
