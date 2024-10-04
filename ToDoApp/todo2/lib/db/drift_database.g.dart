// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _surNameMeta =
      const VerificationMeta('surName');
  @override
  late final GeneratedColumn<String> surName = GeneratedColumn<String>(
      'sur_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 80),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, surName, email, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sur_name')) {
      context.handle(_surNameMeta,
          surName.isAcceptableOrUnknown(data['sur_name']!, _surNameMeta));
    } else if (isInserting) {
      context.missing(_surNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      surName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sur_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String surName;
  final String email;
  final String password;
  const User(
      {required this.id,
      required this.name,
      required this.surName,
      required this.email,
      required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sur_name'] = Variable<String>(surName);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      surName: Value(surName),
      email: Value(email),
      password: Value(password),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      surName: serializer.fromJson<String>(json['surName']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'surName': serializer.toJson<String>(surName),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  User copyWith(
          {int? id,
          String? name,
          String? surName,
          String? email,
          String? password}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        surName: surName ?? this.surName,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      surName: data.surName.present ? data.surName.value : this.surName,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('surName: $surName, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, surName, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.surName == this.surName &&
          other.email == this.email &&
          other.password == this.password);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> surName;
  final Value<String> email;
  final Value<String> password;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.surName = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String surName,
    required String email,
    required String password,
  })  : name = Value(name),
        surName = Value(surName),
        email = Value(email),
        password = Value(password);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? surName,
    Expression<String>? email,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (surName != null) 'sur_name': surName,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? surName,
      Value<String>? email,
      Value<String>? password}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      surName: surName ?? this.surName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (surName.present) {
      map['sur_name'] = Variable<String>(surName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('surName: $surName, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskNameMeta =
      const VerificationMeta('taskName');
  @override
  late final GeneratedColumn<String> taskName = GeneratedColumn<String>(
      'task_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeHourMeta =
      const VerificationMeta('timeHour');
  @override
  late final GeneratedColumn<String> timeHour = GeneratedColumn<String>(
      'time_hour', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timeMinuteMeta =
      const VerificationMeta('timeMinute');
  @override
  late final GeneratedColumn<String> timeMinute = GeneratedColumn<String>(
      'time_minute', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timeAmOrPmMeta =
      const VerificationMeta('timeAmOrPm');
  @override
  late final GeneratedColumn<String> timeAmOrPm = GeneratedColumn<String>(
      'time_am_or_pm', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, taskName, subject, timeHour, timeMinute, timeAmOrPm, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_name')) {
      context.handle(_taskNameMeta,
          taskName.isAcceptableOrUnknown(data['task_name']!, _taskNameMeta));
    } else if (isInserting) {
      context.missing(_taskNameMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('time_hour')) {
      context.handle(_timeHourMeta,
          timeHour.isAcceptableOrUnknown(data['time_hour']!, _timeHourMeta));
    }
    if (data.containsKey('time_minute')) {
      context.handle(
          _timeMinuteMeta,
          timeMinute.isAcceptableOrUnknown(
              data['time_minute']!, _timeMinuteMeta));
    }
    if (data.containsKey('time_am_or_pm')) {
      context.handle(
          _timeAmOrPmMeta,
          timeAmOrPm.isAcceptableOrUnknown(
              data['time_am_or_pm']!, _timeAmOrPmMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_name'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      timeHour: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time_hour']),
      timeMinute: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time_minute']),
      timeAmOrPm: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time_am_or_pm']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String taskName;
  final String subject;
  final String? timeHour;
  final String? timeMinute;
  final String? timeAmOrPm;
  final String? description;
  const Task(
      {required this.id,
      required this.taskName,
      required this.subject,
      this.timeHour,
      this.timeMinute,
      this.timeAmOrPm,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task_name'] = Variable<String>(taskName);
    map['subject'] = Variable<String>(subject);
    if (!nullToAbsent || timeHour != null) {
      map['time_hour'] = Variable<String>(timeHour);
    }
    if (!nullToAbsent || timeMinute != null) {
      map['time_minute'] = Variable<String>(timeMinute);
    }
    if (!nullToAbsent || timeAmOrPm != null) {
      map['time_am_or_pm'] = Variable<String>(timeAmOrPm);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      taskName: Value(taskName),
      subject: Value(subject),
      timeHour: timeHour == null && nullToAbsent
          ? const Value.absent()
          : Value(timeHour),
      timeMinute: timeMinute == null && nullToAbsent
          ? const Value.absent()
          : Value(timeMinute),
      timeAmOrPm: timeAmOrPm == null && nullToAbsent
          ? const Value.absent()
          : Value(timeAmOrPm),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      taskName: serializer.fromJson<String>(json['taskName']),
      subject: serializer.fromJson<String>(json['subject']),
      timeHour: serializer.fromJson<String?>(json['timeHour']),
      timeMinute: serializer.fromJson<String?>(json['timeMinute']),
      timeAmOrPm: serializer.fromJson<String?>(json['timeAmOrPm']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskName': serializer.toJson<String>(taskName),
      'subject': serializer.toJson<String>(subject),
      'timeHour': serializer.toJson<String?>(timeHour),
      'timeMinute': serializer.toJson<String?>(timeMinute),
      'timeAmOrPm': serializer.toJson<String?>(timeAmOrPm),
      'description': serializer.toJson<String?>(description),
    };
  }

  Task copyWith(
          {int? id,
          String? taskName,
          String? subject,
          Value<String?> timeHour = const Value.absent(),
          Value<String?> timeMinute = const Value.absent(),
          Value<String?> timeAmOrPm = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      Task(
        id: id ?? this.id,
        taskName: taskName ?? this.taskName,
        subject: subject ?? this.subject,
        timeHour: timeHour.present ? timeHour.value : this.timeHour,
        timeMinute: timeMinute.present ? timeMinute.value : this.timeMinute,
        timeAmOrPm: timeAmOrPm.present ? timeAmOrPm.value : this.timeAmOrPm,
        description: description.present ? description.value : this.description,
      );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      taskName: data.taskName.present ? data.taskName.value : this.taskName,
      subject: data.subject.present ? data.subject.value : this.subject,
      timeHour: data.timeHour.present ? data.timeHour.value : this.timeHour,
      timeMinute:
          data.timeMinute.present ? data.timeMinute.value : this.timeMinute,
      timeAmOrPm:
          data.timeAmOrPm.present ? data.timeAmOrPm.value : this.timeAmOrPm,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('taskName: $taskName, ')
          ..write('subject: $subject, ')
          ..write('timeHour: $timeHour, ')
          ..write('timeMinute: $timeMinute, ')
          ..write('timeAmOrPm: $timeAmOrPm, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, taskName, subject, timeHour, timeMinute, timeAmOrPm, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.taskName == this.taskName &&
          other.subject == this.subject &&
          other.timeHour == this.timeHour &&
          other.timeMinute == this.timeMinute &&
          other.timeAmOrPm == this.timeAmOrPm &&
          other.description == this.description);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> taskName;
  final Value<String> subject;
  final Value<String?> timeHour;
  final Value<String?> timeMinute;
  final Value<String?> timeAmOrPm;
  final Value<String?> description;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.taskName = const Value.absent(),
    this.subject = const Value.absent(),
    this.timeHour = const Value.absent(),
    this.timeMinute = const Value.absent(),
    this.timeAmOrPm = const Value.absent(),
    this.description = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String taskName,
    required String subject,
    this.timeHour = const Value.absent(),
    this.timeMinute = const Value.absent(),
    this.timeAmOrPm = const Value.absent(),
    this.description = const Value.absent(),
  })  : taskName = Value(taskName),
        subject = Value(subject);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? taskName,
    Expression<String>? subject,
    Expression<String>? timeHour,
    Expression<String>? timeMinute,
    Expression<String>? timeAmOrPm,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskName != null) 'task_name': taskName,
      if (subject != null) 'subject': subject,
      if (timeHour != null) 'time_hour': timeHour,
      if (timeMinute != null) 'time_minute': timeMinute,
      if (timeAmOrPm != null) 'time_am_or_pm': timeAmOrPm,
      if (description != null) 'description': description,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? taskName,
      Value<String>? subject,
      Value<String?>? timeHour,
      Value<String?>? timeMinute,
      Value<String?>? timeAmOrPm,
      Value<String?>? description}) {
    return TasksCompanion(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      subject: subject ?? this.subject,
      timeHour: timeHour ?? this.timeHour,
      timeMinute: timeMinute ?? this.timeMinute,
      timeAmOrPm: timeAmOrPm ?? this.timeAmOrPm,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskName.present) {
      map['task_name'] = Variable<String>(taskName.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (timeHour.present) {
      map['time_hour'] = Variable<String>(timeHour.value);
    }
    if (timeMinute.present) {
      map['time_minute'] = Variable<String>(timeMinute.value);
    }
    if (timeAmOrPm.present) {
      map['time_am_or_pm'] = Variable<String>(timeAmOrPm.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('taskName: $taskName, ')
          ..write('subject: $subject, ')
          ..write('timeHour: $timeHour, ')
          ..write('timeMinute: $timeMinute, ')
          ..write('timeAmOrPm: $timeAmOrPm, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, tasks];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String name,
  required String surName,
  required String email,
  required String password,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> surName,
  Value<String> email,
  Value<String> password,
});

class $$UsersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get surName => $state.composableBuilder(
      column: $state.table.surName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UsersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get surName => $state.composableBuilder(
      column: $state.table.surName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> surName = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> password = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            surName: surName,
            email: email,
            password: password,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String surName,
            required String email,
            required String password,
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            surName: surName,
            email: email,
            password: password,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$TasksTableCreateCompanionBuilder = TasksCompanion Function({
  Value<int> id,
  required String taskName,
  required String subject,
  Value<String?> timeHour,
  Value<String?> timeMinute,
  Value<String?> timeAmOrPm,
  Value<String?> description,
});
typedef $$TasksTableUpdateCompanionBuilder = TasksCompanion Function({
  Value<int> id,
  Value<String> taskName,
  Value<String> subject,
  Value<String?> timeHour,
  Value<String?> timeMinute,
  Value<String?> timeAmOrPm,
  Value<String?> description,
});

class $$TasksTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get taskName => $state.composableBuilder(
      column: $state.table.taskName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get timeHour => $state.composableBuilder(
      column: $state.table.timeHour,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get timeMinute => $state.composableBuilder(
      column: $state.table.timeMinute,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get timeAmOrPm => $state.composableBuilder(
      column: $state.table.timeAmOrPm,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TasksTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get taskName => $state.composableBuilder(
      column: $state.table.taskName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get timeHour => $state.composableBuilder(
      column: $state.table.timeHour,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get timeMinute => $state.composableBuilder(
      column: $state.table.timeMinute,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get timeAmOrPm => $state.composableBuilder(
      column: $state.table.timeAmOrPm,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TasksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
    Task,
    PrefetchHooks Function()> {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TasksTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TasksTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> taskName = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<String?> timeHour = const Value.absent(),
            Value<String?> timeMinute = const Value.absent(),
            Value<String?> timeAmOrPm = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              TasksCompanion(
            id: id,
            taskName: taskName,
            subject: subject,
            timeHour: timeHour,
            timeMinute: timeMinute,
            timeAmOrPm: timeAmOrPm,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String taskName,
            required String subject,
            Value<String?> timeHour = const Value.absent(),
            Value<String?> timeMinute = const Value.absent(),
            Value<String?> timeAmOrPm = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              TasksCompanion.insert(
            id: id,
            taskName: taskName,
            subject: subject,
            timeHour: timeHour,
            timeMinute: timeMinute,
            timeAmOrPm: timeAmOrPm,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TasksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
    Task,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
}
