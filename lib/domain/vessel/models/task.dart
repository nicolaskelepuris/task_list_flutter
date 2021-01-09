import 'package:get/get.dart';
import 'package:task_list_app/domain/core/enums/task_status.dart';
import 'package:task_list_app/domain/core/enums/whent_to_complete.dart';
import 'package:task_list_app/domain/core/utils/enum.util.dart';
import 'package:task_list_app/infrastructure/dal/services/data/task.data.dart';

class Task {
  RxInt id;
  RxString name;
  RxString description;
  Rx<DateTime> deadline;
  Rx<TaskStatus> status;
  Rx<WhenToComplete> whenToComplete;
  RxInt appointmentId;

  factory Task.fromData({TaskData data}) {
    return Task(
      id: data.id.obs,
      name: data.name.obs,
      description: data.description.obs,
      deadline: data.deadline.obs,
      status: TaskStatus.values[data.status].obs,
      whenToComplete: WhenToComplete.values[data.whenToComplete].obs,
      appointmentId: data.appointmentId.obs,
    );
  }

  Task({
    this.id,
    this.name,
    this.description,
    this.deadline,
    this.status,
    this.whenToComplete,
    this.appointmentId,
  });

  factory Task.blank() {
    return Task(
      name: ''.obs,
      description: ''.obs,
      deadline: DateTime.utc(1970, 1, 1).obs,
      status: Rx<TaskStatus>(TaskStatus.toDo),
      whenToComplete: Rx<WhenToComplete>(WhenToComplete.beforeVesselArrival),
      appointmentId: RxInt(),
    );
  }

  Task clone() {
    return Task(
      id: id?.value?.obs,
      name: name?.value?.obs,
      description: description?.value?.obs,
      deadline: deadline?.value?.obs,
      status: status?.value?.obs ?? Rx<TaskStatus>(),
      whenToComplete: whenToComplete?.value?.obs ?? Rx<WhenToComplete>(WhenToComplete.beforeVesselArrival),
      appointmentId: appointmentId?.value?.obs,
    );
  }

  String get taskStatus => EnumUtil.taskStatusToString(this.status.value);
  String get taskWhenToComplete =>
      EnumUtil.taskWhenToCompleteToString(this.whenToComplete.value);
}
