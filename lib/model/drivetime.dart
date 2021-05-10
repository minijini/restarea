class DriveTime {
  int count;
  List<drivetime_list> list;
  String message;
  String code;

  DriveTime({this.count, this.list, this.message, this.code});

  DriveTime.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['list'] != null) {
      list = new List<drivetime_list>();
      json['list'].forEach((v) {
        list.add(new drivetime_list.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class drivetime_list {
  String sdate;
  String stime;
  String cjunkook;
  String cjibangDir;
  String cseoulDir;
  String csudj;
  String csudg;
  String csuus;
  String csubs;
  String csugj;
  String csump;
  String csukr;
  String cdjsu;
  String cdgsu;
  String cussu;
  String cbssu;
  String cgjsu;
  String cmpsu;
  String ckrsu;
  String csuyy;
  String cyysu;
  String csudjBus;
  String csudgBus;
  String csuusBus;
  String csubsBus;
  String csugjBus;
  String csumpBus;
  String csukrBus;
  String csuyyBus;
  String cdjsuBus;
  String cdgsuBus;
  String cussuBus;
  String cbssuBus;
  String cgjsuBus;
  String cmpsuBus;
  String ckrsuBus;
  String cyysuBus;

  drivetime_list(
      {this.sdate,
      this.stime,
      this.cjunkook,
      this.cjibangDir,
      this.cseoulDir,
      this.csudj,
      this.csudg,
      this.csuus,
      this.csubs,
      this.csugj,
      this.csump,
      this.csukr,
      this.cdjsu,
      this.cdgsu,
      this.cussu,
      this.cbssu,
      this.cgjsu,
      this.cmpsu,
      this.ckrsu,
      this.csuyy,
      this.cyysu,
      this.csudjBus,
      this.csudgBus,
      this.csuusBus,
      this.csubsBus,
      this.csugjBus,
      this.csumpBus,
      this.csukrBus,
      this.csuyyBus,
      this.cdjsuBus,
      this.cdgsuBus,
      this.cussuBus,
      this.cbssuBus,
      this.cgjsuBus,
      this.cmpsuBus,
      this.ckrsuBus,
      this.cyysuBus});

  drivetime_list.fromJson(Map<String, dynamic> json) {
    sdate = json['sdate'];
    stime = json['stime'];
    cjunkook = json['cjunkook'];
    cjibangDir = json['cjibangDir'];
    cseoulDir = json['cseoulDir'];
    csudj = json['csudj'];
    csudg = json['csudg'];
    csuus = json['csuus'];
    csubs = json['csubs'];
    csugj = json['csugj'];
    csump = json['csump'];
    csukr = json['csukr'];
    cdjsu = json['cdjsu'];
    cdgsu = json['cdgsu'];
    cussu = json['cussu'];
    cbssu = json['cbssu'];
    cgjsu = json['cgjsu'];
    cmpsu = json['cmpsu'];
    ckrsu = json['ckrsu'];
    csuyy = json['csuyy'];
    cyysu = json['cyysu'];
    csudjBus = json['csudj_bus'];
    csudgBus = json['csudg_bus'];
    csuusBus = json['csuus_bus'];
    csubsBus = json['csubs_bus'];
    csugjBus = json['csugj_bus'];
    csumpBus = json['csump_bus'];
    csukrBus = json['csukr_bus'];
    csuyyBus = json['csuyy_bus'];
    cdjsuBus = json['cdjsu_bus'];
    cdgsuBus = json['cdgsu_bus'];
    cussuBus = json['cussu_bus'];
    cbssuBus = json['cbssu_bus'];
    cgjsuBus = json['cgjsu_bus'];
    cmpsuBus = json['cmpsu_bus'];
    ckrsuBus = json['ckrsu_bus'];
    cyysuBus = json['cyysu_bus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sdate'] = this.sdate;
    data['stime'] = this.stime;
    data['cjunkook'] = this.cjunkook;
    data['cjibangDir'] = this.cjibangDir;
    data['cseoulDir'] = this.cseoulDir;
    data['csudj'] = this.csudj;
    data['csudg'] = this.csudg;
    data['csuus'] = this.csuus;
    data['csubs'] = this.csubs;
    data['csugj'] = this.csugj;
    data['csump'] = this.csump;
    data['csukr'] = this.csukr;
    data['cdjsu'] = this.cdjsu;
    data['cdgsu'] = this.cdgsu;
    data['cussu'] = this.cussu;
    data['cbssu'] = this.cbssu;
    data['cgjsu'] = this.cgjsu;
    data['cmpsu'] = this.cmpsu;
    data['ckrsu'] = this.ckrsu;
    data['csuyy'] = this.csuyy;
    data['cyysu'] = this.cyysu;
    data['csudj_bus'] = this.csudjBus;
    data['csudg_bus'] = this.csudgBus;
    data['csuus_bus'] = this.csuusBus;
    data['csubs_bus'] = this.csubsBus;
    data['csugj_bus'] = this.csugjBus;
    data['csump_bus'] = this.csumpBus;
    data['csukr_bus'] = this.csukrBus;
    data['csuyy_bus'] = this.csuyyBus;
    data['cdjsu_bus'] = this.cdjsuBus;
    data['cdgsu_bus'] = this.cdgsuBus;
    data['cussu_bus'] = this.cussuBus;
    data['cbssu_bus'] = this.cbssuBus;
    data['cgjsu_bus'] = this.cgjsuBus;
    data['cmpsu_bus'] = this.cmpsuBus;
    data['ckrsu_bus'] = this.ckrsuBus;
    data['cyysu_bus'] = this.cyysuBus;
    return data;
  }
}
