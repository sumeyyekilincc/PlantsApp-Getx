class FaqModal {
  List<Data>? data;
  int? to;
  int? perPage;
  int? currentPage;
  int? from;
  int? lastPage;
  int? total;

  FaqModal(
      {this.data,
      this.to,
      this.perPage,
      this.currentPage,
      this.from,
      this.lastPage,
      this.total});

  FaqModal.fromJson(Map<String, dynamic> json) {
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
  String? question;
  String? answer;
  List<String>? tags;
  DefaultImage? defaultImage;

  Data({this.id, this.question, this.answer, this.tags, this.defaultImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    tags = json['tags'].cast<String>();
    defaultImage = json['default_image'] != null
        ? DefaultImage.fromJson(json['default_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    data['tags'] = tags;
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

  DefaultImage(
      {this.license,
      this.licenseName,
      this.licenseUrl,
      this.originalUrl,
      this.regularUrl,
      this.mediumUrl});

  DefaultImage.fromJson(Map<String, dynamic> json) {
    license = json['license'];
    licenseName = json['license_name'];
    licenseUrl = json['license_url'];
    originalUrl = json['original_url'];
    regularUrl = json['regular_url'];
    mediumUrl = json['medium_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['license'] = license;
    data['license_name'] = licenseName;
    data['license_url'] = licenseUrl;
    data['original_url'] = originalUrl;
    data['regular_url'] = regularUrl;
    data['medium_url'] = mediumUrl;
    return data;
  }
}
