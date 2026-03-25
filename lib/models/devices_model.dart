import 'device_model.dart';

class Devices {
  final List<Device>? fireAlarmControl;
  final List<Device>? detectionDevices;
  final List<Device>? notificationDevices;
  final List<Device>? manualCallPoints;
  final List<Device>? interfaceModules;
  final List<Device>? communicationDevices;
  final List<Device>? auxiliaryFireAlarmDevices;
  final List<Device>? wiringInstallationComponents;
  final List<Device>? specialDetectionSystems;
  final List<Device>? integrationDevices;
  final List<Device>? monitoringDevices;

  Devices({
    this.fireAlarmControl,
    this.detectionDevices,
    this.notificationDevices,
    this.manualCallPoints,
    this.interfaceModules,
    this.communicationDevices,
    this.auxiliaryFireAlarmDevices,
    this.wiringInstallationComponents,
    this.specialDetectionSystems,
    this.integrationDevices,
    this.monitoringDevices,
  });

  factory Devices.fromJson(Map<String, dynamic> json) {
    List<Device>? parseDevices(String key) => json[key] != null
        ? List<Device>.from(json[key].map((x) => Device.fromJson(x)))
        : null;

    return Devices(
      fireAlarmControl: parseDevices('fireAlarmControl'),
      detectionDevices: parseDevices('detectionDevices'),
      notificationDevices: parseDevices('notificationDevices'),
      manualCallPoints: parseDevices('manualCallPoints'),
      interfaceModules: parseDevices('interfaceModules'),
      communicationDevices: parseDevices('communicationDevices'),
      auxiliaryFireAlarmDevices: parseDevices('auxiliaryFireAlarmDevices'),
      wiringInstallationComponents: parseDevices('wiringInstallationComponents'),
      specialDetectionSystems: parseDevices('specialDetectionSystems'),
      integrationDevices: parseDevices('integrationDevices'),
      monitoringDevices: parseDevices('monitoringDevices'),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};

    void addIfNotNull(String key, List<Device>? list) {
      if (list != null) map[key] = list.map((e) => e.toJson()).toList();
    }

    addIfNotNull('fireAlarmControl', fireAlarmControl);
    addIfNotNull('detectionDevices', detectionDevices);
    addIfNotNull('notificationDevices', notificationDevices);
    addIfNotNull('manualCallPoints', manualCallPoints);
    addIfNotNull('interfaceModules', interfaceModules);
    addIfNotNull('communicationDevices', communicationDevices);
    addIfNotNull('auxiliaryFireAlarmDevices', auxiliaryFireAlarmDevices);
    addIfNotNull('wiringInstallationComponents', wiringInstallationComponents);
    addIfNotNull('specialDetectionSystems', specialDetectionSystems);
    addIfNotNull('integrationDevices', integrationDevices);
    addIfNotNull('monitoringDevices', monitoringDevices);

    return map;
  }
}