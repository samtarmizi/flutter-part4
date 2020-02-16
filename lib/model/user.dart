class User{
  final String name;
  final String email;
  final String dob;
  final String address;
  final String phone;
  final String imageUrl;

  User(this.name, this.email, this.dob, this.address, this.phone, this.imageUrl);

  // transform JSON into object
  factory User.fromJson(Map<String, dynamic> json){
    return User(
      "${json['results'][0]['name']['title']} ${json['results'][0]['name']['first']} ${json['results'][0]['name']['last']}",
      "${json['results'][0]['email']}",
      "${json['results'][0]['dob']['date']}",
      "${json['results'][0]['location']['country']}",
      "${json['results'][0]['phone']}",
      "${json['results'][0]['picture']['large']}"
    );
  }
}