class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final int experienceYears;
  final String about;
  final List<String> availableTimes;

  /// Constructor for the Doctor class
  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.experienceYears,
    required this.about,
    required this.availableTimes,
  });
   
   /// Sample data for testing and demonstration purposes
  static List<Doctor> sampleDoctors = [
    Doctor(
      id: '1',
        name: 'Dr. Sarah Johnson',
        specialty: 'Cardiologist',
        imageUrl: 'https://cdn.pixabay.com/photo/2020/12/15/10/55/doctor-5833178_640.png',
        rating: 4.9,
        experienceYears: 12,
        about: 'Dr. Sarah is a board-certified cardiologist with expertise in preventive cardiology and heart failure management.',
        availableTimes: ['9:00 AM', '10:30 AM', '2:00 PM', '3:30 PM'],
      ),
      Doctor(
        id: '2',
        name: 'Dr. Michael Chen',
        specialty: 'Dentist',
        imageUrl:'',
        rating: 4.8,
        experienceYears: 8,
        about: 'Specializing in cosmetic dentistry and pain-free procedures.',
        availableTimes: ['11:00 AM', '1:00 PM', '4:00 PM'],
      ),
      Doctor(
        id: '3',
        name: 'Dr. Emily Rodriguez',
        specialty: 'Neurologist',
        imageUrl: '',
        rating: 4.9,
        experienceYears: 15,
        about: '',
        availableTimes: ['8:30 AM', '12:00 PM', '3:00 PM'],
      ),
  ];
    /// Static method to retrieve the list of top doctors
   static List<Doctor> getTopDoctors() {
    return sampleDoctors;
  }
}
 /// The Doctor class represents a medical professional with various attributes such as name, specialty, rating, and available appointment times. It also includes a static list of sample doctors for testing and demonstration purposes.
 /// You can add more attributes or methods to this class as needed, such as contact information, office location, or a method to check availability for a specific time slot.
 /// This class can be used in a medical appointment app to display doctor profiles, allow users to book appointments, and manage doctor information.
