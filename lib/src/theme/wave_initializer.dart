import 'package:waveui/src/theme/wave_theme_configurator.dart';
import 'package:waveui/src/theme/configs/wave_all_config.dart';

/// WaveUI 初始化
class WaveInitializer {
  /// 手动注册时，默认注册渠道是 GLOBAL_CONFIG_ID
  static register({
    WaveAllThemeConfig? allThemeConfig,
    String configId = GLOBAL_CONFIG_ID,
  }) {
    /// 配置主题定制
    WaveThemeConfigurator.instance.register(allThemeConfig, configId: configId);
  }
}
