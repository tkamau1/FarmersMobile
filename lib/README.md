User Authentication
Farmer Login & Expert Login: Both user types (Farmers and Experts) can register and log in using the LoginScreen and RegisterScreen.
lib/screens/login_screen.dart
This screen allows users (farmers or experts) to log in using their phone number or email.
It utilizes the AuthenticationService to handle the login process.
lib/screens/register_screen.dart
This screen allows users to register using their phone number or email.
It also uses the AuthenticationService to handle the registration process.
Crop Management
Planting Schedules & Crop Care Guides: Information on optimal planting times and detailed guides for crop care.
lib/screens/crop_management/planting_schedules_screen.dart
This screen fetches and displays optimal planting times for various crops.
It uses the FetchService to retrieve planting schedules from the backend.
lib/screens/crop_management/crop_care_guides_screen.dart
This screen provides detailed guides on crop care, including pest control and fertilization.
It also fetches data from the backend using the FetchService.
Weather Forecast
Local Weather & Weather Alerts: Current weather conditions and extreme weather notifications tailored to the farmer's location.
lib/screens/weather_screen.dart
This screen shows current weather conditions and forecasts.
It fetches weather data from the backend, likely through the FetchService.
Market Prices
Live Market Prices & Price Trends: Real-time updates on market prices for crops and livestock and historical data for trends.
lib/screens/market_prices_screen.dart
This screen displays live market prices and historical price trends.
It fetches this information from the backend using the FetchService.
Expert Advice
Consultation & Community Forum: Access to agricultural experts for advice and a platform for farmers to discuss and share experiences.
lib/screens/expert_advice/consultation_screen.dart
This screen provides a platform for farmers to consult directly with agricultural experts.
It connects to the backend for real-time consultation sessions or expert advice retrieval.
lib/screens/expert_advice/community_forum_screen.dart
This screen acts as a community forum where farmers can discuss and share their experiences.
It may also fetch forum topics and discussions from the backend using the FetchService.
Task Management
Task Scheduler & Reminders: Create and manage daily, weekly, and seasonal tasks with notifications and reminders.
lib/screens/task_management/task_scheduler_screen.dart
This screen allows farmers to create and manage their tasks.
It can store tasks locally or fetch/sync them with the backend using the FetchService.
lib/screens/task_management/reminders_screen.dart
This screen handles notifications and reminders for important tasks.
It may also integrate with local notifications or fetch reminders from the backend.
Resource Management
Inventory Tracking & Expense Management: Keep track of seeds, fertilizers, pesticides, and log expenses to track spending.
lib/screens/resource_management/inventory_tracking_screen.dart
This screen allows farmers to track their inventory of seeds, fertilizers, and pesticides.
It fetches and updates inventory data from the backend using the FetchService.
lib/screens/resource_management/expense_management_screen.dart
This screen helps farmers log and track their expenses.
It communicates with the backend to store and retrieve expense data.



How Each Core Feature is Implemented

Fetching Data: Most screens use the FetchService to communicate with the backend API running on http://localhost:8626. This service handles the HTTP requests to fetch the required data.
Displaying Data: Data fetched from the backend is displayed using standard Flutter widgets like ListView, ListTile, Text, etc.
User Authentication: The AuthenticationService handles registration and login by making API calls to the backend for authentication purposes.
Navigation: Navigation between screens is handled using named routes defined in the main.dart file.
State Management: Simple state management is handled within each screen using StatefulWidget and setState. For more complex state management, you might consider using a state management solution like Provider or Bloc.