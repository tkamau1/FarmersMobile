// lib/screens/crop_management_screen.dart

import 'package:flutter/material.dart';
import '../../providers/mock_crop_data_provider.dart';

class CropManagementScreen extends StatelessWidget {
  final List<Map<String, dynamic>> plantingSchedules = MockCropDataProvider.getPlantingSchedules();
  final List<Map<String, dynamic>> cropCareGuides = MockCropDataProvider.getCropCareGuides();

  CropManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildPlantingSchedulesSection(context),
              const SizedBox(height: 20),
              _buildCropCareGuidesSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlantingSchedulesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Planting Schedules',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...plantingSchedules.map((schedule) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.blue),
              title: Text(schedule['crop']),
              subtitle: Text(schedule['optimalTime']),
              trailing: const Icon(Icons.info, color: Colors.blue),
              onTap: () {
                _showPlantingDetails(context, schedule);
              },
            ),
          );
        }),
      ],
    );
  }

  Widget _buildCropCareGuidesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Crop Care Guides',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...cropCareGuides.map((guide) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              leading: const Icon(Icons.agriculture, color: Colors.green),
              title: Text(guide['crop']),
              trailing: const Icon(Icons.info, color: Colors.green),
              onTap: () {
                _showCareDetails(context, guide);
              },
            ),
          );
        }),
      ],
    );
  }

  void _showPlantingDetails(BuildContext context, Map<String, dynamic> schedule) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                schedule['crop'],
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('Optimal Planting Time: ${schedule['optimalTime']}'),
              const SizedBox(height: 10),
              Text(schedule['details']),
            ],
          ),
        );
      },
    );
  }

  void _showCareDetails(BuildContext context, Map<String, dynamic> guide) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                guide['crop'],
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(guide['care']),
            ],
          ),
        );
      },
    );
  }
}


// Database Integration:
// Connect to a real database to manage planting schedules and crop care guides dynamically.
//
// Calendar Integration:
// Integrate with the device's calendar to add planting schedules and reminders.
//
// User Customization:
// Allow users to customize planting schedules and care guides based on their specific needs and conditions.