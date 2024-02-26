class DiseasesModal {
  List<Data>? data;
  int? to;
  int? perPage;
  int? currentPage;
  int? from;
  int? lastPage;
  int? total;

  DiseasesModal(
      {this.data,
      this.to,
      this.perPage,
      this.currentPage,
      this.from,
      this.lastPage,
      this.total});

  DiseasesModal.fromJson(Map<String, dynamic> json) {
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
  String? scientificName;
  List<String>? otherName;
  List<Description>? description;
  List<String>? host;
  List<Images>? images;

  Data(
      {this.id,
      this.commonName,
      this.scientificName,
      this.otherName,
      this.description,
      this.host,
      this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commonName = json['common_name'];
    scientificName = json['scientific_name'];
    otherName = json['other_name'] != null
        ? List<String>.from(json['other_name'].cast<String>())
        : [];
    if (json['description'] != null) {
      description = <Description>[];
      json['description'].forEach((v) {
        description!.add(Description.fromJson(v));
      });
    }

    host = json['host'] != null
        ? List<String>.from(json['host'].cast<String>())
        : [];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['common_name'] = commonName;
    data['scientific_name'] = scientificName;
    data['other_name'] = otherName;
    if (description != null) {
      data['description'] = description!.map((v) => v.toJson()).toList();
    }

    data['host'] = host;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Description {
  String? subtitle;
  String? description;

  Description({this.subtitle, this.description});

  Description.fromJson(Map<String, dynamic> json) {
    subtitle = json['subtitle'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subtitle'] = subtitle;
    data['description'] = description;
    return data;
  }
}

class Images {
  int? license;
  String? licenseName;
  String? licenseUrl;
  String? originalUrl;
  String? regularUrl;
  String? mediumUrl;
  String? smallUrl;
  String? thumbnail;

  Images(
      {this.license,
      this.licenseName,
      this.licenseUrl,
      this.originalUrl,
      this.regularUrl,
      this.mediumUrl,
      this.smallUrl,
      this.thumbnail});

  Images.fromJson(Map<String, dynamic> json) {
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
