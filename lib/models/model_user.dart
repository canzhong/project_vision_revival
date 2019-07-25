class User {
  User(this.name, this.password);
  User.empty() {
    this.name = "";
    this.password = "";
  }

  String name;
  String password;
}
