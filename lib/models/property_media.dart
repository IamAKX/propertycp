import 'dart:convert';

class PropertyMedia {
  String? mediaType;
  String? url;
  PropertyMedia({
    this.mediaType,
    this.url,
  });

  PropertyMedia copyWith({
    String? mediaType,
    String? url,
  }) {
    return PropertyMedia(
      mediaType: mediaType ?? this.mediaType,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mediaType': mediaType,
      'url': url,
    };
  }

  factory PropertyMedia.fromMap(Map<String, dynamic> map) {
    return PropertyMedia(
      mediaType: map['mediaType'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyMedia.fromJson(String source) =>
      PropertyMedia.fromMap(json.decode(source));

  @override
  String toString() => 'PropertyMedia(mediaType: $mediaType, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PropertyMedia &&
        other.mediaType == mediaType &&
        other.url == url;
  }

  @override
  int get hashCode => mediaType.hashCode ^ url.hashCode;
}
