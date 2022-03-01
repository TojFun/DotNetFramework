using System;

namespace DotNetFramework
{
    public class WebsiteUser
    {
        private string firstName, lastName, email, gender, phone, favoriteBrand, description;
        private bool isAdult;
        private DateTime dueDate;

        public WebsiteUser(string firstName, string lastName, string email, string gender, string phone, string favoriteBrand, string description, bool isAdult, string dueDate)
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

        public static WebsiteUser Guest() => new WebsiteUser("Guest", "", "", "", "", "", "", false, "");
    }
}