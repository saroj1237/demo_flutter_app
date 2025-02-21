class FlavorConfig {

  FlavorConfig({
    required this.baseUrl,
    required this.name,
  }) {
    _instance ??= this;
  }
  final String baseUrl;
  final String name;

  static FlavorConfig? _instance;
  static FlavorConfig get instance {
    return _instance!;
  }

  bool get isStaging => name == 'development' || name == 'staging';
}
