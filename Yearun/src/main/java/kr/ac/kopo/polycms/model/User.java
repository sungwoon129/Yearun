package kr.ac.kopo.polycms.model;

public class User {
   String id;
   String pw;
   String nickname;
   String age;
   String photo;
   String name;
   
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   //핸드폰번호
   String phone1_input;
   String phone2_input;
   String phone3_input;
   
   //생년월일
   String birth_input1;

   public String getPhone1_input() {
      return phone1_input;
   }
   public void setPhone1_input(String phone1_input) {
      this.phone1_input = phone1_input;
   }
   public String getPhone2_input() {
      return phone2_input;
   }
   public void setPhone2_input(String phone2_input) {
      this.phone2_input = phone2_input;
   }
   public String getPhone3_input() {
      return phone3_input;
   }
   public void setPhone3_input(String phone3_input) {
      this.phone3_input = phone3_input;
   }
   public String getBirth_input1() {
      return birth_input1;
   }
   public void setBirth_input1(String birth_input1) {
      this.birth_input1 = birth_input1;
   }

   /*주소*/
   String address1_input;
   String address2_input;
   
   public String getAddress1_input() {
      return address1_input;
   }
   public void setAddress1_input(String address1_input) {
      this.address1_input = address1_input;
   }
   public String getAddress2_input() {
      return address2_input;
   }
   public void setAddress2_input(String address2_input) {
      this.address2_input = address2_input;
   }
   String address;
   String phone;
   String area;
   
   
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public String getAge() {
      return age;
   }
   public void setAge(String age) {
      this.age = age;
   }
   public String getPhoto() {
      return photo;
   }
   public void setPhoto(String photo) {
      this.photo = photo;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getArea() {
      return area;
   }
   public void setArea(String area) {
      this.area = area;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   
   
}