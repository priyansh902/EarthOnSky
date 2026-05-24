

import 'package:earth_on_sky/models/doctor.dart';
import 'package:earth_on_sky/screens/success_screen.dart';
import 'package:flutter/material.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor;
  
  const DoctorDetailScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedTime = '9:00 AM';
    
    return Scaffold(
      body: Column(
        children: [
          // Top Image Section
          Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue[700]!, Colors.blue[300]!],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: doctor.id,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(doctor.imageUrl),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      doctor.name,
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      doctor.specialty,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text('${doctor.rating}', style: TextStyle(color: Colors.white)),
                          SizedBox(width: 4),
                          Text('(128 reviews)', style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.blue[700]),
                  ),
                ),
              ),
            ],
          ),
          // Details Section
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      doctor.about,
                      style: TextStyle(color: Colors.grey[600], height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Experience',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.work, color: Colors.blue[700]),
                          SizedBox(width: 12),
                          Text(
                            '${doctor.experienceYears}+ years of experience',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Available Timings',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: doctor.availableTimes.length,
                        itemBuilder: (context, index) {
                          final time = doctor.availableTimes[index];
                          return GestureDetector(
                            onTap: () {
                              // In real app, update selected time
                              selectedTime = time;
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue[200]!),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(time, style: TextStyle(color: Colors.blue[700])),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    // Book Appointment Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  SuccessScreen(doctor: doctor, time: selectedTime),
                              transitionDuration: Duration(milliseconds: 500),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return ScaleTransition(scale: animation, child: child);
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          'Book Appointment',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}