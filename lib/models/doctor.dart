class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final int experienceYears;
  final String about;
  final List<String> availableTimes;


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

  static List<Doctor> sampleDoctors = [
    Doctor(
      id: '1',
        name: 'Dr. Sarah Johnson',
        specialty: 'Cardiologist',
        imageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
        rating: 4.9,
        experienceYears: 12,
        about: 'Dr. Sarah is a board-certified cardiologist with expertise in preventive cardiology and heart failure management.',
        availableTimes: ['9:00 AM', '10:30 AM', '2:00 PM', '3:30 PM'],
      ),
      Doctor(
        id: '2',
        name: 'Dr. Michael Chen',
        specialty: 'Dentist',
        imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
        rating: 4.8,
        experienceYears: 8,
        about: 'Specializing in cosmetic dentistry and pain-free procedures.',
        availableTimes: ['11:00 AM', '1:00 PM', '4:00 PM'],
      ),
      Doctor(
        id: '3',
        name: 'Dr. Emily Rodriguez',
        specialty: 'Neurologist',
        imageUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
        rating: 4.9,
        experienceYears: 15,
        about: 'Leading neurologist specializing in headache disorders and epilepsy.',
        availableTimes: ['8:30 AM', '12:00 PM', '3:00 PM'],
      ),
  ];
}

