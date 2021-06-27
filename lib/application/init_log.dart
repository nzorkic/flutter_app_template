// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:logging/logging.dart';
import 'package:simple_logger/simple_logger.dart';

// Project imports:
import 'package:template_app/application/logging/log_pens.dart';

final logger = SimpleLogger();

void initLog() {
  hierarchicalLoggingEnabled = true;
  if (kDebugMode) {
    logger.setLevel(
      Level.INFO,
      includeCallerInfo: true,
    );

    Logger.root.onRecord.listen((record) {
      if (record.error != null && record.stackTrace != null) {
        // ignore: avoid_print
        print(
            '[${record.level.name}|${record.time}] | ${record.loggerName} >> ${record.message} << ERROR: ${record.error} | EXCEPTION: ${record.stackTrace}');
      } else if (record.error != null) {
        // ignore: avoid_print
        print(
            '[${record.level.name}|${record.time}] | ${record.loggerName} >> ${record.message} << ERROR: ${record.error}');
      } else {
        // ignore: avoid_print
        print(
            '[${record.level.name}|${record.time}] | ${record.loggerName} >> ${record.message} <<');
      }
    });
  }

  if (kReleaseMode) {
    logger.setLevel(
      Level.OFF,
      includeCallerInfo: false,
    );
  }

  logger.formatter = (info) => penInfo(info.message);
  logger.formatter = (shout) => penShout(shout.message);
  logger.formatter = (warning) => penWarning(warning.message);
  logger.formatter = (severe) => penSevere(severe.message);
  logger.formatter = (finest) => penFinest(finest.message);
  logger.formatter = (finer) => penFiner(finer.message);
  logger.formatter = (fine) => penFine(fine.message);
  logger.formatter = (config) => penConfig(config.message);
}
