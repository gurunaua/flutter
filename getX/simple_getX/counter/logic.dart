import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CounterLogic extends GetxController {
  var count  = 0.obs;
  final datacount = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
     if(datacount!=null && datacount.read("default_count")!=null){
       count = datacount.read("default_count");
     }
     update();
  }

  void increment(){
    count ++;
    // update();

    datacount.write("default_count", count);
  }

  void downCrement(){
    count --;
    // update();
    datacount.write("default_count", count);
  }
}
