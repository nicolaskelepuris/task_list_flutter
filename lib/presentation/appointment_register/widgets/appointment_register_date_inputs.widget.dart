// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task_list_app/domain/core/enums/appointment_type.dart';
// import 'package:task_list_app/presentation/appointment_register/controllers/appointment_register.controller.dart';

// import 'date_input.widget.dart';

// class AppointmentRegisterDateInputsWidget
//     extends GetView<AppointmentRegisterController> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DateInputWidget(
//               label: 'ETA',
//               onChanged: controller.onChangeEstimatedTimeOfArrival,
//               dateInitialValue: controller.estimatedTimeOfArrival,
//             ),
//             DateInputWidget(
//               label: 'ETB',
//               onChanged: controller.onChangeEstimatedTimeOfBerthing,
//               dateInitialValue: controller.estimatedTimeOfBerthing,
//             ),
//             DateInputWidget(
//               label: 'ETS',
//               onChanged: controller.onChangeEstimatedTimeOfSailing,
//               dateInitialValue: controller.estimatedTimeOfSailing,
//             ),
//           ],
//         ),
//         SizedBox(
//           width: 40.0,
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DateInputWidget(
//               label: 'Arrival',
//               onChanged: controller.onChangeArrival,
//               dateInitialValue: controller.arrival,
//             ),
//             DateInputWidget(
//               label: 'Berthing',
//               onChanged: controller.onChangeBerthing,
//               dateInitialValue: controller.berthing,
//             ),
//             DateInputWidget(
//               label: 'Sailing',
//               onChanged: controller.onChangeSailing,
//               dateInitialValue: controller.sailing,
//             ),
//           ],
//         ),
//         Obx(() {
//           return controller.type?.value == AppointmentType.consigneeAgent
//               ? Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     DateInputWidget(
//                       label: 'ETA on 1s brazilian port',
//                       onChanged: controller.onChangeETAOnFirstBrazillianPort,
//                       dateInitialValue: controller
//                           .estimatedTimeOfArrivalOnFirstBrazillianPort,
//                     ),
//                   ],
//                 )
//               : SizedBox();
//         }),
//         Expanded(
//           child: SizedBox(),
//         ),
//       ],
//     );
//   }
// }
