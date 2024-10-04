import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo2/createTaskPage/createTaskName.dart';
import 'package:todo2/db/drift_database.dart';
import 'package:drift/drift.dart' as drift;

class CreateTaskPage extends StatefulWidget {
  final Function(String taskName, String subject, String? timeHour,
      String? timeMinute, String? timeAmOrPm, String? description) onCreate;
  final Function(String taskName, String subject, String? timeHour,
      String? timeMinute, String? timeAmOrPm, String? description)? onUpdate;
  final Task? existingTask;

  const CreateTaskPage({
    super.key,
    required this.onCreate,
    this.onUpdate,
    this.existingTask,
  });

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _titleController = TextEditingController();
  final _subjectController = TextEditingController();
  final _timeHourController = TextEditingController();
  final _timeMinuteController = TextEditingController();
  final _timeAmOrPmController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _isTimeEnabled = false;
  bool _isOptionalDescriptionCheckboxChecked = false;

  String _selectedSubject = '';
  int _hour = 1;
  int _minute = 0;
  String _period = 'AM';

  @override
  void initState() {
    super.initState();
    if (widget.existingTask != null) {
      _titleController.text = widget.existingTask!.taskName;
      _selectedSubject = widget.existingTask!.subject;
      if (widget.existingTask!.timeHour != null &&
          widget.existingTask!.timeMinute != null &&
          widget.existingTask!.timeAmOrPm != null) {
        _isTimeEnabled = true;
        _hour = int.parse(widget.existingTask!.timeHour!);
        _minute = int.parse(widget.existingTask!.timeMinute!);
        _period = widget.existingTask!.timeAmOrPm!;
      }
      // _hour = int.parse(widget.existingTask!.timeHour ?? '1');
      // _minute = int.parse(widget.existingTask!.timeMinute ?? '0');
      // _period = widget.existingTask!.timeAmOrPm ?? 'AM';
      if (widget.existingTask!.description != null) {
        _isOptionalDescriptionCheckboxChecked = true;
        _descriptionController.text = widget.existingTask!.description!;
      }
    }
  }

  void _saveTask() {
    final taskName = _titleController.text.trim();
    final subject = _selectedSubject;
    final timeHour = _isTimeEnabled ? _hour.toString() : null;
    final timeMinute = _isTimeEnabled ? _minute.toString() : null;
    final timeAmOrPm = _isTimeEnabled ? _period : null;
    final description = _descriptionController.text.trim().isNotEmpty
        ? _descriptionController.text.trim()
        : null;

    if (taskName.isEmpty || subject.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task name and subject cannot be empty!')),
      );
      return;
    }

    final taskCompanion = TasksCompanion(
      taskName: drift.Value(taskName),
      subject: drift.Value(subject),
      timeHour:
          timeHour != null ? drift.Value(timeHour) : const drift.Value.absent(),
      timeMinute: timeMinute != null
          ? drift.Value(timeMinute)
          : const drift.Value.absent(),
      timeAmOrPm: timeAmOrPm != null
          ? drift.Value(timeAmOrPm)
          : const drift.Value.absent(),
      description: description != null
          ? drift.Value(description)
          : const drift.Value.absent(),
    );

    _insertTask(taskCompanion);
  }

  Future<void> _insertTask(TasksCompanion task) async {
    final appDatabase = Provider.of<AppDatabase>(context, listen: false);
    if (task.taskName.value.isEmpty || task.subject.value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task name and subject cannot be empty!')),
      );
      return;
    }
    await appDatabase.into(appDatabase.tasks).insert(task);

    Navigator.pop(context);
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _hour = picked.hour;
        _minute = picked.minute;
        _period = picked.hour >= 12 ? 'PM' : 'AM';
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subjectController.dispose();
    _timeHourController.dispose();
    _timeMinuteController.dispose();
    _timeAmOrPmController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> _subjects = [
    {
      'label': 'Work',
      'color': const Color.fromARGB(107, 234, 46, 32),
      'borderColor': const Color.fromARGB(255, 234, 46, 32),
      'textColor': const Color.fromARGB(255, 85, 7, 2)
    },
    {
      'label': 'Study',
      'color': const Color.fromARGB(107, 245, 104, 10),
      'borderColor': const Color.fromARGB(161, 148, 61, 3),
      'textColor': const Color.fromARGB(255, 93, 40, 4)
    },
    {
      'label': 'Personal',
      'color': const Color.fromARGB(107, 179, 96, 247),
      'borderColor': const Color.fromARGB(138, 60, 4, 105),
      'textColor': const Color.fromARGB(255, 60, 4, 105)
    },
    {
      'label': 'Health',
      'color': const Color.fromARGB(107, 4, 225, 89),
      'borderColor': const Color.fromARGB(251, 2, 115, 45),
      'textColor': const Color.fromARGB(255, 5, 62, 2)
    },
    {
      'label': 'Home',
      'color': const Color.fromARGB(107, 252, 64, 243),
      'borderColor': const Color.fromARGB(137, 113, 19, 108),
      'textColor': const Color.fromARGB(255, 109, 19, 104)
    },
    {
      'label': 'Self-Care',
      'color': const Color.fromARGB(104, 21, 237, 14),
      'borderColor': const Color.fromARGB(139, 15, 108, 11),
      'textColor': const Color.fromARGB(255, 14, 108, 11)
    },
    {
      'label': 'Social',
      'color': const Color.fromARGB(131, 237, 226, 14),
      'borderColor': const Color.fromARGB(197, 144, 138, 9),
      'textColor': const Color.fromARGB(255, 83, 79, 2)
    },
    {
      'label': 'Shopping',
      'color': const Color.fromARGB(88, 14, 237, 207),
      'borderColor': const Color.fromARGB(126, 7, 99, 87),
      'textColor': const Color.fromARGB(255, 10, 79, 70)
    },
    {
      'label': 'Entertainment',
      'color': const Color.fromARGB(129, 13, 10, 227),
      'borderColor': const Color.fromARGB(197, 12, 11, 104),
      'textColor': const Color.fromARGB(197, 12, 11, 104)
    },
    {
      'label': 'Other',
      'color': const Color.fromARGB(107, 64, 208, 252),
      'borderColor': const Color.fromARGB(144, 23, 75, 91),
      'textColor': const Color.fromARGB(255, 7, 46, 58)
    },
  ];

  void _toggleSubjectSelection(String subject) {
    setState(() {
      _selectedSubject = subject;
    });
  }

  void _incrementHour() {
    setState(() {
      _hour = (_hour % 12) + 1;
    });
  }

  void _decrementHour() {
    setState(() {
      _hour = _hour == 1 ? 12 : _hour - 1;
    });
  }

  void _incrementMinute() {
    setState(() {
      _minute = (_minute + 1) % 60;
    });
  }

  void _decrementMinute() {
    setState(() {
      _minute = _minute == 0 ? 59 : _minute - 1;
    });
  }

  void _togglePeriod(String? value) {
    if (value != null) {
      setState(() {
        _period = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existingTask != null;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 206, 223, 1),
      appBar: AppBar(
        shape: const Border(
            bottom:
                BorderSide(color: Color.fromRGBO(135, 92, 206, 1), width: 2)),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(135, 92, 206, 1),
          size: 35,
          shadows: [Shadow(blurRadius: 3, color: Colors.black)],
        ),
        backgroundColor: const Color.fromRGBO(255, 120, 196, 1),
        title: Text(
          isEditing ? 'Edit Task' : 'Create Task',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(blurRadius: 10, color: Color.fromRGBO(255, 62, 165, 1))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 232, 238, 1),
              border: Border.all(
                color: const Color.fromRGBO(255, 120, 196, 1),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 1000,
            width: 360,
            margin: const EdgeInsets.only(top: 40, left: 16, right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createTaskName(titleController: _titleController),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Icon(
                      Icons.subject,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Subject:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                /// subject selection
                Wrap(
                  spacing: 5,
                  runSpacing: 8,
                  children: _subjects.map((subject) {
                    bool isSelected = _selectedSubject == subject['label'];
                    return GestureDetector(
                      onTap: () => _toggleSubjectSelection(subject['label']),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? subject['color']
                              : const Color.fromARGB(85, 158, 158, 158),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 2,
                            color: isSelected
                                ? subject['borderColor']
                                : Colors.grey,
                          ),
                        ),
                        child: Text(
                          subject['label'],
                          style: TextStyle(
                            color: isSelected
                                ? subject['textColor']
                                : const Color.fromARGB(255, 43, 43, 43),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                /// Time Selection
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _isTimeEnabled,
                          onChanged: (value) {
                            setState(() {
                              _isTimeEnabled = value!;
                            });
                          },
                        ),
                        const Text(
                          'Add Time',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // Time selection UI
                    if (_isTimeEnabled)
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Hour
                              Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.arrow_drop_up),
                                    onPressed: _incrementHour,
                                  ),
                                  Text(
                                    _hour.toString().padLeft(2, '0'),
                                    style: const TextStyle(fontSize: 32),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onPressed: _decrementHour,
                                  ),
                                ],
                              ),
                              const Text(
                                ' : ',
                                style: TextStyle(fontSize: 32),
                              ),
                              // Minute
                              Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.arrow_drop_up),
                                    onPressed: _incrementMinute,
                                  ),
                                  Text(
                                    _minute.toString().padLeft(2, '0'),
                                    style: const TextStyle(fontSize: 32),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onPressed: _decrementMinute,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  DropdownButton<String>(
                                    value: _period,
                                    items: ['AM', 'PM'].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: _togglePeriod,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                /// optional description
                Row(
                  children: [
                    Checkbox(
                      value: _isOptionalDescriptionCheckboxChecked,
                      onChanged: (value) {
                        setState(() {
                          _isOptionalDescriptionCheckboxChecked = value!;
                        });
                      },
                    ),
                    const Text(
                      'Description',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                if (_isOptionalDescriptionCheckboxChecked)
                  TextField(
                    maxLines: _isOptionalDescriptionCheckboxChecked ? 2 : null,
                    enabled: _isOptionalDescriptionCheckboxChecked,
                    controller: _descriptionController,
                    cursorColor: Colors.amber,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(120, 71, 164, 1)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _saveTask,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color.fromRGBO(255, 120, 196, 1),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(isEditing ? 'Update Task' : 'Create Task'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}