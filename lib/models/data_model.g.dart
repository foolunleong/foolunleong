// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TodoModel',
      json,
      ($checkedConvert) {
        final val = TodoModel(
          id: $checkedConvert('id', (v) => v as int),
          title: $checkedConvert('title', (v) => v as String),
          status: $checkedConvert('status', (v) => v as int),
          completed: $checkedConvert('completed', (v) => v as bool),
          startDate: $checkedConvert('start_date',
              (v) => v != null ? DateTime.parse(v as String) : null),
          endDate: $checkedConvert('end_date',
              (v) => v != null ? DateTime.parse(v as String) : null),
          timeLeft: $checkedConvert('time_left', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {
        'title': 'title',
        'status': 'status',
      },
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'completed': instance.completed,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'time_left': instance.timeLeft,
    };
