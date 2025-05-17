import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_link.freezed.dart';
part 'social_link.g.dart';

@freezed
class SocialLink with _$SocialLink {
  const factory SocialLink({
    @Default('') String icon,
    @Default('') String link,
    @Default('') String label,
  }) = _SocialLink;

  factory SocialLink.fromJson(Map<String, dynamic> json) => _$SocialLinkFromJson(json);
}
