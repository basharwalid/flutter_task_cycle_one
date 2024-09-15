class Constants {

  Constants._();
  static Constants? instance;
  static getInstance(){
    return instance??= Constants._();
  }
}