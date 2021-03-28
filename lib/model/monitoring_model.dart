import 'dart:convert';

MonitoringModel monitoringModelFromJson(String str) => MonitoringModel.fromJson(json.decode(str));

String monitoringModelToJson(MonitoringModel data) => json.encode(data.toJson());

class MonitoringModel {

  MonitoringModel({
    this.id,
    this.monitoringPeriod,
    this.monitoringType,
    this.monitoringDate,
    this.monitoringYear,
    this.sta,
    this.lane,
    this.direction,
    this.latitude,
    this.longitude,
    this.description,
    this.repairUserId,
    this.indicatorId,
    this.indicatorName,
    this.highwayId,
    this.highwayName,
    this.repairStatus,
    this.repairMethod,
    this.monitoringImages,
    this.repairImage0,
    this.repairDate0,
    this.repairLatitude0,
    this.repairLongitude0,
    this.repairImage50,
    this.repairDate50,
    this.repairLatitude50,
    this.repairLongitude50,
    this.repairImage100,
    this.repairDate100,
    this.repairLatitude100,
    this.repairLongitude100,
  });

  int id;
  String monitoringPeriod;
  String monitoringType;
  String monitoringDate;
  String monitoringYear;
  String sta;
  String lane;
  String direction;
  String latitude;
  String longitude;
  String description;
  int repairUserId;
  int indicatorId;
  String indicatorName;
  int highwayId;
  String highwayName;
  String repairStatus;
  String repairMethod;
  String monitoringImages;
  String repairImage0;
  String repairDate0;
  String repairLatitude0;
  String repairLongitude0;
  String repairImage50;
  String repairDate50;
  String repairLatitude50;
  String repairLongitude50;
  String repairImage100;
  String repairDate100;
  String repairLatitude100;
  String repairLongitude100;

  factory MonitoringModel.fromJson(Map<String, dynamic> json) => MonitoringModel(
    id: json["id"],
    monitoringPeriod: json["monitoring_period"],
    monitoringType: json["monitoring_type"],
    monitoringDate: json["monitoring_date"],
    monitoringYear: json["monitoring_year"],
    sta: json["sta"],
    lane: json["lane"],
    direction: json["direction"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    description: json["description"],
    repairUserId: json["repair_user_id"],
    indicatorId: json["indicator_id"],
    indicatorName: json["indicator_name"],
    highwayId: json["highway_id"],
    highwayName: json["highway_name"],
    repairStatus: json["repair_status"],
    repairMethod: json["repair_method"],
    monitoringImages: json["monitoring_images"],
    repairImage0: json["repair_image_0"] != null ? json["repair_image_0"] : '',
    repairDate0: json["repair_date_0"] != null ? json["repair_date_0"] : '',
    repairLatitude0: json["repair_latitude_0"] != null ? json["repair_latitude_0"] : '',
    repairLongitude0: json["repair_longitude_0"] != null ? json["repair_longitude_0"] : '',
    repairImage50: json["repair_image_50"] != null ? json["repair_image_50"] : '',
    repairDate50: json["repair_date_50"] != null ? json["repair_date_50"] : '',
    repairLatitude50: json["repair_latitude_50"] != null ? json["repair_latitude_50"] : '',
    repairLongitude50: json["repair_longitude_50"] != null ? json["repair_longitude_50"] : '',
    repairImage100: json["repair_image_100"] != null ? json["repair_image_100"] : '',
    repairDate100: json["repair_date_100"] != null ? json["repair_date_100"] : '',
    repairLatitude100: json["repair_latitude_100"] != null ? json["repair_latitude_100"] : '',
    repairLongitude100: json["repair_longitude_100"] != null ? json["repair_longitude_100"] : '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "monitoring_period": monitoringPeriod,
    "monitoring_type": monitoringType,
    "monitoring_date": monitoringDate,
    "monitoring_year": monitoringYear,
    "sta": sta,
    "lane": lane,
    "direction": direction,
    "latitude": latitude,
    "longitude": longitude,
    "description": description,
    "repair_user_id": repairUserId,
    "indicator_id": indicatorId,
    "indicator_name": indicatorName,
    "highway_id": highwayId,
    "highway_name": highwayName,
    "repair_status": repairStatus,
    "repair_method": repairMethod,
    "monitoring_images": monitoringImages,
    "repair_image_0": repairImage0,
    "repair_date_0": repairDate0,
    "repair_latitude_0": repairLatitude0,
    "repair_longitude_0": repairLongitude0,
    "repair_image_50": repairImage50,
    "repair_date_50": repairDate50,
    "repair_latitude_50": repairLatitude50,
    "repair_longitude_50": repairLongitude50,
    "repair_image_100": repairImage100,
    "repair_date_100": repairDate100,
    "repair_latitude_100": repairLatitude100,
    "repair_longitude_100": repairLongitude100,
  };
}
