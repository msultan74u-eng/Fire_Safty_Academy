import 'package:fire_safty_academy/models/system_type_model.dart';

import 'devices_model.dart';

class Section {
  final String sectionId;
  final String sectionTitle;
  final List<SystemType> systemTypes;
  final Devices devices;

  Section({
    required this.sectionId,
    required this.sectionTitle,
    required this.systemTypes,
    required this.devices,
  });

  factory Section.fromJson(Map<String, dynamic> json, {required bool isFireAlarm}) {
    return Section(
      sectionId: json['sectionId'],
      sectionTitle: json['sectionTitle'],
      systemTypes: (isFireAlarm
          ? json['fire_alarm_system_types']
          : json['fire_fighting_system_types'])
          .map<SystemType>((e) => SystemType.fromJson(e))
          .toList(),
      devices: Devices.fromJson(json['devices']),
    );
  }

  Map<String, dynamic> toJson({required bool isFireAlarm}) => {
    'sectionId': sectionId,
    'sectionTitle': sectionTitle,
    if (isFireAlarm)
      'fire_alarm_system_types': systemTypes.map((e) => e.toJson()).toList()
    else
      'fire_fighting_system_types': systemTypes.map((e) => e.toJson()).toList(),
    'devices': devices.toJson(),
  };
}