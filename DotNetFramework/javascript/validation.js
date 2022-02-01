"use strict";
/**
 * @param  {HTMLElement} element
 * @param  {boolean} condition
 * @param  {string} message
 */
const generateError = (element, condition, message) => {
  if (!(condition && element)) return true;

  const error = document.createElement("div");
  error.className = "error";
  error.innerText = message;

  element?.parentElement?.appendChild(error);

  return false;
};

/**
 * @param  {HTMLElement} element
 */
const resetErrors = (element) => {
  const from = element?.parentElement ?? document.body;

  from.querySelectorAll(".error")?.forEach((error) => error.remove());
};

/**
 * @param  {HTMLInputElement} element
 */
const reset = (element) => {
  const from = element?.parentElement ?? document.body;

  resetErrors(element);

  from.querySelectorAll(".form-input")?.forEach((input) => {
    console.log(input);
    input.value = "";
  });
};

const validateForm = () => {
  resetErrors(); // reset all errors

  let isValid = true; // assume all fields are valid
  const firstName = document.getElementById("firstName");
  const lastName = document.getElementById("lastName");

  isValid = validateName(firstName) && isValid;
  isValid = validateName(lastName) && isValid;
  isValid = validateEmail() && isValid;
  isValid = validatePhone() && isValid;
  isValid = valiDate() && isValid;
  isValid = validatePassword() && isValid;

  return isValid;
};

/**
 * @param  {HTMLInputElement} element
 */
const validate = (element) => {
  const { id } = element;

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
    case "dueDate":
      return valiDate();
    case "pswrd":
      return validatePassword();
    default:
      return true;
  }
};
/**
 * @param  {HTMLInputElement} name
 */
const validateName = (name) => {
  if (!name) return true;
  name.value = name.value.replace(/\s/g, "");
  const nameValue = name.value;

  return (
    generateError(name, nameValue.length < 1, "שדה זה אינו יכול להיות ריק") &&
    generateError(
      name,
      nameValue.match(/[^a-zA-Zא-ת]/)?.length &&
        nameValue.match(/[^a-zA-Zא-ת]/).length !== 0,
      "שם חייב לכלול אותיות בלבד"
    )
  );
};

// validate phone-number:
// - must not be empty
// - must be a valid phone number - 10 digits, starts with 05, and contains only digits and dashes

const validatePhone = () => {
  const phone = document.getElementById("phone");
  if (!phone) return true;

  const phoneNumber = phone.value.replace(/-/g, "");

  const isValid =
    generateError(
      phone,
      phoneNumber.length !== 10,
      "מספר טלפון נייד חייב לכלול 10 ספרות"
    ) &&
    generateError(
      phone,
      phoneNumber.match(/([^0-9])/),
      "מספר טלפון נייד חייב לכלול ספרות ומקפים בלבד"
    ) &&
    generateError(
      phone,
      phoneNumber.charAt(0) !== "0" || phoneNumber.charAt(1) !== "5",
      "מספר טלפון נייד חייב להתחיל ב 05"
    );

  if (!isValid) return false;

  phone.value = insert(insert(phoneNumber.slice(0, 10), 3, "-"), 7, "-");

  return true;
};
// insert to string
/**
 * @param  {string} str
 * @param  {number} index
 * @param  {string} value
 * @return {string}
 */
function insert(str, index, value) {
  return str.slice(0, index) + value + str.slice(index);
}

// validate date:
// - must not be in the past
// - must not be empty and a valid date
// - must be in the format dd/mm/yyyy
const valiDate = () => {
  const date = document.getElementById("dueDate");
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
  const password = document.getElementById("pswrd");
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

  email.value = email.value.replace(/\s/g, "");
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
      atSigns == null ||
        atSigns.length !== 1 ||
        emailValue.indexOf("@") === 0 ||
        emailValue.indexOf("@") === emailValue.length - 1,
      `בכתובת דוא"ל חייב להיות @ אחד בדיוק שלא יכול להיות בהתחלה או בסוף.`
    ) &&
    generateError(
      email,
      emailValue.match(/\./g) == null,
      `בכתובת דוא"ל חייבת להיות לפחות . אחת.`
    )
  );
};
