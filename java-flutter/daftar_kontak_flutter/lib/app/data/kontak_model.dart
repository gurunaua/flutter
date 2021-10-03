class Kontak {
  int? id;
  String? nama;
  String? email;
  String? noHp;
  bool? isCheck;

  Kontak({this.id, this.nama, this.email, this.noHp, this.isCheck});

  Kontak.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
    noHp = json['no_hp'];
    isCheck = false;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['email'] = email;
    data['no_hp'] = noHp;
    return data;
  }
}
