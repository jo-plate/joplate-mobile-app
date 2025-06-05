import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_settings.freezed.dart';
part 'remote_settings.g.dart';

@freezed
class RemoteSettings with _$RemoteSettings {
  const factory RemoteSettings({
    @Default(false) bool promocode,
  }) = _RemoteSettings;

  factory RemoteSettings.fromJson(Map<String, dynamic> json) => _$RemoteSettingsFromJson(json);
}
