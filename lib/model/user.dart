class User {

  String username, name, level, email, highway_id, password;

  User();

  User.fromJson(Map<String, dynamic> json)
    :
        username = json['username'],
        name = json['name'],
        level = json['level'],
        email = json['email'],
        highway_id = json['name'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'name': name,
    'level': level,
    'email': email,
    'highway_id': highway_id,
    'password': password,
  };

}