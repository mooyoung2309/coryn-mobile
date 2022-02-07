import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/utils/coryn_size.dart';
import 'package:mobile/pages/calendar/controllers/calendar_controller.dart';
import 'package:mobile/pages/calendar/calendar_view.dart';
import 'package:mobile/pages/calendar/calendar_modal.dart';
import 'package:mobile/pages/ad_banner.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final _corynCalendarController = Get.put(CorynCalendarController());
  final _corynCalendarModalController = Get.put(CorynCalendarModalController());

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<CorynCalendarModalController>(
          builder: (_) => Stack(
            children: [
              Column(
                children: [
                  // 캘린더
                  Container(
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          CorynSize.calendarPageHorizontal,
                          CorynSize.pageVertical,
                          CorynSize.calendarPageHorizontal,
                          0.0,
                        ),
                        child: CoinCalendar(),
                      ),
                    ),
                  ),
                ],
              ),
              if (_.isClick)
                GestureDetector(
                  onTap: () => _.updateClick(),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Color(0x40000000),
                  ),
                ),
              if (_.isClick) CoinCalendarModal(),
            ],
          ),
        ));
  }
}
