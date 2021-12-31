"use strict";
const date = document.getElementById("date");
const password = document.getElementById("password");
const description = document.getElementById("description");

const genders = ["male", "female", "other"];

const generateError = (element, condition, message) => {
  if (!condition) return true;
  console.log(element);
  if (!element) return false;

  const error = document.createElement("div");
  error.className = "error";
  error.innerText = message;
  element.parentElement.appendChild(error);

  return false;
};

const resetErrors = () => {
  document.querySelectorAll(".error")?.forEach((error) => error.remove());
};

const validate = (e) => {
  resetErrors();

  const firstName = document.getElementById("firstName");
  const lastName = document.getElementById("lastName");

  let isValid = true;

  isValid = validateName(firstName) && isValid;
  isValid = validateName(lastName) && isValid;
  isValid = validatePhoneNumber() && isValid;
  isValid = validateDate() && isValid;

  return false;
};

const validateName = (name) => {
  return generateError(
    name,
    name.value.length < 1,
    "שדה זה אינו יכול להיות ריק"
  );
};

const validatePhoneNumber = () => {
  const phone = document.getElementById("phone");
  const phoneNumber = phone.value;

  return (
    generateError(
      phone,
      phoneNumber.length !== 10,
      "מספר טלפון חייב לכלול 10 ספרות"
    ) &&
    generateError(
      phone,
      isNaN(phoneNumber),
      "מספר טלפון חייב לכלול ספרות בלבד"
    ) &&
    generateError(
      phone,
      phoneNumber.charAt(0) !== "0" && phoneNumber.charAt(1) !== "5",
      "מספר טלפון חייב להתחיל ב 05"
    ) &&
    isValid
  );
};

// validate date:
// - must not be in the past
// - must not be empty
// - must be in the format dd/mm/yyyy
const validateDate = () => {
  const date = document.getElementById("date");
  const dateValue = new Date(date.value);

  return (
    generateError(date, dateValue.length === 0, "התאריך חייב להיות מוגדר") &&
    generateError(date, dateValue < new Date(), "התאריך חייב להיות בעתיד")
  );
};
