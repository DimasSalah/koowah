// To parse this JSON data, do
//
//     final shippingModel = shippingModelFromJson(jsonString);

import 'dart:convert';

ShippingModel shippingModelFromJson(String str) => ShippingModel.fromJson(json.decode(str));

String shippingModelToJson(ShippingModel data) => json.encode(data.toJson());

class ShippingModel {
    Rajaongkir rajaongkir;

    ShippingModel({
        required this.rajaongkir,
    });

    factory ShippingModel.fromJson(Map<String, dynamic> json) => ShippingModel(
        rajaongkir: Rajaongkir.fromJson(json["rajaongkir"]),
    );

    Map<String, dynamic> toJson() => {
        "rajaongkir": rajaongkir.toJson(),
    };
}

class Rajaongkir {
    Query query;
    Status status;
    NDetails originDetails;
    NDetails destinationDetails;
    List<Result> results;

    Rajaongkir({
        required this.query,
        required this.status,
        required this.originDetails,
        required this.destinationDetails,
        required this.results,
    });

    factory Rajaongkir.fromJson(Map<String, dynamic> json) => Rajaongkir(
        query: Query.fromJson(json["query"]),
        status: Status.fromJson(json["status"]),
        originDetails: NDetails.fromJson(json["origin_details"]),
        destinationDetails: NDetails.fromJson(json["destination_details"]),
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "query": query.toJson(),
        "status": status.toJson(),
        "origin_details": originDetails.toJson(),
        "destination_details": destinationDetails.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class NDetails {
    String cityId;
    String provinceId;
    String province;
    String type;
    String cityName;
    String postalCode;

    NDetails({
        required this.cityId,
        required this.provinceId,
        required this.province,
        required this.type,
        required this.cityName,
        required this.postalCode,
    });

    factory NDetails.fromJson(Map<String, dynamic> json) => NDetails(
        cityId: json["city_id"],
        provinceId: json["province_id"],
        province: json["province"],
        type: json["type"],
        cityName: json["city_name"],
        postalCode: json["postal_code"],
    );

    Map<String, dynamic> toJson() => {
        "city_id": cityId,
        "province_id": provinceId,
        "province": province,
        "type": type,
        "city_name": cityName,
        "postal_code": postalCode,
    };
}

class Query {
    String origin;
    String destination;
    int weight;
    String courier;

    Query({
        required this.origin,
        required this.destination,
        required this.weight,
        required this.courier,
    });

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        origin: json["origin"],
        destination: json["destination"],
        weight: json["weight"],
        courier: json["courier"],
    );

    Map<String, dynamic> toJson() => {
        "origin": origin,
        "destination": destination,
        "weight": weight,
        "courier": courier,
    };
}

class Result {
    String code;
    String name;
    List<ResultCost> costs;

    Result({
        required this.code,
        required this.name,
        required this.costs,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json["code"],
        name: json["name"],
        costs: List<ResultCost>.from(json["costs"].map((x) => ResultCost.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "costs": List<dynamic>.from(costs.map((x) => x.toJson())),
    };
}

class ResultCost {
    String service;
    String description;
    List<CostCost> cost;

    ResultCost({
        required this.service,
        required this.description,
        required this.cost,
    });

    factory ResultCost.fromJson(Map<String, dynamic> json) => ResultCost(
        service: json["service"],
        description: json["description"],
        cost: List<CostCost>.from(json["cost"].map((x) => CostCost.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "service": service,
        "description": description,
        "cost": List<dynamic>.from(cost.map((x) => x.toJson())),
    };
}

class CostCost {
    int value;
    String etd;
    String note;

    CostCost({
        required this.value,
        required this.etd,
        required this.note,
    });

    factory CostCost.fromJson(Map<String, dynamic> json) => CostCost(
        value: json["value"],
        etd: json["etd"],
        note: json["note"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "etd": etd,
        "note": note,
    };
}

class Status {
    int code;
    String description;

    Status({
        required this.code,
        required this.description,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
    };
}
