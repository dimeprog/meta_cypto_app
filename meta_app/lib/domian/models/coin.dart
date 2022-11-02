// To parse this JSON data, do
//
//     final coin = coinFromJson(jsonString);

import 'dart:convert';

class Coin {
  Coin({
    required this.id,
    required this.symbol,
    required this.name,
  });

  final String id;
  final String symbol;
  final String name;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
      };
}
