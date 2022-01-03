"use strict";

const generateError = (element, condition, message) => {
  if (!(condition && element)) return true;

  const error = document.createElement("div");
  error.className = "error";
  error.innerText = message;

  element?.parentElement?.appendChild(error);

  return false;
};

const resetErrors = (element) => {
  const from = element?.parentElement ?? document.body;

  from.querySelectorAll(".error")?.forEach((error) => error.remove());
};

const validateForm = () => {
  resetErrors();

  const firstName = document.getElementById("firstName");
  const lastName = document.getElementById("lastName");

  let isValid = true;

  isValid = validateName(firstName) && isValid;
  isValid = validateName(lastName) && isValid;
  isValid = validateEmail() && isValid;
  isValid = validatePhone() && isValid;
  isValid = valiDate() && isValid;
  isValid = validatePassword() && isValid;

  return isValid;
};

const validate = (element) => {
  const { id } = element;

  console.log(id);

  resetErrors(element);

  switch (id) {
    case "firstName":
      return validateName(element);
    case "lastName":
      return validateName(element);
    case "email":
      return validateEmail();
    case "phone":
      return validatePhone();
    case "date":
      return valiDate();
    case "password":
      return validatePassword();
    default:
      return true;
  }
};

const validateName = (name) => {
  if (!name) return true;
  const nameValue = name.value;

  return generateError(
    name,
    nameValue.length < 1,
    "שדה זה אינו יכול להיות ריק"
  );
};

const validatePhone = () => {
  const phone = document.getElementById("phone");
  if (!phone) return true;

  const phoneNumber = phone.value;

  return (
    generateError(
      phone,
      phoneNumber.length !== 10,
      "מספר טלפון חייב לכלול 10 ספרות"
    ) &&
    generateError(
      phone,
      isNaN(parseInt(phoneNumber)),
      "מספר טלפון חייב לכלול ספרות בלבד"
    ) &&
    generateError(
      phone,
      phoneNumber.charAt(0) !== "0" && phoneNumber.charAt(1) !== "5",
      "מספר טלפון חייב להתחיל ב 05"
    )
  );
};

// validate date:
// - must not be in the past
// - must not be empty and a valid date
// - must be in the format dd/mm/yyyy
const valiDate = () => {
  const date = document.getElementById("date");
  if (!date) return true;

  const dateValue = new Date(date.value);
  const currentDate = new Date(new Date().toDateString());

  return (
    generateError(
      date,
      isNaN(dateValue.getTime()),
      "התאריך חייב להיות מוגדר"
    ) && generateError(date, dateValue < currentDate, "התאריך חייב להיות בעתיד")
  );
};

//  validate password:
//  - must not be empty
//  - must be at least 8 characters long
//  - must contain at least one number
//  - must contain at least one uppercase letter
//  - must contain at least one lowercase letter
//  - must contain at least one special character
// - must not contain spaces
const validatePassword = () => {
  const password = document.getElementById("password");
  if (!password) return true;

  const passwordValue = password.value;

  return (
    generateError(
      password,
      passwordValue.length < 8,
      "הסיסמה חייבת להכיל לפחות 8 תווים"
    ) &&
    generateError(
      password,
      passwordValue.match(/\s/) != null,
      "הסיסמה אינה יכולה להכיל רווחים"
    ) &&
    generateError(
      password,
      !passwordValue.match(/[a-z]/),
      "הסיסמה חייבת להכיל לפחות אות קטנה אחת"
    ) &&
    generateError(
      password,
      !passwordValue.match(/[A-Z]/),
      "הסיסמה חייבת להכיל לפחות אות גדולה אחת"
    ) &&
    generateError(
      password,
      !passwordValue.match(/[0-9]/),
      "הסיסמה חייבת להכיל לפחות מספר אחד"
    ) &&
    generateError(
      password,
      !passwordValue.match(/[!@#$%^&*]/),
      "הסיסמה חייבת להכיל לפחות סימן מיוחד אחד"
    )
  );
};

const validateEmail = () => {
  const email = document.getElementById("email");
  if (!email) return true;

  const emailValue = email.value;
  const atSigns = emailValue.match(/@/g);

  return (
    generateError(
      email,
      emailValue.length < 5,
      `בכתובת דוא"ל חייבים להיות לפחות 5 תווים.`
    ) &&
    generateError(
      email,
      atSigns == null || atSigns.length !== 1,
      `בכתובת דוא"ל חייב להיות @ אחד בדיוק.`
    ) &&
    generateError(
      email,
      emailValue.match(/\./g) == null,
      `בכתובת דוא"ל חייבת להיות לפחות . אחת.`
    )
  );
};
