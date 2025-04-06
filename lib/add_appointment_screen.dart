import 'package:flutter/material.dart';
import 'appointments_screen.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({Key? key, required this.selectedDate, required this.onSave}) : super(key: key);

  final DateTime selectedDate;
  final Function(Appointment) onSave;

  @override
  _AddAppointmentScreenState createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _profession;
  TimeOfDay? _time;
  String? _notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Profession',
                ),
                items: const [
                  DropdownMenuItem(value: 'Anesthesist', child: Text('Anesthesist')),
                  DropdownMenuItem(value: 'Consultant', child: Text('Consultant')),
                  DropdownMenuItem(value: 'Dietician', child: Text('Dietician')),
                  DropdownMenuItem(value: 'Doctor', child: Text('Doctor')),
                  DropdownMenuItem(value: 'Gynecologist', child: Text('Gynecologist')),
                  DropdownMenuItem(value: 'Hospital', child: Text('Hospital')),
                  DropdownMenuItem(value: 'Nurse', child: Text('Nurse')),
                  DropdownMenuItem(value: 'Pediatrician', child: Text('Pediatrician')),
                  DropdownMenuItem(value: 'Sonographer', child: Text('Sonographer')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a profession';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _profession = value;
                  });
                },
                onSaved: (value) {
                  _profession = value;
                },
              ),
              ListTile(
                title: Text(
                  _time == null ? 'Select Time' : 'Time: ${_time!.format(context)}',
                ),
                trailing: const Icon(Icons.timer),
                onTap: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      _time = picked;
                    });
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Notes (Optional)',
                ),
                onSaved: (value) {
                  _notes = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final appointment = Appointment(
                      name: _name!,
                      profession: _profession!,
                      time: _time!,
                      notes: _notes!,
                    );
                    widget.onSave(appointment);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Select'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
