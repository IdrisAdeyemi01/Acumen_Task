import 'package:acumen_task/src/content/utilities/base_change_notifiers.dart';
import 'package:acumen_task/src/features/dashboard/model/dog_walkers_model.dart';
import 'package:acumen_task/src/features/dashboard/model/mock_json_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardNotier extends BaseChangeNotifier {
  List<DogWalkers> getDogWalkers() {
    List<DogWalkers> dogWalkers = [];
    for (var walker in mockJson) {
      DogWalkers dogWalker = DogWalkers.fromMap(walker);
      dogWalkers.add(dogWalker);
    }
    return dogWalkers;
  }
}

final dashboardProvider = Provider<DashboardNotier>(
  (ref) => DashboardNotier(),
);
