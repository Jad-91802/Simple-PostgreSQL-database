CREATE DOMAIN studentNumber AS TEXT
CHECK(
   VALUE ~ '^[0-9]{6}$'
);

CREATE TYPE studentCategory AS ENUM ('part time', 'full time');

CREATE TYPE title AS ENUM ('Ms', 'Mev', 'Miss', 'Mrs', 'Mr', 'Mnr', 'Dr', 'Prof');

CREATE TYPE fullName AS (title title, firstName text, surname text);

CREATE TABLE degreeProgram (
	degreeKey  serial PRIMARY KEY,
    degreeCode text UNIQUE,
    degreeName text,
    numberOfYears integer,
    faculty text
);

CREATE TABLE course (
	courseKey serial PRIMARY KEY,
    courseCode text,
    courseName text,
    department text,
    credits integer
);

CREATE TABLE student (
	studentKey serial PRIMARY KEY,
    studentNumber integer,
    fullNames   fullName,
    dateOfBirth date,
    degreeCode  text REFERENCES degreeProgram (degreeCode),
    yearOfStudy integer
);

CREATE TABLE undergraduate (
    courseRegistration text[]
) INHERITS(student);

CREATE TABLE postgraduate (
    category studentCategory,
    supervisor fullName
) INHERITS(student);

CREATE SEQUENCE degreeSequence START WITH 1000 INCREMENT BY 12;

CREATE SEQUENCE courseSequence START WITH 2000;

CREATE SEQUENCE studentSequence START WITH 3000;

CREATE OR REPLACE FUNCTION personFullNames(name fullName) RETURNS text AS $$
		SELECT CONCAT(CAST(name.title AS text),' ',CAST(name.firstName AS text),' ', CAST(name.surname AS text)) AS personFullNames;
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION ageInYears(dob date) RETURNS text AS $$
		SELECT CAST(2020 - EXTRACT(YEAR FROM dob)AS text)
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION isRegisteredFor(text, text[]) RETURNS boolean AS
$$
DECLARE flag boolean; val text;	
BEGIN
	flag = false;
	FOREACH val IN ARRAY $2
	LOOP
		IF $1 = val THEN 
			flag = true;
		END IF;
	END LOOP;
	RETURN flag;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION isFinalYear(integer, text) RETURNS boolean AS $$
	DECLARE flag boolean; numYears integer;
	BEGIN
		flag = false;
		SELECT numberOfYears INTO numYears FROM degreeProgram WHERE degreeCode = $2; 
			IF $1 = numYears THEN
				flag = true;
			END IF;
		RETURN flag;
	END;			
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION isPartTime(studentCategory) RETURNS boolean AS $$
	DECLARE flag boolean;
	BEGIN
		flag = false;
			IF  $1 = 'part time' THEN
				flag = true;
			END IF;
		RETURN flag;
	END;			
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION isFullTime(studentCategory) RETURNS boolean AS $$
	DECLARE flag boolean;
	BEGIN
		flag = false;
			IF  $1 = 'full time' THEN
				flag = true;
			END IF;
		RETURN flag;
	END;			
$$ LANGUAGE plpgsql;

