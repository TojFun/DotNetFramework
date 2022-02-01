INSERT INTO
  { dbTableName } (
    firstName,
    lastName,
    email,
    pswrd,
    phone,
    gender,
    isAdult,
    dueDate,
    favoriteBrand,
    dscrptn
  )
VALUES
  (
    '{firstName}',
    '{lastName}',
    '{email}',
    '{pswrd}',
    '{phone}',
    '{gender}',
    { isAdult },
    '{dueDate} 00:00:00',
    '{favoriteBrand}',
    '{dscrptn}'
  )