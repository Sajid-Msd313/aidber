import 'package:aidber/models/event/event_model.dart';
import 'package:aidber/utils/utils.dart';
import 'package:get/get.dart';

import '../../../data/services/events/add_event_services.dart';

class EventController extends GetxController with EventCommonServices {
  @override
  onReady() {
    super.onReady();
    fetchAllEvents();
  }

  bool _isLoading = false;

  List<Event> myEventList = [];

  fetchAllEvents() async {
    isLoading = true;
    // var detail = await EventServices.searchEventByKeyword(keyword: "w");
    var detail = await EventServices.getAllEvents();
    isLoading = false;
    if (detail is AllEventsModel) {
      myEventList = detail.data?.data ?? [];
    }
    update();
  }

  fetchUpCommingEvents() async {}

  void addLocally(Event event) {
    myEventList.insert(0, event);
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}

class EventUpCommingController extends GetxController with EventCommonServices {
  @override
  onReady() {
    super.onReady();
    fetchUpcommingEvents();
  }

  bool _isLoading = false;

  List<Event> upcommingEventList = [];

  fetchUpcommingEvents() async {
    isLoading = true;
    // var detail = await EventServices.searchEventByKeyword(keyword: "w");
    var detail = await EventServices.getCommingThisWeekEvents();
    isLoading = false;
    if (detail is AllEventsModel) {
      upcommingEventList = detail.data?.data ?? [];
    }
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}

///Contains Common Services.
abstract class EventCommonServices {

   /// Share Event By clicking [Share ICON] button..........
  void shareEvent({required String eventId}) async {
    var detail = await EventServices.shareEventById(id: eventId);
    if (detail != null) {
      if (detail['status'] == true) {
        showSnackBarInformation(description: detail['message']);
      } else {
        show_snackBarError(title: "Couldn't share", description: detail['message']);
      }
    }
  }

  ///Attends an event by clicking [GOING] button
  void attendEventById({required String eventId}) async {
    var detail = await EventServices.attendEventById(id: eventId);
    if (detail != null) {
      if (detail['status'] == true) {
        showSnackBarInformation(description: detail['msg']);
      } else {
        show_snackBarError(title: "Couldn't share", description: detail['msg']);
      }
    }
  }
}