import 'dart:convert';

class PropertyMedia {
  String? id;
  String? mediaType;
  String? url;
  PropertyMedia({
    this.id,
    this.mediaType,
    this.url,
  });

  PropertyMedia copyWith({
    String? id,
    String? mediaType,
    String? url,
  }) {
    return PropertyMedia(
      id: id ?? this.id,
      mediaType: mediaType ?? this.mediaType,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mediaType': mediaType,
      'url': url,
    };
  }

  factory PropertyMedia.fromMap(Map<String, dynamic> map) {
    return PropertyMedia(
      id: map['id'],
      mediaType: map['mediaType'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyMedia.fromJson(String source) =>
      PropertyMedia.fromMap(json.decode(source));

  @override
  String toString() =>
      'PropertyMedia(id: $id, mediaType: $mediaType, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PropertyMedia &&
        other.id == id &&
        other.mediaType == mediaType &&
        other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ mediaType.hashCode ^ url.hashCode;
}
