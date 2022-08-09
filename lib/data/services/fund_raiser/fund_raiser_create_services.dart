import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controllers/storage_controller/storage_controller.dart';
import '../../../utils/api_urls.dart';
import '../../../utils/utils.dart';
import '../innovations/innovation_services.dart';

class FundRaiserCreateServices {
  static Future createFundRaiser({
    required OnUploadProgressCallback callback,
    required String title,
    required String fund_raiser_desc,
    required String organisation_name,
    required String amount,
    required String bank,
    required String account_number,
    required List<XFile>? images,
    required List<String>? videos,
  }) async {
    dio.Response response;
    var client = dio.Dio();

    //  print(response.data.toString());

    print(images);
    print(videos);
    var formData = dio.FormData.fromMap({
      'title': title,
      'fund_raiser_desc': fund_raiser_desc,
      'organisation_name': organisation_name,
      'amount': amount,
      'bank': bank,
      'account_number': account_number,
    });
    images?.forEach((element) async {
      formData.files.add(MapEntry(
          "image[]",
          await dio.MultipartFile.fromFile(element.path,
              contentType: MediaType("image", "jpeg"), filename: element.path.split("/").last)));

    });

    videos?.forEach((element) async {
      formData.files.add(MapEntry(
          "video[]",
          await dio.MultipartFile.fromFile(element,
              contentType: MediaType("image", "jpeg"), filename: element.split("/").last)));

    });

    print("this is fields.... ${formData.fields.toString()}");
    response = await client.post(
      ApiUrls.CREATE_FUND_RAISER,
      data: formData,
      options: dio.Options(
        method: 'POST',
        headers: {
          'x-api-key': Get.find<storage_controller>().userModel.result!.token.toString(),
        },
      ),
      onSendProgress: callback,
    );
    if (response.data != null) {
      print(response.data);
      return response.data;
    } else {
      show_snackBarError(title: "Internet Connection", description: "Please chceck your internet conenction");
      return null;
    }
  }
}