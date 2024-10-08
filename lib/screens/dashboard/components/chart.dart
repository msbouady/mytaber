import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytaber/controllers/recap/storage_controller.dart';
import 'package:mytaber/utils/palette.dart';

class Chart extends StatelessWidget {
  final int totalParticipant;

  const Chart({
    super.key,
    required this.totalParticipant,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StorageController>();

    return Obx(() {
      final pieChartData = controller.getPieChartData();

      return SizedBox(
        height: 200,
        child: Stack(
          children: [
            PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 70,
                startDegreeOffset: -90,
                sections: pieChartData,
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: defaultPadding),
                  Text(
                    "$totalParticipant",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: 0.5,
                        ),
                  ),
                  const Text("personnes")
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
