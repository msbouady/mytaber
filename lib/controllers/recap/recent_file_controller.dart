import 'package:get/get.dart';
import 'package:mytaber/service/recap/recent_files_services.dart';

class RecentFileController extends GetxController {
  final RecentFileService _service = RecentFileService();

  var recentFiles = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecentFiles();
  }

  Future<void> fetchRecentFiles() async {
    try {
      List<Map<String, dynamic>> results = await _service.getRecentFiles();
      recentFiles.value = results;
      print('Fetched recent files: $results'); // Ajoutez ce log
    } catch (e) {
      print('Error fetching recent files: $e');
    }
  }
}
