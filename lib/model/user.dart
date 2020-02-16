class User{
  final String name;
  final String email;
  final String dob;
  final String address;
  final String phone;

  User(this.name, this.email, this.dob, this.address, this.phone);

  // transform JSON into object
  factory User.fromJson(Map<String, dynamic> json){
    return User(
      "","","","",""
    );
  }
}