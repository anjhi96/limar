part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String nik;
  final String email;
  final String team;
  final String area;
  final String picturePath;
  static String token;

  User({
    this.id,
    this.name,
    this.nik,
    this.email,
    this.team,
    this.area,
    this.picturePath,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'],
        name: data['name'],
        nik: data['nik'],
        email: data['email'],
        team: data['team'],
        area: data['area'],
        picturePath: data['profile_photo_url'],
      ); 

  User copyWith({
    int id,
    String name,
    String nik,
    String email,
    String team,
    String area,
    String picturePath,
  }) =>
      User(
          id: id ?? this.id,
          name: name ?? this.name,
          nik: nik ?? this.nik,
          email: email ?? this.email,
          team: team ?? this.team,
          area: area ?? this.area,
          picturePath: picturePath ?? this.picturePath);

  @override
  List<Object> get props => [id, name, nik, email, team, area, picturePath];
}

User mockuser = User(
    id: 1,
    name: 'Indra Aliyudin',
    nik: '12345',
    email: 'indra@aliyudin.com',
    team: 'wwd',
    area: 'meja 1',
    picturePath:
        'https://i.pinimg.com/474x/8a/f4/7e/8af47e18b14b741f6be2ae499d23fcbe.jpg');
