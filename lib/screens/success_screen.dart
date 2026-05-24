import 'package:earth_on_sky/models/doctor.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final Doctor doctor;
  final String time;

/// SuccessScreen is a stateless widget that displays a success message after a user has successfully booked an appointment with a doctor. It takes in a Doctor object and a time string as parameters to show the details of the appointment. The screen can include a congratulatory message, the doctor's name, specialty, and the scheduled time for the appointment. This screen serves as a confirmation for the user and can also provide options to view the appointment details or return to the home screen.
  const SuccessScreen({
    Key? key,
    required this.doctor,
    required this.time,
  }) : super(key: key);

 
}