SELECT studentKey, studentNumber, personFullNames(fullNames), ageInYears(dateOfBirth) FROM student;

SELECT studentKey, studentNumber, personFullNames(fullNames), degreeCode, yearOfStudy, courseRegistration FROM undergraduate;

SELECT studentKey, studentNumber, personFullNames(fullNames), degreeCode, yearOfStudy, category, personFullNames(supervisor) FROM postgraduate;

SELECT studentKey, studentNumber, personFullNames(fullNames), degreeCode, yearOfStudy, courseRegistration FROM undergraduate WHERE isFinalYear(yearOfStudy, degreeCode);

SELECT studentKey, studentNumber, personFullNames(fullNames), degreeCode, yearOfStudy, courseRegistration FROM undergraduate WHERE isRegisteredFor('COS326', courseRegistration);

SELECT studentKey, studentNumber, personFullNames(fullNames), degreeCode, yearOfStudy, category, personFullNames(supervisor) FROM postgraduate WHERE isFullTime(category);

SELECT studentKey, studentNumber, personFullNames(fullNames), degreeCode, yearOfStudy, category, personFullNames(supervisor) FROM postgraduate WHERE isPartTime(category);