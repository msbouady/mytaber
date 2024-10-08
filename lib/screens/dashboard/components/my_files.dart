import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytaber/controllers/recap/multi_collection_controller.dart';
import 'package:mytaber/models/my_files.dart';
import 'package:mytaber/responsive.dart';
import 'package:mytaber/utils/palette.dart';
import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final MultiCollectionController controller =
        Get.put(MultiCollectionController());

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mon tableau de bord",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add New"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Obx(() {
          if (controller.totals.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Responsive(
            mobile: FileInfoCardGridView(
              crossAxisCount: _size.width < 650 ? 2 : 4,
              childAspectRatio: _size.width < 650 ? 1.3 : 1,
              totals: controller.totals,
            ),
            tablet: FileInfoCardGridView(
              totals: controller.totals,
            ),
            desktop: FileInfoCardGridView(
              childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
              totals: controller.totals,
            ),
          );
        }),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
    required this.totals,
  });

  final int crossAxisCount;
  final double childAspectRatio;
  final Map<int, Map<String, int>> totals;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: totals.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        final id = totals.keys.elementAt(index);
        final data = totals[id]!;
        return FileInfoCard(
          info: CloudStorageInfo(
            title: "Jour $id (bilan)",
            numOfFiles: data['participant']!,
            svgSrc: "assets/icons/Documents.svg",
            totalStorage: data['effectif']!.toString(),
            color: primaryColor,
            percentage:
                (data['participant']! / data['effectif']! * 100).toInt(),
          ),
        );
      },
    );
  }
}
