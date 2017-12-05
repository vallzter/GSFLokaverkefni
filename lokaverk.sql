
CREATE TABLE PRICE(
	PRICE_CODE DECIMAL(2,0) PRIMARY KEY,
	PRICE_DESCRIPTION VARCHAR(20) NOT NULL,
	PRICE_RENTFEE DECIMAL(5,2) CHECK(PRICE_RENTFEE >= 0),
	PRICE_DAILYATEFEE DECIMAL(5,2) CHECK(PRICE_DAILYATEFEE >= 0)
);
CREATE TABLE MOVIE(
	MOVIE_NUM INT(8) PRIMARY KEY,
	MOVIE_TITLE VARCHAR(55) NOT NULL,
	MOVIE_YEAR INT(4) CHECK(MOVIE_YEAR >= 1900),
	MOVIE_COST DECIMAL(5,2),
	MOVIE_GENRE VARCHAR(55),
	PRICE_CODE DECIMAL(2,0) CONSTRAINT VIDEO_MOVIE_NUM_FK REFERENCES MOVIE
);
CREATE TABLE VIDEO(
	VID_NUM DECIMAL(8,0) PRIMARY KEY,
	VID_INDATE DATE,
	MOVIE_NUM DECIMAL(2,0) CONSTRAINT VIDEO_MOVIE_NUM_FK REFERENCES MOVIE
);
CREATE TABLE MEMBERSHIP(
	MEM_NUM DECIMAL(8,0) PRIMARY KEY,
	MEM_FNAME VARCHAR(55) NOT NULL,
	MEM_LNAME VARCHAR(55) NOT NULL,
	MEM_STREET VARCHAR(175) NOT NULL,
	MEM_CITY VARCHAR(50),
	MEM_STATE CHAR(2),
	MEM_ZIP CHAR(5),
	MEM_BALANCE DECIMAL(10,2)
);
CREATE TABLE RENTAL(
	RENT_NUM DECIMAL(8,0),
	REN_DATE DATE,
	MEM_NUM DECIMAL(8,0) CONSTRAINT RENTAL_MEM_NUM_FK REFERENCES MEMBERSHIP
);
CREATE TABLE DETAILRENTAL(
	RENT_NUM DECIMAL(8,0) CONSTRAINT DETAIL_RENT_NUM_FK REFERENCES RENTAL,
	VID_NUM DECIMAL(8,0) CONSTRAINT DETAIL_VID_NUM_FK REFERENCES VIDEO,
	DETAIL_FEE DECIMAL(5,2),
	DETAIL_DUEDATE DATE,
	DETAIL_RETURNDATE DATE,
	DETAIL_DAILYATEFEE DECIMAL(5,2),
	CONSTRAINT DETAIL_RENT_VID_PK PRIMARY KEY (RENT_NUM,VID_NUM)
);
//Set í price
INSERT INTO PRICE VALUES (1, 'Standard', 2, 1);
INSERT INTO PRICE VALUES (2, 'New Release', 3.5, 3);
INSERT INTO PRICE VALUES (3, 'Discount', 1.5, 1);
INSERT INTO PRICE VALUES (4, 'Weekly Special', 1, .5);
//Set í movie
INSERT INTO MOVIE VALUES (1234, 'The Cesar Family Christmas', 2009, 39.95, 'FAMILY', 2);
INSERT INTO MOVIE VALUES (1235, 'Smokey Mountain Wildlife', 2006, 59.95, 'ACTION', 1);
INSERT INTO MOVIE VALUES (1236, 'Richard Goodhope', 2010, 59.95, 'DRAMA', 2);
INSERT INTO MOVIE VALUES (1237, 'Beatnik Fever', 2009, 29.95, 'COMEDY', 2);
INSERT INTO MOVIE VALUES (1238, 'Constant Companion', 2010, 89.95, 'DRAMA', NULL);
INSERT INTO MOVIE VALUES (1239, 'Where Hope Dies', 2000, 25.49, 'DRAMA', 3);
INSERT INTO MOVIE VALUES (1245, 'Time to Burn', 2007, 45.49, 'ACTION', 1);
INSERT INTO MOVIE VALUES (1246, "What He Doesn't Know", 2008, 58.29, 'COMEDY', 1);
//set i video
INSERT INTO VIDEO VALUES (34341, '22-JAN-09', 1235);
INSERT INTO VIDEO VALUES (34342, '22-JAN-09', 1235);
INSERT INTO VIDEO VALUES (34366, '02-MAR-11', 1236);
INSERT INTO VIDEO VALUES (34367, '02-MAR-11', 1236);
INSERT INTO VIDEO VALUES (34368, '02-MAR-11', 1236);
INSERT INTO VIDEO VALUES (34369, '02-MAR-11', 1236);
INSERT INTO VIDEO VALUES (44392, '21-OCT-10', 1237);
INSERT INTO VIDEO VALUES (44397, '21-OCT-10', 1237);
INSERT INTO VIDEO VALUES (54321, '18-JUN-10', 1234);
INSERT INTO VIDEO VALUES (54324, '18-JUN-10', 1234);
INSERT INTO VIDEO VALUES (54325, '18-JUN-10', 1234);
INSERT INTO VIDEO VALUES (59237, '14-FEB-11', 1237);
INSERT INTO VIDEO VALUES (61353, '28-JAN-08', 1245);
INSERT INTO VIDEO VALUES (61354, '28-JAN-08', 1245);
INSERT INTO VIDEO VALUES (61367, '30-JUL-10', 1246);
INSERT INTO VIDEO VALUES (61369, '30-JUL-10', 1246);
INSERT INTO VIDEO VALUES (61388, '25-JAN-09', 1239);
//Set í membership
INSERT INTO MEMBERSHIP VALUES (102, 'TAMI', 'DAWSON', '2632 TAKLI CIRCLE', 'NORENE', 'TN', '37136', 11);
INSERT INTO MEMBERSHIP VALUES (103, 'CURT', 'KNIGHT', '4025 CORNELL COURT', 'FLATGAP', 'KY', '41219', 6);
INSERT INTO MEMBERSHIP VALUES (104, 'JAMAL', 'MELENDEZ', '788 EAST 145TH AVENUE', 'QUEBECK', 'TN', '38579', 0);
INSERT INTO MEMBERSHIP VALUES (105, 'IVA', 'MCCLAIN', '6045 MUSKET BALL CIRCLE', 'SUMMIT', 'KY', '42783', 15);
INSERT INTO MEMBERSHIP VALUES (106, 'MIRANDA', 'PARKS', '4469 MAXWELL PLACE', 'GERMANTOWN', 'TN', '38183', 0);
INSERT INTO MEMBERSHIP VALUES (107, 'ROSARIO', 'ELLIOTT', '7578 DANNER AVENUE', 'COLUMBIA', 'TN', '38402', 5);
INSERT INTO MEMBERSHIP VALUES (108, 'MATTIE', 'GUY', '4390 EVERGREEN STREET', 'LILY', 'KY', '40740', 0);
INSERT INTO MEMBERSHIP VALUES (109, 'CLINT', 'OCHOA', '1711 ELM STREET', 'GREENEVILLE', 'TN', '37745', 10);
INSERT INTO MEMBERSHIP VALUES (110, 'LEWIS', 'ROSALES', '4524 SOUTHWIND CIRCLE', 'COUNCE', 'TN', '38326', 0);
INSERT INTO MEMBERSHIP VALUES (111, 'STACY', 'MANN', '2789 EAST COOK AVENUE', 'MURFREESBORO', 'TN', '37132', 8);
INSERT INTO MEMBERSHIP VALUES (112, 'LUIS', 'TRUJILLO', '7267 MELVIN AVENUE', 'HEISKELL', 'TN', '37754', 3);
INSERT INTO MEMBERSHIP VALUES (113, 'MINNIE', 'GONZALES', '6430 VASILI DRIVE', 'WILLISTON', 'TN', '38076', 0);
//set í rental
INTO RENTAL VALUES (1001, '01-MAR-11', 103);
INSERT INTO RENTAL VALUES (1002, '01-MAR-11', 105);
INSERT INTO RENTAL VALUES (1003, '02-MAR-11', 102);
INSERT INTO RENTAL VALUES (1004, '02-MAR-11', 110);
INSERT INTO RENTAL VALUES (1005, '02-MAR-11', 111);
INSERT INTO RENTAL VALUES (1006, '02-MAR-11', 107);
INSERT INTO RENTAL VALUES (1007, '02-MAR-11', 104);
INSERT INTO RENTAL VALUES (1008, '03-MAR-11', 105);
INSERT INTO RENTAL VALUES (1009, '03-MAR-11', 111);
//set í detailrental
INSERT INTO DETAILRENTAL VALUES (1001, 34342, 2, '04-MAR-11', '02-MAR-09', 1);
INSERT INTO DETAILRENTAL VALUES (1001, 34366, 3.5, '04-MAR-11', '02-MAR-09', 3);
INSERT INTO DETAILRENTAL VALUES (1001, 61353, 2, '04-MAR-11', '03-MAR-09', 1);
INSERT INTO DETAILRENTAL VALUES (1002, 59237, 3.5, '04-MAR-11', '04-MAR-09', 3);
INSERT INTO DETAILRENTAL VALUES (1003, 54325, 3.5, '04-MAR-11', '09-MAR-09', 3);
INSERT INTO DETAILRENTAL VALUES (1003, 61369, 2, '06-MAR-11', '09-MAR-09', 1);
INSERT INTO DETAILRENTAL VALUES (1003, 61388, 0, '06-MAR-11', '09-MAR-09', 1);
INSERT INTO DETAILRENTAL VALUES (1004, 34341, 2, '07-MAR-11', '07-MAR-09', 1);
INSERT INTO DETAILRENTAL VALUES (1004, 34367, 3.5, '05-MAR-11', '07-MAR-09', 3);
INSERT INTO DETAILRENTAL VALUES (1004, 44392, 3.5, '05-MAR-11', '07-MAR-09', 3);
INSERT INTO DETAILRENTAL VALUES (1005, 34342, 2, '07-MAR-11', '05-MAR-09', 1);
INSERT INTO DETAILRENTAL VALUES (1005, 44397, 3.5, '05-MAR-11', '05-MAR-09', 3);
INSERT INTO DETAILRENTAL VALUES (1006, 34366, 3.5, '05-MAR-11', '04-MAR-09', 3);
INSERT INTO DETAILRENTAL VALUES (1006, 61367, 2, '07-MAR-11', NULL, 1);
INSERT INTO DETAILRENTAL VALUES (1007, 34368, 3.5, '05-MAR-11', NULL, 3);
INSERT INTO DETAILRENTAL VALUES (1008, 34369, 3.5, '05-MAR-11', '05-MAR-09', 3);
INSERT INTO DETAILRENTAL VALUES (1009, 54324, 3.5, '05-MAR-11', NULL, 3);


3)SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST FROM MOVIE WHERE MOVIE_TITLE = '%hope%'ORDER BY MOVIE_TITLE ASC;

4)SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_GENRE FROM MOVIE WHERE MOVIE_GENRE = "ACTION";

5)SELECT MOVIE_NUM, MOVIE_TITLE, MOVIE_COST FROM MOVIE WHERE MOVIE_COST > 40;

6)SELECT MOVIE_NUM, MOVIE_TITLE, MOVIE_COST, MOVIE_GENRE FROM MOVIE WHERE MOVIE_GENRE IN ('ACTION','COMEDY') AND MOVIE_COST < 50; ORDER BY MOVIE_GENRE ASC;

7)SELECT MOVIE_NUM,MOVIE_TITLE || '('||MOVIE_YEAR||')'||MOVIE_GENRE AS "Movie Description" FROM MOVIE;

8)SELECT MOVIE_GENRE, COUNT(*) AS "Number Of Movies" FROM MOVIE GROUP BY MOVIE_GENRE;

9)SELECT AVG(MOVIE_COST) AS "Average Movie Cost" FROM MOVIE;

10)SELECT MOVIE_GENRE, AVG(MOVIE_COST) AS "Average Movie Cost" FROM MOVIE GROUP BY MOVIE_GENRE;

11)SELECT MOVIE_TITLE, MOVIE_GENRE,PRICE_DESCRIPTION,PRICE_RENTFEE FROM MOVIE.PRICE_CODE = PRICE.PRICE_CODE;

12)SELECT MOVIE_GENRE, AVG(PRICE_RENTFEE) AS "Average Rental Fee" FROM MOVIE, PRICE WHERE MOVIE.PRICE_CODE = PRICE.PRICE_CODE;

13)SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST / PRICE_RENTFEE FROM MOVIE, PRICE WHERE MOVE.PRICE_CODE = PRICE.PRICE_CODE;

14)SELECT MOVIE_TITLE, MOVIE_YEAR FROM MOVIE WHERE PRICE_CODE IS NOT NULL;

15)SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST FROM MOVIE_COST BETWEEN 44.99 AND 49.99;

16)SELECT MOVIE_TITLE, MOVIE_YEAR,PRICE_DESCRIPTION,PRICE_RENTFEE, MOVIE_GENRE FROM MOVIE,PRICE WHERE MOVIE.PRICE_CODE = PRICE.PRICE_CODE AND MOVIE_GENRE IN ('FAMILY','COMEDY','DRAMA');

17)SELECT MIN(MEM_BALANCE) AS "Minimum Balance", MAX(MEM_BALANCE) AS "Maximum Balance", AVG(MEM_BALANCE) AS "Average Balance" FROM MEMBERSHIP WHERE MEM_NUM IN (SELECT MEM_NUM FROM RENTAL);

18)SELECT MEM_FNAME ||''|| MEM_LNAME AS "Membership Name", MEM_STREET ||''|| MEM_CITY ||','|| MEM_STATE ||''|| MEM_ZIP AS "Membership Address" FROM MEMBERSHIP;

19)SELECT MIN(MEM_BALANCE) AS "Minimum Balance", MAX(MEM_BALANCE) AS "Maximum Balance", AVG(MEM_BALANCE) AS "Average Balance" FROM MEMBERSHIP WHERE MEM_NUM IN (SELECT MEM_NUM FROM RENTAL);

20)SELECT rental.RENT_NUM, RENT_DATE, video.VID_NUM,MOVIE_TITLE,
	DETAIL_DUEDATE,DETAIL_RETURNDATE,
	DETAIL_RETURNDATE-DETAIL_DUEDATE AS "Days past due"

FROM rental, detailrental,video,movie

WHERE rental.RENT_NUM = detailrental.RENT_NUM
AND detailrental.VID_NUM = video.VID_NUM
AND video.MOVIE_NUM = movie.MOVIE_NUM
AND DETAIL_RETURNDATE > DETAIL_DUEDATE
ORDER BY rental.RENT_NUM, MOVIE_TITLE;

21)SELECT RENTAL.RENT_NUM, RENT_DATE, MOVIE_TITLE, DETAIL_FEE 

FROM RENTAL, DETAILRENTAL, VIDEO, MOVIE 

WHERE RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM 
AND DETAILRENTAL.VID_NUM = VIDEO.VID_NUM 
AND VIDEO.MOVIE_NUM = MOVIE.MOVIE_NUM 
AND DETAIL_RETURNDATE <= DETAIL_DUEDATE;

22)SELECT membership.MEM_NUM, MEM_LNAME, MEM_FNAME,
sum(DETAILRENTAL.DETAIL_FEE) AS "rental fee revenue"

FROM membership, rental, detailrental

where membership.MEM_NUM= rental.MEM_NUM

AND rental.RENT_NUM = detailrental.RENT_NUM

GROUP BY membership.MEM_NUM, MEM_LNAME, MEM_FNAME;

23)
SELECT MOVIE_NUM, M.MOVIE_GENRE, AVGCOST AS "Average cost",
	MOVIE_COST,
	(MOVIE_COST-AVGCOST) / AVGCOST * 100 AS "percent difference"

FROM MOVIE M, (SELECT MOVIE_GENRE, AVG(MOVIE_COST) AS AVGCOST
	FROM movie
	GROUP BY MOVIE_GENRE) S
WHERE M.MOVIE_GENRE = S.MOVIE_GENRE;

24)
ALTER TABLE detailrental
ADD DETAIL_DAYSLATE DECIMAL(3,0);

25)
ALTER TABLE video
ADD VID_STATUS VARCHAR(4) DEFAULT 'IN' NOT NULL
CHECK (VID_STATUS IN('IN','OUT','LOST'));

26)
UPDATE VIDEO 
SET VID_STATUS = 'OUT' 
WHERE VID_NUM IN (SELECT VID_NUM FROM DETAILRENTAL WHERE DETAIL_RETURNDATE IS NULL);


27)
ALTER TABLE price
ADD PRICE_RENTDAYS DECIMAL(2,0) DEFAULT 3 NOT NULL;

28)
UPDATE PRICE
SET PRICE_RENTDAYS = 5
WHERE PRICE_CODE IN (1,3);

UPDATE PRICE
SET PRICE_RENTDAYS = 7
WHERE PRICE_CODE = 4;

29)

DELIMITER //
CREATE TRIGGER TRG_LATE_RETURN 
BEFORE UPDATE ON DETAILRENTAL 

FOR EACH ROW 

BEGIN 

IF NEW.DETAIL_RETURNDATE IS NULL

THEN SET NEW.DETAIL_DAYSLATE = NULL; 

ELSEIF NEW.DETAIL_RETURNDATE <= NEW.DETAIL_DUEDATE 

	OR NEW.DETAIL_RETURNDATE = NEW.DETAIL_DUEDATE + 1

AND CHAR((NEW.DETAIL_RETURNDATE, 'HH24:MI:SS') <= '12:00:00') 
	
	THEN SET NEW.DETAIL_DAYSLATE = 0;

 ELSE SET NEW.DETAIL_DAYSLATE = NEW.DETAIL_RETURNDATE - NEW.DETAIL_DUEDATE;

END IF; 
END;
//
DELIMITER ;

30)
DELIMITER //
	CREATE TRIGGER TRG_MEM_BALANCE
	AFTER UPDATE ON DETAILRENTAL

FOR EACH row

BEGIN 

declare PRIOR_LATEFEE integer;
declare NEW_LATEFEE integer;
declare UPDATE_AMOUNT integer;
declare RENTAL_MEMBER integer;

SET PRIOR_LATEFEE = NULL;
set NEW_LATEFEE = NULL;
SET UPDATE_AMOUNT = NULL;
set RENTAL_MEMBER = RENTAL.MEM_NUM%TYPE;

set PRIOR_LATEFEE = OLD.DETAIL_DAYSLATE * OLD.DETAIL_DAILYLATEFEE;
 
IF PRIOR_LATEFEE IS NULL THEN set PRIOR_LATEFEE = 0; 

END IF; 

set NEW_LATEFEE = NEW.DETAIL_DAYSLATE * NEW.DETAIL_DAILYLATEFEE; 

IF NEW_LATEFEE IS NULL THEN set NEW_LATEFEE = 0; 

END IF;

set UPDATE_AMOUNT = NEW_LATEFEE - PRIOR_LATEFEE;

IF UPDATE_AMOUNT <> 0 
	THEN SELECT MEM_NUM INTO RENTAL_MEMBER FROM RENTAL 
		WHERE RENT_NUM = NEW.RENT_NUM; 

UPDATE MEMBERSHIP SET MEM_BALANCE = MEM_BALANCE + UPDATE_AMOUNT WHERE MEM_NUM = RENTAL_MEMBER; 

END IF; 
END;
//
DELIMITER ;

31)

