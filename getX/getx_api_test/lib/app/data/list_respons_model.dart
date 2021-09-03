class Data {
/*
{
  "item_code": "1box bola",
  "item_name": "1box bola",
  "image": null,
  "normal_rate": 0,
  "promo_rate": 0
}
*/

  String? itemCode;
  String? itemName;
  String? image;
  int? normalRate;
  int? promoRate;

  Data({
    this.itemCode,
    this.itemName,
    this.image,
    this.normalRate,
    this.promoRate,
  });

  Data.fromJson(Map<String, dynamic> json) {
    itemCode = json["item_code"]?.toString();
    itemName = json["item_name"]?.toString();
    image = json["image"] == null ? "" : json["image"].toString();
    normalRate = json["normal_rate"]?.toInt();
    promoRate = json["promo_rate"]?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["item_code"] = itemCode;
    data["item_name"] = itemName;
    data["image"] = image;
    data["normal_rate"] = normalRate;
    data["promo_rate"] = promoRate;
    return data;
  }
}

class SomeRootEntity {
/*
{
  "data": [
    {
      "item_code": "1box bola",
      "item_name": "1box bola",
      "image": null,
      "normal_rate": 0,
      "promo_rate": 0
    }
  ]
}
*/

  List<Data?>? data;

  SomeRootEntity({
    this.data,
  });

  SomeRootEntity.fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      final v = json["data"];
      final arr0 = <Data>[];
      v.forEach((v) {
        arr0.add(Data.fromJson(v));
      });
      this.data = arr0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["data"] = arr0;
    }
    return data;
  }
}
