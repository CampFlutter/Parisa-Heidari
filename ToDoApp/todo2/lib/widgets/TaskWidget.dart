import 'package:flutter/material.dart';
import 'package:todo2/db/drift_database.dart';
import 'package:todo2/createTaskPage/CreateTaskPage.dart';

class TaskWidget extends StatefulWidget {
  final String taskName;
  final String subject;
  final String? timeHour;
  final String? timeMinute;
  final String? timeAmOrPm;
  final String? description;

  final Future<void> Function() onUpdate;
  final Future<void> Function() onDelete;

  const TaskWidget({
    super.key,
    required this.taskName,
    required this.subject,
    this.timeHour,
    this.timeMinute,
    this.timeAmOrPm,
    this.description,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isChecked = false;

  Map<String, Color> _getSubjectDetails(String subject) {
    switch (subject) {
      case 'Work':
        return {
          'color': const Color.fromARGB(107, 234, 46, 32),
          'borderColor': const Color.fromARGB(255, 234, 46, 32),
          'textColor': const Color.fromARGB(255, 85, 7, 2),
        };
      case 'Study':
        return {
          'color': const Color.fromARGB(107, 245, 104, 10),
          'borderColor': const Color.fromARGB(161, 148, 61, 3),
          'textColor': const Color.fromARGB(255, 93, 40, 4),
        };
      case 'Personal':
        return {
          'color': const Color.fromARGB(107, 179, 96, 247),
          'borderColor': const Color.fromARGB(138, 60, 4, 105),
          'textColor': const Color.fromARGB(255, 60, 4, 105),
        };
      case 'Health':
        return {
          'color': const Color.fromARGB(107, 4, 225, 89),
          'borderColor': const Color.fromARGB(251, 2, 115, 45),
          'textColor': const Color.fromARGB(255, 5, 62, 2),
        };
      case 'Home':
        return {
          'color': const Color.fromARGB(107, 252, 64, 243),
          'borderColor': const Color.fromARGB(137, 113, 19, 108),
          'textColor': const Color.fromARGB(255, 109, 19, 104),
        };
      case 'Self-Care':
        return {
          'color': const Color.fromARGB(104, 21, 237, 14),
          'borderColor': const Color.fromARGB(139, 15, 108, 11),
          'textColor': const Color.fromARGB(255, 14, 108, 11),
        };
      case 'Social':
        return {
          'color': const Color.fromARGB(131, 237, 226, 14),
          'borderColor': const Color.fromARGB(197, 144, 138, 9),
          'textColor': const Color.fromARGB(255, 83, 79, 2),
        };
      case 'Shopping':
        return {
          'color': const Color.fromARGB(88, 14, 237, 207),
          'borderColor': const Color.fromARGB(126, 7, 99, 87),
          'textColor': const Color.fromARGB(255, 10, 79, 70),
        };
      case 'Entertainment':
        return {
          'color': const Color.fromARGB(129, 13, 10, 227),
          'borderColor': const Color.fromARGB(197, 12, 11, 104),
          'textColor': const Color.fromARGB(197, 12, 11, 104),
        };
      case 'Other':
      default:
        return {
          'color': const Color.fromARGB(107, 64, 208, 252),
          'borderColor': const Color.fromARGB(144, 23, 75, 91),
          'textColor': const Color.fromARGB(255, 7, 46, 58),
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final subjectDetails = _getSubjectDetails(widget.subject);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value:
                          false,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      activeColor: const Color.fromRGBO(82, 85, 188, 1),
                      checkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Text(
                      widget.taskName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(46, 2, 73, 1),
                        shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                      ),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  onSelected: (String result) async {
                    if (result == 'Edit') {
                      widget.onUpdate();
                    } else if (result == 'Delete') {
                      widget.onDelete();
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Edit',
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            size: 20,
                            color: Color.fromRGBO(122, 28, 172, 1),
                          ),
                          SizedBox(width: 5),
                          Text('Edit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem<String>(
                      value: 'Delete',
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline_outlined,
                            size: 20,
                            color: Color.fromRGBO(122, 28, 172, 1),
                          ),
                          SizedBox(width: 5),
                          Text('Delete',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  height: 23,
                  width: 90,
                  decoration: BoxDecoration(
                    color: subjectDetails['color']!,
                    border: Border.all(
                        color: subjectDetails['borderColor']!, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.subject,
                        size: 18,
                        color: Color.fromRGBO(255, 0, 128, 1),
                      ),
                      Text(
                        widget.subject,
                        style: TextStyle(
                          color: subjectDetails['textColor']!,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                if (widget.timeHour != null &&
                    widget.timeMinute != null &&
                    widget.timeAmOrPm != null)
                  Text(
                    '${widget.timeHour}:${widget.timeMinute} ${widget.timeAmOrPm}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              height: 50,
              width: 351,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Text(
                widget.description ?? "No description",
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 96, 96, 96),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//           const SizedBox(height: 8),
//           // Display time if available
//           if (timeHour != null && timeMinute != null && timeAmOrPm != null)
//             Text(
//               '$timeHour:$timeMinute $timeAmOrPm',
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),



//                 const SizedBox(width: 15),
//                 // if (widget.time != null)
//                 //   Text(
//                 //     widget.time!,
//                 //     style: const TextStyle(
//                 //       color: Colors.purple,
//                 //       fontWeight: FontWeight.bold,
//                 //     ),
//                 //   ),
//                 Text(
//                   widget.time ?? "No time",
//                   style: const TextStyle(
//                     color: Color.fromRGBO(105, 11, 152, 1),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),




// //                   // Time
// //                   if (task.timeHour != null &&
// //                       task.timeMinute != null &&
// //                       task.timeAmOrPm != null)
// //                     Text(
// //                       '${task.timeHour}:${task.timeMinute} ${task.timeAmOrPm}',
// //                       style: const TextStyle(
// //                         color: Colors.purple,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                 ],
// //               ),
// //             ),