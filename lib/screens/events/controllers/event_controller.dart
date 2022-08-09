import 'package:aidber/models/event/event_model.dart';
import 'package:get/get.dart';

import '../../../data/services/events/add_event_services.dart';

class EventController extends GetxController {

  @override
  onReady(){
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
  fetchUpCommingEvents()async {

  }

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


class EventUpCommingController extends GetxController {

  @override
  onReady(){
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