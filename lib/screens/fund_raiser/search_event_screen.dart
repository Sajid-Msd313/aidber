import 'dart:async';

import 'package:aidber/data/services/events/add_event_services.dart';
import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/models/event/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../events/event_detail_screen/event_detail_view.dart';

class SearchEventScreen extends StatefulWidget {
  const SearchEventScreen({Key? key}) : super(key: key);

  @override
  State<SearchEventScreen> createState() => _SearchEventScreenState();
}

class _SearchEventScreenState extends State<SearchEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, iconTheme: IconThemeData(color: PRIMARY_COLOR),elevation: 0,),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TypeAheadTextField(
            title: "Search event",
            suggestionsCallback: (query) async {
              List<Event> event = [];

              var detail = await EventServices.searchEventByKeyword(keyword: query);
              if (detail is AllEventsModel) {
                event = detail.data?.data ?? [];
              }

              return event;
            },
            onSuggestionSelected:(event){
              if(event is Event){
                Get.off(() =>  EventDetailView(eventModel: event),transition: Transition.topLevel);
              }
              print(event);
            }),
      )
    );
  }
}

class TypeAheadTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final FutureOr<Iterable<dynamic>> Function(String) suggestionsCallback;
  final Function(dynamic) onSuggestionSelected;
  final Widget? trailingWidget;

  const TypeAheadTextField({
    required this.title,
    required this.suggestionsCallback,
    required this.onSuggestionSelected,
    this.controller,
    this.trailingWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            //  Text(title, style: const TextStyle(color: Colors.black)),
              TypeAheadFormField(
                loadingBuilder: (context) {
                  return const Center(child: CircularProgressIndicator());
                },

                hideOnEmpty: true,
                hideOnLoading: true,
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Search Events by keyword",
                  ),
                  controller: controller,
                  textCapitalization: TextCapitalization.words,
                ),
                suggestionsCallback: suggestionsCallback,
                itemBuilder: (context, dynamic result) {
                  if (result != null) {
                    return ListTile(
                      title: Text(
                        result is Event ? result.title : result.title,
                      ),
                    );
                  } else {
                    return const SizedBox(width: 0, height: 0);
                  }
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: onSuggestionSelected,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter something";
                  }
                  return null;
                },
              ),
            ],
          ),

          //position icon on trailing
          Positioned(
            right: 0.0,
            top: 20.0,
            child: trailingWidget ?? Container(width: 0, height: 0),
          )
        ],
      ),
    );
  }
}