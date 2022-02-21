
class AppointmentModel{
  late String note;
  late String? time;
  late String? intent;
  late String? date;

  AppointmentModel({required this.note, this.time, this.intent, this.date});
  //factory allows you to use return
  factory AppointmentModel.fromJson(Map<String, dynamic> json){
    return AppointmentModel(
        note: json['note'] as String,
        time: json['time'] as String,
        intent: json['intent'] as String,
        date: json['date'] as String,
    );
    //and not this method
    // note: json['note'];
    // time: json['time'];
    // intent: json['intent'];
    // date: json['date'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['note'] = this.note;
    data['time'] = this.time;
    data['intent'] = this.intent;
    data['date'] = this.date;
    return data;
  }





}

