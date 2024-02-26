class SpeciesModal {
  List<Data>? data;
  int? to;
  int? perPage;
  int? currentPage;
  int? from;
  int? lastPage;
  int? total;

  SpeciesModal(
      {this.data,
      this.to,
      this.perPage,
      this.currentPage,
      this.from,
      this.lastPage,
      this.total});

  SpeciesModal.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    to = json['to'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['to'] = to;
    data['per_page'] = perPage;
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['total'] = total;
    return data;
  }
}

class Data {
  int? id;
  String? commonName;
  List<String>? scientificName;
  List<String>? otherName;
  String? cycle;
  String? watering;
  List<String>? sunlight;
  DefaultImage? defaultImage;

  Data(
      {this.id,
      this.commonName,
      this.scientificName,
      this.otherName,
      this.cycle,
      this.watering,
      this.sunlight,
      this.defaultImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commonName = json['common_name'];
    scientificName = json['scientific_name'].cast<String>();
    otherName = json['other_name'].cast<String>();
    cycle = json['cycle'];
    watering = json['watering'];
    sunlight = json['sunlight'].cast<String>();
    defaultImage = json['default_image'] != null
        ? DefaultImage.fromJson(json['default_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['common_name'] = commonName;
    data['scientific_name'] = scientificName;
    data['other_name'] = otherName;
    data['cycle'] = cycle;
    data['watering'] = watering;
    data['sunlight'] = sunlight;
    if (defaultImage != null) {
      data['default_image'] = defaultImage!.toJson();
    }
    return data;
  }
}

class DefaultImage {
  int? license;
  String? licenseName;
  String? licenseUrl;
  String? originalUrl;
  String? regularUrl;
  String? mediumUrl;
  String? smallUrl;
  String? thumbnail;

  DefaultImage(
      {this.license,
      this.licenseName,
      this.licenseUrl,
      this.originalUrl,
      this.regularUrl,
      this.mediumUrl,
      this.smallUrl,
      this.thumbnail});

  DefaultImage.fromJson(Map<String, dynamic> json) {
    license = json['license'];
    licenseName = json['license_name'];
    licenseUrl = json['license_url'];
    originalUrl = json['original_url'];
    regularUrl = json['regular_url'];
    mediumUrl = json['medium_url'];
    smallUrl = json['small_url'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['license'] = license;
    data['license_name'] = licenseName;
    data['license_url'] = licenseUrl;
    data['original_url'] = originalUrl;
    data['regular_url'] = regularUrl;
    data['medium_url'] = mediumUrl;
    data['small_url'] = smallUrl;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
