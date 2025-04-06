import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'add_appointment_screen.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Appointment>> _appointments = {};
  bool _isListView = false;

  List<Appointment> _getAppointmentsForDay(DateTime day) {
    return _appointments[day] ?? [];
  }

  void _addAppointment(Appointment appointment) {
    setState(() {
      if (_appointments[_selectedDay!] == null) {
        _appointments[_selectedDay!] = [appointment];
      } else {
        _appointments[_selectedDay!]!.add(appointment);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              setState(() {
                _isListView = !_isListView;
              });
            },
          ),
        ],
      ),
      body: _isListView
          ? ListView.builder(
              itemCount: _appointments.entries.length,
              itemBuilder: (context, index) {
                final entry = _appointments.entries.toList()[index];
                final date = entry.key;
                final appointments = entry.value;
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${date.day}/${date.month}/${date.year}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: appointments
                              .map((appointment) => ListTile(
                                    title: Text(appointment.name),
                                    subtitle: Text(appointment.profession),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 20),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  eventLoader: _getAppointmentsForDay,
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, day, events) {
                      if (events.isNotEmpty) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_selectedDay != null) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAppointmentScreen(
                            selectedDate: _selectedDay!,
                            onSave: _addAppointment,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Add'),
                ),
                const SizedBox(height: 8.0),
                _selectedDay != null && _getAppointmentsForDay(_selectedDay!).isEmpty
                    ? const Text('No appointments to display')
                    : Column(
                        children: _getAppointmentsForDay(_selectedDay ?? DateTime.now())
                            .map((appointment) => Text(appointment.name))
                            .toList(),
                      ),
              ],
            ),
    );
  }
}

class Appointment {
  Appointment({
    required this.name,
    required this.profession,
    required this.time,
    required this.notes,
  });

  final String name;
  final String profession;
  final TimeOfDay time;
  final String notes;
}
