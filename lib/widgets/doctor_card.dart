import 'package:earth_on_sky/models/doctor.dart';
import 'package:flutter/material.dart';
 
/// DoctorCard is a reusable widget that displays a doctor's profile information in a card format. It includes the doctor's image, name, specialty, rating, and years of experience. The card is designed to be tappable, allowing users to navigate to a detailed view of the doctor when tapped. The widget uses a GestureDetector to handle tap events and a Hero widget for smooth image transitions between screens. This card can be used in a list of doctors on the home screen or in search results to provide users with an overview of each doctor before viewing more details.
/// To use this widget, simply pass a Doctor object and an onTap callback function that defines the action to be taken when the card is tapped (e.g., navigating to a doctor detail screen). The design is clean and modern, making it suitable for a medical appointment app.
/// Example usage:
/// DoctorCard( 
/// doctor: Doctor.sampleDoctors[0],
/// onTap: () {
/// // Navigate to doctor detail screen
/// },
/// );

class DoctorCard extends StatelessWidget {

  final Doctor doctor;
  final VoidCallback onTap;

  const DoctorCard({
    Key? key,
    required this.doctor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
       child: Row(
          children: [
            // Doctor Image
            Hero(
              tag: doctor.id,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(doctor.imageUrl),
              ),
            ),
            SizedBox(width: 15),
            // Doctor Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    doctor.specialty,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text('${doctor.rating}', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 12),
                      Icon(Icons.work, color: Colors.grey, size: 14),
                      SizedBox(width: 4),
                      Text('${doctor.experienceYears} years', style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      )
    );
  }
}