class Device {
  final String id;
  final String name;
  final String category;
  final List<DeviceType> types;

  Device({
    required this.id,
    required this.name,
    required this.category,
    required this.types,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      types: List<DeviceType>.from(json['types'].map((x) => DeviceType.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'category': category,
    'types': types.map((e) => e.toJson()).toList(),
  };
}

class DeviceType {
  final String type;
  final String description;
  final String workingPrinciple;
  final String installation;
  final String nfpaReference;
  final List<Manufacturer> manufacturers;
  final List<String>? videos;

  DeviceType({
    required this.type,
    required this.description,
    required this.workingPrinciple,
    required this.installation,
    required this.nfpaReference,
    required this.manufacturers,
    this.videos,
  });

  factory DeviceType.fromJson(Map<String, dynamic> json) {
    return DeviceType(
      type: json['type'],
      description: json['description'] ?? '',
      workingPrinciple: json['working_principle'] ?? '',
      installation: json['installation'] ?? '',
      nfpaReference: json['nfpa_reference'] ?? '',
      manufacturers: List<Manufacturer>.from(
          json['manufacturers'].map((x) => Manufacturer.fromJson(x))),
      videos: json['videos'] != null ? List<String>.from(json['videos']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'description': description,
    'working_principle': workingPrinciple,
    'installation': installation,
    'nfpa_reference': nfpaReference,
    'manufacturers': manufacturers.map((e) => e.toJson()).toList(),
    if (videos != null) 'videos': videos,
  };
}

class Manufacturer {
  final String name;
  final String model;
  final List<String>? images;
  final Map<String, dynamic>? specifications;

  Manufacturer({
    required this.name,
    required this.model,
    this.images,
    this.specifications,
  });

  factory Manufacturer.fromJson(Map<String, dynamic> json) {
    return Manufacturer(
      name: json['name'],
      model: json['model'],
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      specifications: json['specifications'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'model': model,
    if (images != null) 'images': images,
    if (specifications != null) 'specifications': specifications,
  };
}