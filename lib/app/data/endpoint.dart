class EnvConstants {
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://example.com',
  );

  static const String apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: 'SUPABASE_API_KEY',);

  static const String apiRJO = String.fromEnvironment(
    'API_RJO',
    defaultValue: 'RJO_API',
  );
}

//161246e6a8cb7951aa7caf4fabcbfd19
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNxenRpeWNleGR2dHB3Z2RmanNnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE3MDY4NTIsImV4cCI6MjAzNzI4Mjg1Mn0.HFw7efV144uiYdKsDp72jNhIYrYqmW1HFfgxyxUj2aw
//https://sqztiycexdvtpwgdfjsg.supabase.co