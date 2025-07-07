/// config.dart

/// Адрес API сервера, можно переопределить через --dart-define=API_URL=your_url
const String baseUrl = String.fromEnvironment(
  'API_URL',
  defaultValue: 'https://cherkessnetdemo-production.up.railway.app',
);
