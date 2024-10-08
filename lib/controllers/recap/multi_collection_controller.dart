import 'package:get/get.dart';
import 'package:mytaber/service/recap/multi_collection_service.dart';

class MultiCollectionController extends GetxController {
  final MultiCollectionService _service = MultiCollectionService();

  var totals = <int, Map<String, int>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTotals(
        [1, 2, 3, 4]); // Remplacez par les IDs que vous souhaitez récupérer
  }

  Future<void> fetchTotals(List<int> ids) async {
    try {
      Map<int, Map<String, int>> results =
          await _service.getTotalsFromMultipleCollections(ids);
      totals.value = results;
    } catch (e) {
      print('Error fetching totals: $e');
    }
  }
}
