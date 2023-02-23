import 'package:etiqa/features/add_card/add_cart.dart';
import 'package:etiqa/models/data_model.dart';
import 'package:etiqa/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

String formatDate(DateTime val) {
  DateFormat formatter = DateFormat('dd MMM yyyy');
  String outputDate = formatter.format(val);
  return outputDate;
}

String calTotalClock(DateTime startTime, DateTime endTime) {
  startTime = DateTime.now();
  double totalTime =
      (startTime.day + (startTime.hour / 24) + (startTime.minute / 60)) -
          (endTime.day + (endTime.hour / 24) + (endTime.minute / 60));
  int days = totalTime.floor();
  int hours = ((totalTime - totalTime.floorToDouble()) * 24).round();
  int minuts = ((totalTime - totalTime.floorToDouble()) * 60).round();
  return (days == 0)
      ? (hours == 0)
          ? '$minuts min'
          : (minuts == 0)
              ? '$hours hr'
              : '$hours hr $minuts min'
      : '${days.toString().replaceAll('-', '')} day $hours hr $minuts min';
}

class LandingScreen extends StatefulWidget {
  static const routeName = '/home';

  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'To-Do List',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
          child: Consumer<UserProvider>(builder: (context, val, child) {
        return SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: val.datas.length,
              itemBuilder: (context, index) =>
                  detailCard(val.datas[index], val)),
        );
      })),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber[900],
          child: const Icon(Icons.add),
          onPressed: () => Provider.of<UserProvider>(context, listen: false)
              .createCard(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget detailCard(TodoModel data, UserProvider val) {
    return InkWell(
      onTap: () => Provider.of<UserProvider>(context, listen: false)
          .openDetail(context, data.id!),
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Text(
                data.title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  displayDate('Start Date', data.startDate!),
                  displayDate('End Date', data.endDate!),
                  timeLeftDisplay(data),
                ],
              ),
            ),
            Container(
              color: Colors.brown[100],
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.brown[400],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data.completed == true ? "Complete" : "Incomplete",
                          style: const TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("Tick if completed",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[600])),
                      Checkbox(
                          value: data.completed,
                          onChanged: (e) {
                            setState(() {
                              val.completedCheck(e, data.id!);
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column timeLeftDisplay(TodoModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Time Left',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          calTotalClock(data.startDate!, data.endDate!),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        )
      ],
    );
  }

  Column displayDate(String label, DateTime date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          formatDate(date),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        )
      ],
    );
  }
}
