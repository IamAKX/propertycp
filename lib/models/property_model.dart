import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:propertycp/models/property_media.dart';

class PropertyModel {
  int? id;
  String? title;
  double? price;
  double? numberOfRooms;
  double? bhk;
  String? location;
  String? city;
  String? mainImage;
  List<PropertyMedia>? images;
  String? type;
  double? area;
  String? areaUnit;
  String? description;
  String? createdDate;
  String? updatedDate;
  PropertyModel({
    this.id,
    this.title,
    this.price,
    this.numberOfRooms,
    this.bhk,
    this.location,
    this.city,
    this.mainImage,
    this.images,
    this.type,
    this.area,
    this.areaUnit,
    this.description,
    this.createdDate,
    this.updatedDate,
  });

  PropertyModel copyWith({
    int? id,
    String? title,
    double? price,
    double? numberOfRooms,
    double? bhk,
    String? location,
    String? city,
    String? mainImage,
    List<PropertyMedia>? images,
    String? type,
    double? area,
    String? areaUnit,
    String? description,
    String? createdDate,
    String? updatedDate,
  }) {
    return PropertyModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      bhk: bhk ?? this.bhk,
      location: location ?? this.location,
      city: city ?? this.city,
      mainImage: mainImage ?? this.mainImage,
      images: images ?? this.images,
      type: type ?? this.type,
      area: area ?? this.area,
      areaUnit: areaUnit ?? this.areaUnit,
      description: description ?? this.description,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'numberOfRooms': numberOfRooms,
      'bhk': bhk,
      'location': location,
      'city': city,
      'mainImage': mainImage,
      'images': images?.map((x) => x?.toMap())?.toList(),
      'type': type,
      'area': area,
      'areaUnit': areaUnit,
      'description': description,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
    };
  }

  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      id: map['id']?.toInt(),
      title: map['title'],
      price: map['price']?.toDouble(),
      numberOfRooms: map['numberOfRooms']?.toDouble(),
      bhk: map['bhk']?.toDouble(),
      location: map['location'],
      city: map['city'],
      mainImage: map['mainImage'],
      images: map['images'] != null
          ? List<PropertyMedia>.from(
              map['images']?.map((x) => PropertyMedia.fromMap(x)))
          : null,
      type: map['type'],
      area: map['area']?.toDouble(),
      areaUnit: map['areaUnit'],
      description: map['description'],
      createdDate: map['createdDate'],
      updatedDate: map['updatedDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyModel.fromJson(String source) =>
      PropertyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PropertyModel(id: $id, title: $title, price: $price, numberOfRooms: $numberOfRooms, bhk: $bhk, location: $location, city: $city, mainImage: $mainImage, images: $images, type: $type, area: $area, areaUnit: $areaUnit, description: $description, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PropertyModel &&
        other.id == id &&
        other.title == title &&
        other.price == price &&
        other.numberOfRooms == numberOfRooms &&
        other.bhk == bhk &&
        other.location == location &&
        other.city == city &&
        other.mainImage == mainImage &&
        listEquals(other.images, images) &&
        other.type == type &&
        other.area == area &&
        other.areaUnit == areaUnit &&
        other.description == description &&
        other.createdDate == createdDate &&
        other.updatedDate == updatedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        numberOfRooms.hashCode ^
        bhk.hashCode ^
        location.hashCode ^
        city.hashCode ^
        mainImage.hashCode ^
        images.hashCode ^
        type.hashCode ^
        area.hashCode ^
        areaUnit.hashCode ^
        description.hashCode ^
        createdDate.hashCode ^
        updatedDate.hashCode;
  }
}
