import 'package:etiqa/models/_base_model.dart';

part 'data_model.g.dart';

class TodoModel {
  int? id;
  String? title;
  int? status;
  bool? completed;
  DateTime? startDate;
  DateTime? endDate;
  int? timeLeft;

  TodoModel({
    this.id,
    this.title,
    this.status,
    this.completed,
    this.startDate,
    this.endDate,
    this.timeLeft,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  factory TodoModel.fromMap(Map<String, dynamic> objectMap) {
    Map<String, dynamic> parsedObjectMap = <String, dynamic>{};
    objectMap.forEach((key, value) {
      parsedObjectMap[key] =
          value is DateTime ? value.toIso8601String() : value;
    });
    return TodoModel.fromJson(parsedObjectMap);
  }

  Map<String, dynamic> toMap() => toJson().mapper();
}

List<TodoModel> dataTodo = [
  TodoModel(
      id: 1,
      title: 'Automated Testing Script',
      status: 1,
      completed: false,
      startDate: DateTime(2023, 2, 20),
      endDate: DateTime(2023, 3, 28),
      timeLeft: 200),
  TodoModel(
      id: 2,
      title: 'Automated Production',
      status: 1,
      completed: true,
      startDate: DateTime(2023, 2, 20),
      endDate: DateTime(2023, 3, 15),
      timeLeft: 200)
];
