class Account {
  final String username;
  final String password;
  final String id;

  Account({
    required this.username,
    required this.password,
    required this.id,
  });

  Map<String, dynamic> toJson() =>
      {'username': username, 'password': password, 'id': id};
}
