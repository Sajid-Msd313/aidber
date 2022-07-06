import 'package:aidber/data/services/business/business_services.dart';
import 'package:aidber/models/business/user_business_model.dart';
import 'package:get/get.dart';

class business_mainController extends GetxController {
  @override
  onInit() {
    fetchUserBusinessAccounts();
    super.onInit();
  }
  List<BusinessItem> userBusinessAccounts = [];
  bool _isLoading = false;

 //fetch business accounts
  fetchUserBusinessAccounts()async{
    isLoading = true;
    var detail = await business_services.fetchUserBusinessAccounts();
    isLoading = false;
    if(detail is UserBusinessModel){
      userBusinessAccounts =  detail.data?.data ?? [];
    }
  }






  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}