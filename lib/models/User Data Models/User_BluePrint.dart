class autoVallyUser {
  String name;
  String email;
  String phonenumber;
  String address;
  String password;
  String ?  profileImgPath;
  String ? aadharcard;
  String ? drivinglicence;
  String ? selfie;
  int gender;

  autoVallyUser({
    this.name = 'User',
    this.email = 'email@email.com',
    this.address = 'address',
    this.password = '123456',
    this.phonenumber = 'XXXXXXXXXX',
    this.profileImgPath,
    this.aadharcard,
    this.drivinglicence,
    this.selfie,
    this.gender = 1,
});
}
