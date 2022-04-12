import 'package:flutter/foundation.dart';
import 'package:flutter_application_test_swift_dynamic/model/informatiom.dart';

class InformationProvider with ChangeNotifier {
  // ตัวอย่างข้อมูล
  List<Informations> informations = [];

  // ดึงข้อมูล
  List<Informations> getTransaction() {
    return informations;
  }

  void initData() async {
    notifyListeners();
  }

  void addInformation(Informations personal) {
    informations.insert(0, personal);
    notifyListeners();
  }
}
