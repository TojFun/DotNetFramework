"use strict";
var firstName = document.getElementById("firstName");
var lastName = document.getElementById("lastName");
var gender = document.getElementById("gender");
var isAdult = document.getElementById("isAdult");
var phone = document.getElementById("phone");
var date = document.getElementById("date");
var password = document.getElementById("password");
var description = document.getElementById("description");

function generateError(element, message) {
  var error = document.createElement("span");
  error.className = "error";
  error.innerText = message;
  element.parentElement.appendChild(error);
}

var form = [
  firstName,
  lastName,
  gender,
  isAdult,
  phone,
  date,
  password,
  description,
];

function validate(e) {
  console.log(e);

  var isValid = true;

  for (var i = 0; i < form.length; i++) {
    console.log(i);
    var element = form[i];
    if (element.value === "") {
      generateError(element, ".שדה זה אינו יכול להיות ריק");

      isValid = false;
    }
  }

  return isValid;
}
