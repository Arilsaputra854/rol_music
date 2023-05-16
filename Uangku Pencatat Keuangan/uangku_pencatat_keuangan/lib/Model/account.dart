class Account {
  final String username;
  final String password;
  final String id;

  Account({
    this.username,
    this.password,
    this.id,
  });

  Map<String, dynamic> toJson() =>
      {'username': username, 'password': password, 'id': id};
}
