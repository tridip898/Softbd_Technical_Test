import 'package:get/get.dart';

class CategoryController extends GetxController{
  RxInt selectedIndex=0.obs;

  changeIndex(index){
    selectedIndex.value=index;
    update();
  }
}