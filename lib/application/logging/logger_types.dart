// Package imports:
import 'package:logging/logging.dart';

mixin UiLogger implements LoggerType {
  @override
  Logger get logger => Logger('[UILogger|${runtimeType.toString()}]');
}

mixin NetworkLogger implements LoggerType {
  @override
  Logger get logger => Logger('[NetworkLogger|${runtimeType.toString()}]');
}

mixin UtilityLogger implements LoggerType {
  @override
  Logger get logger => Logger('[UtilityLogger|${runtimeType.toString()}]');
}

Logger logFunction(String name) => Logger('[Function|$name]');

abstract class LoggerType {
  Logger get logger;
}

extension LoggerSpawner on LoggerType {
  Logger newLogger(String name) => Logger('${logger.fullName}.$name');
}
