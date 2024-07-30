import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/weather_screen.dart';
import 'screens/market_prices_screen.dart';
import 'screens/crop_management/crop_management_screen.dart';
import 'screens/expert_advice/expert_advice_screen.dart';
import 'screens/expert_advice/community_forum/community_forum_screen.dart';
import 'screens/expert_advice/consultation/chat_screen.dart';
import 'screens/expert_advice/consultation/video_call_screen.dart';
import 'screens/resource_management/resource_management_screen.dart';
import 'screens/resource_management/add_edit_expense_screen.dart';
import 'screens/resource_management/add_edit_inventory_screen.dart';
import 'screens/task_management/task_management_screen.dart';
import 'screens/task_management/add_edit_task_screen.dart';
import 'screens/task_management/add_edit_reminder_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmer App',
      theme: ThemeData(
      primarySwatch: Colors.green,
      appBarTheme: const AppBarTheme(
        color: Colors.green, // Change the AppBar color
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        // textTheme: TextTheme(
        //   headline6: TextStyle(
        //     color: Colors.white,
        //     fontSize: 20.0,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
        scaffoldBackgroundColor: Colors.grey[200], // Change the body background color
        textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 16.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      cardTheme: CardTheme(
        margin: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
      ),
    ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/crop-management': (context) => CropManagementScreen(),
        '/weather-forecast': (context) => WeatherForecastScreen(),
        '/market-prices': (context) => MarketPricesScreen(),
        '/expert-advice': (context) => ExpertAdviceScreen(),
        // '/chat':(context) => const ChatScreen(),
        // '/video-call': (context) => const VideoCallScreen(),
        '/community-forum': (context) => const CommunityForumScreen(),
        '/task-management': (context) => TaskManagementScreen(),
        '/addTaskScreen': (context) => const AddEditTaskScreen(),
        '/addReminderScreen': (context) => const AddEditReminderScreen(),
        '/resource-management': (context) => ResourceManagementScreen(),
        '/addExpenseScreen': (context) => const AddEditExpenseScreen(),
        '/addInventoryScreen': (context) => const AddEditInventoryScreen(),
      },
      onGenerateRoute: (settings) {
      if (settings.name == '/chat') {
        final expert = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (context) {
            return ChatScreen(expert: expert);
          },
        );
      } else if (settings.name == '/video-call') {
        final expert = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (context) {
            return VideoCallScreen(expert: expert);
          },
        );
      }
      return null;
    },
    );
  }
}