import 'package:task_list_app/domain/core/enums/appointment_status.dart';
import 'package:task_list_app/domain/core/enums/appointment_type.dart';
import 'package:task_list_app/domain/core/enums/operation_type.dart';
import 'package:task_list_app/domain/core/enums/port.dart';
import 'package:task_list_app/domain/core/enums/task_status.dart';
import 'package:task_list_app/domain/core/enums/whent_to_complete.dart';

class EnumUtil {
  static String appointmentTypeToString(AppointmentType type) {
    switch (type) {
      case AppointmentType.consigneeAgent:
        return 'Consignee Agent';
      case AppointmentType.crewChange:
        return 'Crew Change';
      case AppointmentType.husbandryServices:
        return 'Husbandry Services';
      case AppointmentType.ownersProtectingAgent:
        return "Owner's Protecting Agent";
      default:
        return null;
    }
  }

  static String appointmentStatusToString(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.inProgress:
        return 'In Progress';
      case AppointmentStatus.done:
        return 'Done';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
      default:
        return null;
    }
  }

  static String appointmentOperationTypeToString(OperationType type) {
    switch (type) {
      case OperationType.discharge:
        return 'Discharge';
      case OperationType.loading:
        return 'Loading';
      case OperationType.others:
        return 'N/A';
      default:
        return null;
    }
  }

  static String appointmentPortToString(Port port) {
    switch (port) {
      case Port.coalTerminal:
        return 'Praia mole - Coal';
      case Port.codesaPublicQuay:
        return 'Codesa public quay';
      case Port.cpvvTerminal:
        return 'CPVV';
      case Port.ironOreTerminal:
        return "Tubarão - Iron ore";
      case Port.peiuTerminal:
        return "PEIU";
      case Port.pontaUbu:
        return "Porto de Ubu";
      case Port.portocel:
        return "PORTOCEL";
      case Port.tabrPetrobrasTerminal:
        return "TABR";
      case Port.tgl:
        return "TGL";
      case Port.tpd3:
        return "TPD 3";
      case Port.tpd4:
        return "TPD 4";
      case Port.tpsSteelProducts:
        return "TPS";
      case Port.tvvTerminal:
        return "TVV";
      default:
        return null;
    }
  }

  static String taskStatusToString(TaskStatus status) {
    switch (status) {
      case TaskStatus.toDo:
        return 'To do';
      case TaskStatus.done:
        return 'Done';
      case TaskStatus.cancelled:
        return 'Cancelled';
      default:
        return null;
    }
  }

  static String taskWhenToCompleteToString(WhenToComplete whenToComplete) {
    switch (whenToComplete) {
      case WhenToComplete.beforeVesselArrival:
        return 'Before arrival';
      case WhenToComplete.duringVesselBerthing:
        return 'During berthing';
      case WhenToComplete.afterVesselSailed:
        return 'After sailing';
      default:
        return null;
    }
  }
}
