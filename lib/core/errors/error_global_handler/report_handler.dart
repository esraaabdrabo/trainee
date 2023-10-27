
import '../../errors/error_global_handler/platform_type.dart';
import '../../errors/error_global_handler/report.dart';

abstract class ReportHandler {
  /// Method called when report has been accepted by user
  Future<bool> handle(Report error);

  /// Get list of supported platforms
  List<PlatformType> getSupportedPlatforms();
}
