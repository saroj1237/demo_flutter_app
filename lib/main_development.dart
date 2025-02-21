import 'package:demo_flutter_app/app/app.dart';
import 'package:demo_flutter_app/bootstrap.dart';
import 'package:demo_flutter_app/core/network/api_urls.dart';
import 'package:demo_flutter_app/flavor_config.dart';

void main() {
  FlavorConfig(
    baseUrl: ApiUrls.baseUrlDevelopment,
    name: 'development',
  );
  bootstrap(() => const App());
}
