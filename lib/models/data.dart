part of 'models.dart';

enum DataType { good_area, bad_area }

class Data extends Equatable {
  final int id;
  final String auditor;
  final String area;
  final int r1;
  final int r2;
  final int r3;
  final int r4;
  final int r5;
  final String comment;
  final double rate;
  final String picturePath;
  final DateTime dateTime;
  final List<DataType> types;

  Data({
    this.id,
    this.auditor,
    this.area,
    this.r1,
    this.r2,
    this.r3,
    this.r4,
    this.r5,
    this.comment,
    this.rate,
    this.picturePath,
    this.dateTime,
    this.types = const [],
  });

  factory Data.fromJson(Map<String, dynamic> data) => Data(
      id: data['id'],
      auditor: data['user_id'],
      area: data['audit_area'],
      r1: data['r1'],
      r2: data['r2'],
      r3: data['r3'],
      r4: data['r4'],
      r5: data['r5'],
      comment: data['comment'],
      rate: data['rate'],
      picturePath: data['picturePath'],
      dateTime: data['dateTime'],
      types: data['types'].toString().split(',').map((e) {
        switch (e) {
          case 'good_area':
            return DataType.good_area;
            break;
          case 'bad_area':
            return DataType.bad_area;
            break;
        }
      }).toList());

  Data copyWith({
    int id,
    String auditor,
    String area,
    int r1,
    int r2,
    int r3,
    int r4,
    int r5,
    String comment,
    double rate,
    String picturePath,
    DateTime dateTime,
    List<DataType> types,
  }) =>
    Data(
        id: id ?? this.id,
        auditor: auditor ?? this.auditor,
        area: area ?? this.area,
        r1: r1 ?? this.r1,
        r2: r2 ?? this.r2,
        r3: r3 ?? this.r3,
        r4: r4 ?? this.r4,
        r5: r5 ?? this.r5,
        comment: comment ?? this.comment,
        rate: rate ?? this.rate,
        picturePath: picturePath ?? this.picturePath,
        dateTime: dateTime ?? this.dateTime,
        types: types ?? this.types);
  

  @override
  List<Object> get props => [
        id,
        auditor,
        area,
        r1,
        r2,
        r3,
        r4,
        r5,
        comment,
        rate,
        picturePath,
        dateTime,
      ];
}

List<Data> mockData = [
  Data(
      id: 1,
      auditor: 'Indra Aliyudin',
      area: "Meja 1",
      r1: 25,
      r2: 25,
      r3: 20,
      r4: 15,
      r5: 23,
      comment: "Good Area",
      rate: 4.5,
      picturePath:
          "https://images.unsplash.com/photo-1597814570899-fff30d91a453?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      dateTime: DateTime.now(),
      types: [DataType.good_area]),
  Data(
      id: 2,
      auditor: 'Anjhi Flash',
      area: "Meja 2",
      r1: 20,
      r2: 25,
      r3: 20,
      r4: 15,
      r5: 15,
      comment: "Good Job",
      rate: 3.5,
      picturePath:
          "https://images.unsplash.com/photo-1487611459768-bd414656ea10?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      dateTime: DateTime.now(),
      types: [DataType.bad_area]),
  Data(
      id: 3,
      auditor: 'Indra',
      area: "Meja 3",
      r1: 10,
      r2: 15,
      r3: 10,
      r4: 15,
      r5: 15,
      comment: "Bad Area",
      rate: 1.5,
      picturePath:
          "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      dateTime: DateTime.now(),
      types: [DataType.bad_area]),
  Data(
      id: 4,
      auditor: 'Aliyudin',
      area: "Meja 4",
      r1: 10,
      r2: 15,
      r3: 10,
      r4: 15,
      r5: 25,
      comment: "Excelent Area",
      rate: 5.0,
      picturePath:
          "https://images.unsplash.com/photo-1493934558415-9d19f0b2b4d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      dateTime: DateTime.now(),
      types: [DataType.bad_area]),
  Data(
      id: 5,
      auditor: 'Indra Flash',
      area: "Meja 5",
      r1: 10,
      r2: 15,
      r3: 20,
      r4: 15,
      r5: 25,
      comment: "Not Bad Area",
      rate: 4.0,
      picturePath:
          "https://images.unsplash.com/photo-1505330622279-bf7d7fc918f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      dateTime: DateTime.now(),
      types: [DataType.bad_area]),
  Data(
      id: 6,
      auditor: 'Indra Flash',
      area: "Meja 5",
      r1: 10,
      r2: 15,
      r3: 20,
      r4: 15,
      r5: 25,
      comment: "Not Bad Area",
      rate: 4.0,
      picturePath:
          "https://images.unsplash.com/photo-1505330622279-bf7d7fc918f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      dateTime: DateTime.now(),
      types: [DataType.bad_area]),
  Data(
      id: 7,
      auditor: 'Indra Flash',
      area: "Meja 5",
      r1: 10,
      r2: 15,
      r3: 20,
      r4: 15,
      r5: 25,
      comment: "Not Bad Area",
      rate: 4.0,
      picturePath:
          "https://images.unsplash.com/photo-1505330622279-bf7d7fc918f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      dateTime: DateTime.now(),
      types: [DataType.bad_area]),
  Data(
      id: 8,
      auditor: 'Indra Flash',
      area: "Meja 5",
      r1: 10,
      r2: 15,
      r3: 20,
      r4: 15,
      r5: 25,
      comment: "Not Bad Area",
      rate: 4.0,
      picturePath:
          "https://images.unsplash.com/photo-1505330622279-bf7d7fc918f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60",
      dateTime: DateTime.now(),
      types: [DataType.bad_area]),
];
