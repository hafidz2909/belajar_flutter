// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import '../data/grid_data.dart'; // Import the list_nama.dart file



class GridModel {
  final AssetImage image;
  final String name;
  final Color color;
  GridModel({
    required this.image,
    required this.name,
    required this.color,
  });

  GridModel copyWith({
    AssetImage? image,
    String? name,
    Color? color,
  }) {
    return GridModel(
      image: image ?? this.image,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image.assetName,
      'name': name,
      'color': color.value,
    };
  }

  factory GridModel.fromMap(Map<String, dynamic> map) {
    return GridModel(
      image: AssetImage(map['image'] as String),
      name: map['name'] as String,
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory GridModel.fromJson(String source) => GridModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GridModel(name: $name, color: $color)';

  @override
  bool operator ==(covariant GridModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.color == color;
  }

  @override
  int get hashCode => name.hashCode ^ color.hashCode;
}