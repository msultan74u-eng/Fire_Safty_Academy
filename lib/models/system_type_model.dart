class SystemType {
  final String type;
  final List<String> images;
  final String principle;
  final List<String>? characteristics;
  final List<String>? advantages;
  final List<String>? disadvantages;
  final List<String>? applications;

  SystemType({
    required this.type,
    required this.images,
    required this.principle,
    this.characteristics,
    this.advantages,
    this.disadvantages,
    this.applications,
  });

  factory SystemType.fromJson(Map<String, dynamic> json) {
    return SystemType(
      type: json['type'],
      images: List<String>.from(json['images'] ?? []),
      principle: json['principle'] ?? '',
      characteristics: json['characteristics'] != null
          ? List<String>.from(json['characteristics'])
          : null,
      advantages: json['advantages'] != null
          ? List<String>.from(json['advantages'])
          : null,
      disadvantages: json['disadvantages'] != null
          ? List<String>.from(json['disadvantages'])
          : null,
      applications: json['applications'] != null
          ? List<String>.from(json['applications'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'images': images,
    if (principle.isNotEmpty) 'principle': principle,
    if (characteristics != null) 'characteristics': characteristics,
    if (advantages != null) 'advantages': advantages,
    if (disadvantages != null) 'disadvantages': disadvantages,
    if (applications != null) 'applications': applications,
  };
}