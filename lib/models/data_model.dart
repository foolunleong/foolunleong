// class ConstantData {
//   static
// }

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
}

List<TodoModel> dataTodo = [
  TodoModel(
      id: 1,
      title: 'Automated Testing Script',
      status: 1,
      completed: false,
      startDate: DateTime(2023, 2, 20),
      endDate: DateTime(2023, 2, 28),
      timeLeft: 200),
  TodoModel(
      id: 2,
      title: 'Automated Testing Script',
      status: 1,
      completed: true,
      startDate: DateTime(2023, 2, 20),
      endDate: DateTime(2023, 2, 28),
      timeLeft: 200)
];
