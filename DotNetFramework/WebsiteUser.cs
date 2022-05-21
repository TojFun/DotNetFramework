using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;

namespace DotNetFramework
{
    public class WebsiteUser
    {
        private string firstName, lastName, email, gender, phone, favoriteBrand, description, password;
        private bool isAdult, isAdmin;
        private DateTime dueDate;
        private Dictionary<string, object> dict;

        public string FirstName => firstName;
        public string LastName => lastName;
        public string Email { get => email; set => email = value; }
        public string Gender => gender;
        public string Phone => phone;
        public string FavoriteBrand { get => favoriteBrand; set => favoriteBrand = value; }
        public DateTime DueDate => dueDate;
        public string Description => description;
        public string Password => password;

        public bool IsAdult => isAdult;
        public bool IsAdmin { get => isAdmin; set => isAdmin = value; }

        public Dictionary<string, object> Dict => dict;



        public static Dictionary<string, string> fields = new Dictionary<string, string> {
        { "firstName", "firstName" },
        { "lastName","lastName" },
        { "phone","phone" },
        { "email","email"},
        { "password","pswrd" },
        { "isAdmin","isAdmin" },
        { "isAdult","isAdult"},
        { "gender","gender" },
        { "dueDate","dueDate"},
        { "favoriteBrand","favoriteBrand" },
        { "description","dscrptn" }};

        public WebsiteUser(DataRow userDataRow)
        {
            firstName = (string) userDataRow["firstName"];
            lastName = (string) userDataRow["lastName"];
            email = (string) userDataRow["email"];
            gender = (string) userDataRow["gender"];
            password = (string) userDataRow["pswrd"];
            phone = (string) userDataRow["phone"];
            favoriteBrand = (string) userDataRow["favoriteBrand"];
            description = (string) userDataRow["dscrptn"];
            isAdult = (bool) userDataRow["isAdult"];
            dueDate = (DateTime) userDataRow["dueDate"];
            isAdmin = (bool) userDataRow["isAdmin"];

            dict = ToDictionary();
        }

        public WebsiteUser(NameValueCollection userData)
        {
            firstName = userData["firstName"];
            lastName = userData["lastName"];
            email = userData["email"];
            gender = userData["gender"];
            password = userData["pswrd"];
            phone = userData["phone"];
            favoriteBrand = userData["favoriteBrand"];
            description = userData["dscrptn"];
            isAdult = userData["isAdult"] != null;
            dueDate = DateTime.Parse(userData["dueDate"]);
            isAdmin = false;

            dict = ToDictionary();
        }


        public WebsiteUser(string firstName, string lastName, string email, string password, string gender, string phone, string favoriteBrand, string description, string dueDate, bool isAdult, bool isAdmin)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.email = email;
            this.gender = gender;
            this.password = password;
            this.phone = phone;
            this.favoriteBrand = favoriteBrand;
            this.description = description;
            this.isAdult = isAdult;
            this.dueDate = DateTime.Parse(dueDate);
            this.isAdmin = isAdmin;

            dict = ToDictionary();
        }

        private Dictionary<string, object> ToDictionary() =>
            new Dictionary<string, object>
              {
                { "firstName", firstName },
                { "lastName", lastName },
                { "phone", phone },
                { "email", email },
                { "password", password },
                { "isAdult", isAdult },
                { "gender", gender },
                { "dueDate",  dueDate},
                { "favoriteBrand", favoriteBrand},
                { "description", description},
                { "isAdmin",  isAdmin}
              };

        public Dictionary<string, object> CompareTo(WebsiteUser newUser)
        {
            var oldUserInfo = ToDictionary();
            var newUserInfo = newUser.ToDictionary();

            if (oldUserInfo == null || newUserInfo == null) return null;

            var result = new Dictionary<string, object>();
            foreach (var pair in newUserInfo)
            {
                string key = pair.Key; object value = pair.Value;

                if (oldUserInfo.ContainsKey(key) && !value.Equals(oldUserInfo[key]))
                    result.Add(key, value);
            }

            return result;
        }

        public static string UserToKeyValue(Dictionary<string, object> user)
        {
            string str = "";

            foreach (var pair in user)
                str +=
                    $"{pair.Key} = {(pair.Value.GetType() == typeof(bool) ? pair.Value : $"'{pair.Value}'")},";

            return str.Remove(str.Length - 1);
        }

        public string FullName => firstName + " " + lastName;

        public static WebsiteUser Guest() => new WebsiteUser("Guest", "", "", "", "", "", "", "", "", false, false);
    }
}