class RestBestFood {
  int count;
  List<BFood> list;
  int pageNo;
  int numOfRows;
  int pageSize;
  String message;
  String code;

  RestBestFood(
      {this.count,
      this.list,
      this.pageNo,
      this.numOfRows,
      this.pageSize,
      this.message,
      this.code});

  RestBestFood.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['list'] != null) {
      list = new List<BFood>();
      json['list'].forEach((v) {
        list.add(new BFood.fromJson(v));
      });
    }
    pageNo = json['pageNo'];
    numOfRows = json['numOfRows'];
    pageSize = json['pageSize'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['pageNo'] = this.pageNo;
    data['numOfRows'] = this.numOfRows;
    data['pageSize'] = this.pageSize;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class BFood {
  String direction;
  String pageNo;
  String numOfRows;
  String routeName;
  String serviceAreaCode;
  String serviceAreaName;
  String batchMenu;
  String salePrice;
  String routeCode;
  String serviceAreaCode2;
  String svarAddr;

  BFood(
      {this.direction,
      this.pageNo,
      this.numOfRows,
      this.routeName,
      this.serviceAreaCode,
      this.serviceAreaName,
      this.batchMenu,
      this.salePrice,
      this.routeCode,
      this.serviceAreaCode2,
      this.svarAddr});

  BFood.fromJson(Map<String, dynamic> json) {
    direction = json['direction'];
    pageNo = json['pageNo'];
    numOfRows = json['numOfRows'];
    routeName = json['routeName'];
    serviceAreaCode = json['serviceAreaCode'];
    serviceAreaName = json['serviceAreaName'];
    batchMenu = json['batchMenu'];
    salePrice = json['salePrice'];
    routeCode = json['routeCode'];
    serviceAreaCode2 = json['serviceAreaCode2'];
    svarAddr = json['svarAddr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['direction'] = this.direction;
    data['pageNo'] = this.pageNo;
    data['numOfRows'] = this.numOfRows;
    data['routeName'] = this.routeName;
    data['serviceAreaCode'] = this.serviceAreaCode;
    data['serviceAreaName'] = this.serviceAreaName;
    data['batchMenu'] = this.batchMenu;
    data['salePrice'] = this.salePrice;
    data['routeCode'] = this.routeCode;
    data['serviceAreaCode2'] = this.serviceAreaCode2;
    data['svarAddr'] = this.svarAddr;
    return data;
  }
}
