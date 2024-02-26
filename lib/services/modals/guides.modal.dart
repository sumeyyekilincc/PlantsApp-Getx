class GuidesModal {
  List<Data>? data;
  int? to;
  int? perPage;
  int? currentPage;
  int? from;
  int? lastPage;
  int? total;

  GuidesModal(
      {this.data,
      this.to,
      this.perPage,
      this.currentPage,
      this.from,
      this.lastPage,
      this.total});

  GuidesModal.fromJson(Map<String, dynamic> json) {
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
  int? speciesId;
  String? commonName;
  List<String>? scientificName;
  List<Section>? section;

  Data(
      {this.id,
      this.speciesId,
      this.commonName,
      this.scientificName,
      this.section});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    speciesId = json['species_id'];
    commonName = json['common_name'];
    scientificName = json['scientific_name'].cast<String>();
    if (json['section'] != null) {
      section = <Section>[];
      json['section'].forEach((v) {
        section!.add(Section.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['species_id'] = speciesId;
    data['common_name'] = commonName;
    data['scientific_name'] = scientificName;
    if (section != null) {
      data['section'] = section!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Section {
  int? id;
  String? type;
  String? description;

  Section({this.id, this.type, this.description});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['description'] = description;
    return data;
  }
}
