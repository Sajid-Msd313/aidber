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

  List<Event> allEvents = [];

  fetchAllEvents() async {
    isLoading = true;
    var detail = await EventServices.getAllEvents();
    isLoading = false;
    if (detail is AllEventsModel) {
      allEvents = detail.data?.data ?? [];
    }
    update();
  }

  void addLocally(Event event) {
    allEvents.insert(0, event);
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}