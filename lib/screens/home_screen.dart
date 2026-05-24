import 'package:earth_on_sky/screens/doctor_details.dart';
import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../widgets/doctor_card.dart';
import '../widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Cardiologist', 'icon': Icons.favorite, 'color': Colors.red},
    {'name': 'Dentist', 'icon': Icons.medical_services, 'color': Colors.blue},
    {'name': 'Neurologist', 'icon': Icons.psychology, 'color': Colors.purple},
    {'name': 'Pediatric', 'icon': Icons.child_care, 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    final List<Doctor> topDoctors = Doctor.sampleDoctors;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Fixed SliverAppBar
          SliverAppBar(
            expandedHeight: 100, // Further reduced
            toolbarHeight: 60,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue[700]!, Colors.blue[300]!],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Hello, Priyanshu Kumar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search doctor...',
                                    hintStyle: TextStyle(fontSize: 12),
                                    prefixIcon: Icon(Icons.search, size: 18),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.blue[700], size: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Categories Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          name: categories[index]['name'] as String,
                          icon: categories[index]['icon'] as IconData,
                          color: categories[index]['color'] as Color,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Top Doctors',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          // Top Doctors List
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: DoctorCard(
                      doctor: topDoctors[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorDetailScreen(doctor: topDoctors[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
                childCount: topDoctors.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Appointments'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}