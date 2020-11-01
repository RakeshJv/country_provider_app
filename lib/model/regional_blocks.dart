class RegionalBlocs {
  String acronym;
  String name;
  List<String> otherAcronyms;
  List<String> otherNames;

  RegionalBlocs({this.acronym, this.name, this.otherAcronyms, this.otherNames});

  RegionalBlocs.fromJson(Map<String, dynamic> json) {
    acronym = json['acronym'];
    name = json['name'];
    if (json['otherAcronyms'] != null) {
      otherAcronyms = new List<Null>();
      json['otherAcronyms'].forEach((v) {
       // otherAcronyms.add(new String.fromJson(v));
      });
    }
    if (json['otherNames'] != null) {
      otherNames = new List<Null>();
      json['otherNames'].forEach((v) {
       // otherNames.add(new String.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acronym'] = this.acronym;
    data['name'] = this.name;
    if (this.otherAcronyms != null) {
   /*   data['otherAcronyms'] =
          this.otherAcronyms.map((v) => v.toJson()).toList();*/
    }
    if (this.otherNames != null) {
     // data['otherNames'] = this.otherNames.map((v) => v.toJson()).toList();
    }
    return data;
  }
}