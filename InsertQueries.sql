INSERT INTO course(
  courseKey, courseCode, courseName, department, credits
)VALUES(
  nextval('courseSequence'), 'COS301', 'Software Engineering', 'Computer Science', 40
);

INSERT INTO course(
  courseKey, courseCode, courseName, department, credits
)VALUES(
  nextval('courseSequence'), 'COS326', 'Database Systems', 'Computer Science', 20
);

INSERT INTO course(
  courseKey, courseCode, courseName, department, credits
)VALUES(
  nextval('courseSequence'), 'MTH301', 'Discrete Mathematics', 'Mathematics', 15
);

INSERT INTO course(
  courseKey, courseCode, courseName, department, credits
)VALUES(
  nextval('courseSequence'), 'PHL301', 'Logical Reasoning', 'Philosophy', 15
);

INSERT INTO degreeProgram (
  degreeKey, degreeCode, degreeName, numberOfYears, faculty
)VALUES(
  nextval('degreeSequence'), 'BSc', 'Bachelor of Science', 3, 'EBIT'
 );

INSERT INTO degreeProgram (
  degreeKey, degreeCode, degreeName, numberOfYears, faculty
)VALUES(
  nextval('degreeSequence'), 'BIT', 'Bachelor of IT', 4, 'EBIT'
 );

INSERT INTO degreeProgram (
  degreeKey, degreeCode, degreeName, numberOfYears, faculty
)VALUES(
  nextval('degreeSequence'), 'PhD', 'Philosophiae Doctor', 5, 'EBIT'
 );

SET datestyle = DMY;
INSERT INTO postgraduate(
  studentKey, studentNumber, fullNames, dateofbirth, degreecode, yearofstudy, category, supervisor
)VALUES
(nextval('studentSequence'), '101122',ROW('Mr', 'John', 'Warn'),'15-06-1987','PhD',2,'full time',ROW('Prof', 'Dan', 'Grande')),
(nextval('studentSequence'), '121101',ROW('Mrs', 'Andie', 'Ted'),'27-04-1985','PhD',3,'part time',ROW('Dr', 'Phil', 'Aster'));

SET datestyle = DMY;
INSERT INTO undergraduate(
  studentKey, studentNumber, fullNames, dateofbirth, degreeCode, yearofstudy, courseregistration
)VALUES
(nextval('studentSequence'), '140010',ROW('Mr', 'A','Nuf'),'10-01-1996','BSc',3,('{COS301, COS326, MTH301}')),
(nextval('studentSequence'), '140015',ROW('Mrs', 'G','Mon'),'25-05-1995','BSc',3,('{COS301, PHL301, MTH301}')),
(nextval('studentSequence'), '131120',ROW('Miss', 'L','Tes'),'30-01-1995','BIT',3,('{COS301, COS326, PHL301}')),
(nextval('studentSequence'), '131140',ROW('Miss', 'W','Pou'),'20-02-1996','BIT',4,('{COS301, COS326,MTH301, PHL301}'));
