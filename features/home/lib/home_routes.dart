class HomeRoutes {
  static const String initial = '/';
  static const String details = '/details/:id';

  // Para navegación desde otros módulos
  static String detailsPath(String id) => '/details/$id';
}
