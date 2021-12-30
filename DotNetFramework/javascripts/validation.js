"use strict";
const date = document.getElementById("date");
const password = document.getElementById("password");
const description = document.getElementById("description");

const genders = ["male", "female", "other"];

function generateError(condition, element, message) {
  if (!condition) return true;

  const error = document.createElement("div");
  error.className = "error";
  error.innerText = message;
  element.parentElement.appendChild(error);

  return false;
}

function resetErrors() {
  document.querySelectorAll(".error").forEach((error) => error.remove());
}

function validate() {
  resetErrors();

  const firstName = document.getElementById("firstName");
  const lastName = document.getElementById("lastName");

  let isValid = true;

  isValid = validateName(firstName) && isValid;
  isValid = validateName(lastName) && isValid;
  isValid = validatePhoneNumber() && isValid;

  return false;
}

function validateName(name) {
  return generateError(
    name.value.length < 1,
    name,
    "שדה זה אינו יכול להיות ריק"
  );
}

function validatePhoneNumber() {
  const phone = document.getElementById("phone");
  const phoneNumber = phone.value;

  return (
    generateError(
      phoneNumber.length !== 10,
      phone,
      "מספר טלפון חייב לכלול 10 ספרות"
    ) &&
    generateError(
      isNaN(phoneNumber),
      phone,
      "מספר טלפון חייב לכלול ספרות בלבד"
    ) &&
    generateError(
      phoneNumber.charAt(0) !== "0" && phoneNumber.charAt(1) !== "5",
      phone,
      "מספר טלפון חייב להתחיל ב 05"
    ) &&
    isValid
  );
}
