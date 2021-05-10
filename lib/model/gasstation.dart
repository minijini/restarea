class garstation {
  List<gas_list> list;
  int count;
  int pageNo;
  int numOfRows;
  int pageSize;
  String message;
  String code;

  garstation(
      {this.list,
      this.count,
      this.pageNo,
      this.numOfRows,
      this.pageSize,
      this.message,
      this.code});

  garstation.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<gas_list>();
      json['list'].forEach((v) {
        list.add(new gas_list.fromJson(v));
      });
    }
    count = json['count'];
    pageNo = json['pageNo'];
    numOfRows = json['numOfRows'];
    pageSize = json['pageSize'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['pageNo'] = this.pageNo;
    data['numOfRows'] = this.numOfRows;
    data['pageSize'] = this.pageSize;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class gas_list {
  String direction;
  Null pageNo;
  Null numOfRows;
  String svarAddr;
  String routeName;
  String oilCompany;
  String telNo;
  String gasolinePrice;
  String lpgPrice;
  String serviceAreaCode;
  String serviceAreaName;
  String routeCode;
  String lpgYn;
  String diselPrice;
  String serviceAreaCode2;

  gas_list(
      {this.direction,
      this.pageNo,
      this.numOfRows,
      this.svarAddr,
      this.routeName,
      this.oilCompany,
      this.telNo,
      this.gasolinePrice,
      this.lpgPrice,
      this.serviceAreaCode,
      this.serviceAreaName,
      this.routeCode,
      this.lpgYn,
      this.diselPrice,
      this.serviceAreaCode2});

  gas_list.fromJson(Map<String, dynamic> json) {
    direction = json['direction'];
    pageNo = json['pageNo'];
    numOfRows = json['numOfRows'];
    svarAddr = json['svarAddr'];
    routeName = json['routeName'];
    oilCompany = json['oilCompany'];
    telNo = json['telNo'];
    gasolinePrice = json['gasolinePrice'];
    lpgPrice = json['lpgPrice'];
    serviceAreaCode = json['serviceAreaCode'];
    serviceAreaName = json['serviceAreaName'];
    routeCode = json['routeCode'];
    lpgYn = json['lpgYn'];
    diselPrice = json['diselPrice'];
    serviceAreaCode2 = json['serviceAreaCode2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['direction'] = this.direction;
    data['pageNo'] = this.pageNo;
    data['numOfRows'] = this.numOfRows;
    data['svarAddr'] = this.svarAddr;
    data['routeName'] = this.routeName;
    data['oilCompany'] = this.oilCompany;
    data['telNo'] = this.telNo;
    data['gasolinePrice'] = this.gasolinePrice;
    data['lpgPrice'] = this.lpgPrice;
    data['serviceAreaCode'] = this.serviceAreaCode;
    data['serviceAreaName'] = this.serviceAreaName;
    data['routeCode'] = this.routeCode;
    data['lpgYn'] = this.lpgYn;
    data['diselPrice'] = this.diselPrice;
    data['serviceAreaCode2'] = this.serviceAreaCode2;
    return data;
  }
}
