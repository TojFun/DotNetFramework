using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DotNetFramework
{
  public class User
  {
    private string firstName, lastName, email, gender, phone, favoriteBrand, description;
    private bool isAdult;
    private DateTime dueDate;

    public User(string firstName, string lastName, string email, string gender, string phone, string favoriteBrand, string description, bool isAdult, string dueDate)
    {
      this.firstName = firstName;
      this.lastName = lastName;
      this.email = email;
      this.gender = gender;
      this.phone = phone;
      this.favoriteBrand = favoriteBrand;
      this.description = description;
      this.isAdult = isAdult;
      this.dueDate = DateTime.Parse(dueDate);
    }

    public string GetName() => firstName + " " + lastName;

    public static User Guest()
    {
      return new User("Guest", "", "", "", "", "", "", false, "");
    }
  }
}