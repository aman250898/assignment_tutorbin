import 'dart:convert';


Map<String,dynamic> dataLists =
{
  "cat1": [
    {
      "name": "XYZ",
      "price": 100,
      "instock": true
    },
    {
      "name": "ABC",
      "price": 934,
      "instock": false
    },
    {
      "name": "OTR",
      "price": 945,
      "instock": true
    },
    {
      "name": "SLG",
      "price": 343,
      "instock": true
    },
    {
      "name": "KGN",
      "price": 342,
      "instock": true
    },
    {
      "name": "GDS",
      "price": 234,
      "instock": true
    },
    {
      "name": "KNL",
      "price": 934,
      "instock": true
    },
    {
      "name": "GLM",
      "price": 320,
      "instock": true
    },
    {
      "name": "DKF",
      "price": 394,
      "instock": false
    },
    {
      "name": "VFS",
      "price": 854,
      "instock": true
    }
  ],
  "cat2": [
    {
      "name": "NA",
      "price": 124,
      "instock": true
    },
    {
      "name": "DS",
      "price": 953,
      "instock": true
    },
    {
      "name": "HF",
      "price": 100,
      "instock": true
    },
    {
      "name": "FJ",
      "price": 583,
      "instock": true
    },
    {
      "name": "LS",
      "price": 945,
      "instock": false
    },
    {
      "name": "TR",
      "price": 394,
      "instock": true
    },
    {
      "name": "PD",
      "price": 35,
      "instock": true
    },
    {
      "name": "AL",
      "price": 125,
      "instock": true
    },
    {
      "name": "TK",
      "price": 129,
      "instock": true
    },
    {
      "name": "PG",
      "price": 294,
      "instock": true
    }
  ],
  "cat3": [
    {
      "name": "A",
      "price": 294,
      "instock": true
    },
    {
      "name": "B",
      "price": 125,
      "instock": true
    },
    {
      "name": "C",
      "price": 256,
      "instock": true
    },
    {
      "name": "D",
      "price": 100,
      "instock": true
    },
    {
      "name": "E",
      "price": 100,
      "instock": true
    },
    {
      "name": "F",
      "price": 530,
      "instock": true
    },
    {
      "name": "G",
      "price": 100,
      "instock": true
    },
    {
      "name": "H",
      "price": 100,
      "instock": true
    },
    {
      "name": "I",
      "price": 395,
      "instock": true
    }
  ],
  "cat4": [
    {
      "name": "J",
      "price": 100,
      "instock": true
    },
    {
      "name": "K",
      "price": 100,
      "instock": true
    },
    {
      "name": "L",
      "price": 125,
      "instock": false
    },
    {
      "name": "M",
      "price": 530,
      "instock": true
    },
    {
      "name": "N",
      "price": 100,
      "instock": true
    },
    {
      "name": "O",
      "price": 395,
      "instock": true
    },
    {
      "name": "P",
      "price": 100,
      "instock": true
    },
    {
      "name": "Q",
      "price": 400,
      "instock": true
    },
    {
      "name": "R",
      "price": 100,
      "instock": true
    },
    {
      "name": "S",
      "price": 256,
      "instock": true
    }
  ]
};


Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.cat1,
    this.cat2,
    this.cat3,
    this.cat4,
  });

  List<Cat> ?cat1;
  List<Cat> ?cat2;
  List<Cat> ?cat3;
  List<Cat> ?cat4;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    cat1: List<Cat>.from(json["cat1"].map((x) => Cat.fromJson(x))),
    cat2: List<Cat>.from(json["cat2"].map((x) => Cat.fromJson(x))),
    cat3: List<Cat>.from(json["cat3"].map((x) => Cat.fromJson(x))),
    cat4: List<Cat>.from(json["cat4"].map((x) => Cat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cat1": List<dynamic>.from(cat1!.map((x) => x.toJson())),
    "cat2": List<dynamic>.from(cat2!.map((x) => x.toJson())),
    "cat3": List<dynamic>.from(cat3!.map((x) => x.toJson())),
    "cat4": List<dynamic>.from(cat4!.map((x) => x.toJson())),
  };
}

class Cat {
  Cat({
    this.name,
    this.price,
    this.instock,
  });

  String ?name;
  int ?price;
  bool ?instock;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
    name: json["name"],
    price: json["price"],
    instock: json["instock"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "instock": instock,
  };
}

