/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author pc
 */
public class User {
    private int Id;
  private  String userName;
  private String Email;
  private String passWord;
  private String role;

    public User( String userName, String Email, String passWord, String role) {
        this.userName = userName;
        this.Email = Email;
        this.passWord = passWord;
        this.role = role;
    }
  public User(){}

    public User(int Id, String userName, String Email, String passWord, String role) {
        this.Id = Id;
        this.userName = userName;
        this.Email = Email;
        this.passWord = passWord;
        this.role = role;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" + "userName=" + userName + ", Email=" + Email + ", passWord=" + passWord + ", role=" + role + '}';
    }

   
  
  
}
