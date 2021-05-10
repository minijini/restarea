class RestFood {
  int count;
  List<food_list> list;
  int pageNo;
  int numOfRows;
  int pageSize;
  String message;
  String code;

  RestFood(
      {this.count,
      this.list,
      this.pageNo,
      this.numOfRows,
      this.pageSize,
      this.message,
      this.code});

  RestFood.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['list'] != null) {
      list = new List<food_list>();
      json['list'].forEach((v) {
        list.add(new food_list.fromJson(v));
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

class food_list {
  String pageNo;
  String numOfRows;
  String stdRestCd;
  String routeCd;
  String svarAddr;
  String restCd;
  String routeNm;
  String stdRestNm;
  String lsttmAltrUser;
  String lsttmAltrDttm;
  String seq;
  String foodNm;
  String foodCost;
  String etc;
  String recommendyn;
  String seasonMenu;
  String bestfoodyn;
  String premiumyn;
  String app;
  String foodMaterial;
  String lastId;
  String lastDtime;

  food_list(
      {this.pageNo,
      this.numOfRows,
      this.stdRestCd,
      this.routeCd,
      this.svarAddr,
      this.restCd,
      this.routeNm,
      this.stdRestNm,
      this.lsttmAltrUser,
      this.lsttmAltrDttm,
      this.seq,
      this.foodNm,
      this.foodCost,
      this.etc,
      this.recommendyn,
      this.seasonMenu,
      this.bestfoodyn,
      this.premiumyn,
      this.app,
      this.foodMaterial,
      this.lastId,
      this.lastDtime});

  food_list.fromJson(Map<String, dynamic> json) {
    pageNo = json['pageNo'];
    numOfRows = json['numOfRows'];
    stdRestCd = json['stdRestCd'];
    routeCd = json['routeCd'];
    svarAddr = json['svarAddr'];
    restCd = json['restCd'];
    routeNm = json['routeNm'];
    stdRestNm = json['stdRestNm'];
    lsttmAltrUser = json['lsttmAltrUser'];
    lsttmAltrDttm = json['lsttmAltrDttm'];
    seq = json['seq'];
    foodNm = json['foodNm'];
    foodCost = json['foodCost'];
    etc = json['etc'];
    recommendyn = json['recommendyn'];
    seasonMenu = json['seasonMenu'];
    bestfoodyn = json['bestfoodyn'];
    premiumyn = json['premiumyn'];
    app = json['app'];
    foodMaterial = json['foodMaterial'];
    lastId = json['lastId'];
    lastDtime = json['lastDtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNo'] = this.pageNo;
    data['numOfRows'] = this.numOfRows;
    data['stdRestCd'] = this.stdRestCd;
    data['routeCd'] = this.routeCd;
    data['svarAddr'] = this.svarAddr;
    data['restCd'] = this.restCd;
    data['routeNm'] = this.routeNm;
    data['stdRestNm'] = this.stdRestNm;
    data['lsttmAltrUser'] = this.lsttmAltrUser;
    data['lsttmAltrDttm'] = this.lsttmAltrDttm;
    data['seq'] = this.seq;
    data['foodNm'] = this.foodNm;
    data['foodCost'] = this.foodCost;
    data['etc'] = this.etc;
    data['recommendyn'] = this.recommendyn;
    data['seasonMenu'] = this.seasonMenu;
    data['bestfoodyn'] = this.bestfoodyn;
    data['premiumyn'] = this.premiumyn;
    data['app'] = this.app;
    data['foodMaterial'] = this.foodMaterial;
    data['lastId'] = this.lastId;
    data['lastDtime'] = this.lastDtime;
    return data;
  }
}
