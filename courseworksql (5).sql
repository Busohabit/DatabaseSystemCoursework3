/* 
This was written in LiveSQL
*/

CREATE TABLE Agency(
    Id int NOT NULL PRIMARY KEY,
    Name varchar(255),
    PhoneNumber char(10),
    CONSTRAINT AK_Agency UNIQUE (PhoneNumber));

CREATE TABLE Office(
    Id int NOT NULL,
    AgencyId int NOT NULL,
    Area char(1),
    District int,
    Sector int,
    Unit char(2),
    PhoneNumber char(10),
    CONSTRAINT AK_Office UNIQUE (Unit,PhoneNumber),
    PRIMARY KEY (Id),
    CONSTRAINT FK_Office FOREIGN KEY (AgencyId) REFERENCES Agency(Id)
);

CREATE TABLE Property (
    Id int NOT NULL PRIMARY KEY,
    Area char(1) NOT NULL,
    District int NOT NULL,
    Sector int NOT NULL,
    Unit char(2) NOT NULL,
    City varchar(128) NOT NULL,
    Price number NOT NULL,
    Type varchar(5) CHECK (TYPE IN ('house' ,'flat')),
    NumBedrooms int NOT NULL,
    Description clob);

CREATE TABLE Customer(
    Id int NOT NULL PRIMARY KEY,
    Name varchar(128) ,
    PhoneNumber char(10),
    CONSTRAINT AK_Customer UNIQUE (PhoneNumber)
);

CREATE TABLE ForSale(
    PropertyId int NOT NULL,
    OfficeId int NOT NULL,
    CONSTRAINT PK_ForSale PRIMARY KEY (PropertyId, OfficeId),
    CONSTRAINT FK_ForSale1 Foreign Key (PropertyId) REFERENCES Property(Id),
    CONSTRAINT FK_ForSale2 Foreign Key (OfficeId) REFERENCES Office(Id)
);

CREATE TABLE ForRent(
    PropertyId int NOT NULL,
    OfficeId int NOT NULL,
    CONSTRAINT PK_ForRent PRIMARY KEY (PropertyId, OfficeId),
    CONSTRAINT FK_ForRent1 Foreign Key (PropertyId) REFERENCES Property(Id),
    CONSTRAINT FK_ForRent2 Foreign Key (OfficeId) REFERENCES Office(Id)
);



CREATE TABLE Sold (
    PropertyId int NOT NULL,
    OfficeId int NOT Null,
    CustomerId NOT NULL,
    CONSTRAINT PK_Sold PRIMARY KEY (PropertyId, OfficeId,CustomerId),
    CONSTRAINT FK_Sold1 FOREIGN KEY (PropertyId) REFERENCES Property(Id),
    CONSTRAINT FK_Sold2 FOREIGN KEY (OfficeId) REFERENCES Office(Id),
    CONSTRAINT FK_Sold3 FOREIGN KEY (CustomerId) REFERENCES Customer(Id)
);


INSERT ALL 
INTO Agency VALUES (1,'Westways Estate Agents', 7594081236)
INTO Agency VALUES (2,'Barnard Marcus Estate Agents', 7992133236)
INTO Agency VALUES (3,'Knightsbridge Estate - Luxury Property Agency', 7511581236)
INTO Agency VALUES (4,'Paramount Properties', 7352312364)
INTO Agency VALUES (5,'Foxtons Estate Agents', 7430081236)
INTO Agency VALUES (6,'Newington Estates', 7794003498)
INTO Agency VALUES (7,'Robertson Smith & Kempson Estate Agents', 7657605201)
INTO Agency VALUES (8,'Jaxton Estate Agents', 7446623235)
INTO Agency VALUES (9,'Go View London', 7162958264)
INTO Agency VALUES(10,'Winkworth Estate Agents', 7865767422)
SELECT * FROM dual;

INSERT ALL
INTO Office VALUES (1, 1, 'C', 2, 5, 'NS', '7594081236')
INTO Office VALUES (2, 2, 'A', 3, 3, 'WD', '7992133236')
INTO Office VALUES (3, 3, 'B', 5, 1, 'DJ', '7511581236')
INTO Office VALUES (4, 4, 'E', 8, 2, 'UN', '7352312364')
INTO Office VALUES (5, 5, 'G', 9, 6, 'UZ', '7430081236')
INTO Office VALUES (6, 6, 'M', 1, 7, 'KX', '7794003498')
INTO Office VALUES (7, 7, 'D', 6, 9, 'TA', '7657605201')
INTO Office VALUES (8, 8, 'F', 2, 1,'HD', '7446623235')
INTO Office VALUES (9, 9, 'S', 7, 8,'AP', '7162958264')
INTO Office VALUES (10, 10, 'H', 6, 4,'WR', '7865767422')
SELECT * FROM dual;


INSERT ALL
INTO Property VALUES (1, 'C', 2, 5, 'NS', 'London', 650000, 'house', 3, 'A 3bhk house in a beautiful neighbourhood in London')
INTO Property VALUES (2, 'A', 3, 3, 'WD', 'Birmingham', 375000, 'house', 3, 'A 3bhk house in a beautiful neighbourhood in Birmingham')
INTO Property VALUES (3, 'B', 5, 1, 'DJ', 'Glassgow', 275000, 'flat', 2, 'A 2bhk flat in a beautiful neighbourhood in Glassgow')
INTO Property VALUES (4, 'E', 8, 2, 'UN', 'Bristol', 220000, 'flat', 2, 'A 2bhk flat in a beautiful neighbourhood in Bristol')
INTO Property VALUES (5, 'G', 9, 6, 'UZ', 'Manchester', 450000, 'house', 4, 'A 4bhk house in a beautiful neighbourhood in Manchester')
INTO Property VALUES (6, 'M', 1, 7, 'KX', 'Liverpool', 250000, 'flat', 2, 'A 2bhk flat in a beautiful neighbourhood in Liverpool')
INTO Property VALUES (7, 'D', 6, 9, 'TA', 'Leeds', 345000, 'house', 3, 'A 3bhk house in a beautiful neighbourhood in Leeds')
INTO Property VALUES (8, 'F', 2, 1, 'HD', 'Newcastle', 220000, 'house', 1, 'A 1bhk house in a beautiful neighbourhood in Newcastle')
INTO Property VALUES (9, 'S', 7, 8, 'AP', 'Bristol', 200000, 'flat', 2, 'A 2bhk flat in a beautiful neighbourhood in Bristol')
INTO Property VALUES (10, 'H', 6, 4, 'WR', 'Sheffield', 120000, 'flat', 1, 'A 1bhk flat in a beautiful neighbourhood in Sheffield')
INTO Property VALUES (11, 'F', 2, 5, 'WS', 'Birmingham', 650000, 'house', 3, 'A 3bhk house in a beautiful neighbourhood in Birmingham')
INTO Property VALUES (12, 'Q', 3, 3, 'ND', 'London', 475000, 'house', 3, 'A 3bhk house in a beautiful neighbourhood in London')
INTO Property VALUES (13, 'T', 5, 1, 'BJ', 'Bristol', 175000, 'flat', 2, 'A 2bhk flat in a beautiful neighbourhood in Bristol')
INTO Property VALUES (14, 'V', 8, 2, 'WN', 'Glassgow', 120000, 'flat', 2, 'A 2bhk flat in a beautiful neighbourhood in Glassgow')
INTO Property VALUES (15, 'N', 9, 6, 'AZ', 'Manchester', 550000, 'house', 4,'A 4bhk house in a beautiful neighbourhood in Manchester')
INTO Property VALUES (16, 'Y', 1, 7, 'WX', 'Newcastle', 150000, 'flat', 2, 'A 2bhk flat in a beautiful neighbourhood in Newcastle')
INTO Property VALUES (17, 'R', 6, 9, 'BA', 'Leeds', 445000, 'house', 3, 'A 3bhk house in a beautiful neighbourhood in Leeds')
INTO Property VALUES (18, 'L', 2, 1, 'JD', 'Liverpool', 200000, 'house', 1, 'A 1bhk house in a beautiful neighbourhood in Liverpool')
INTO Property VALUES (19, 'Z', 7, 8, 'ZP', 'Bristol', 100000, 'flat', 2, 'A 2bhk flat in a beautiful neighbourhood in Bristol')
INTO Property VALUES (20, 'T', 6, 4, 'HR', 'Sheffield', 120000, 'flat', 1, 'A 1bhk flat in a beautiful neighbourhood in Sheffield')
SELECT * FROM dual;


INSERT ALL
INTO Customer VALUES (1,'Buso', 7605081236)
INTO Customer VALUES (2,'Harveer', 7564933236)
INTO Customer VALUES (3,'Supachai', 7345681236)
INTO Customer VALUES (4,'Syed', 7194312364)
INTO Customer VALUES (5,'Damon', 7390181236)
INTO Customer VALUES (6,'Freya', 7990003498)
INTO Customer VALUES (7,'Thor', 7895105201)
INTO Customer VALUES (8,'Kratos', 7909123235)
INTO Customer VALUES (9,'Loki', 7404158264)
INTO Customer VALUES (10,'Mimir', 7649267422)
SELECT * FROM dual;


INSERT ALL
INTO ForRent VALUES (3, 5)
INTO ForRent VALUES (4, 1)
INTO ForRent VALUES (6, 6)
INTO ForRent VALUES (9, 4)
INTO ForRent VALUES (10, 8)
INTO ForRent VALUES (13, 10)
INTO ForRent VALUES (14, 4)
INTO ForRent VALUES (16, 6)
INTO ForRent VALUES (19, 7)
INTO ForRent VALUES (20, 1)
SELECT * FROM dual;

INSERT ALL
INTO ForSale VALUES (1, 2)
INTO ForSale VALUES (2, 2)
INTO ForSale VALUES (5, 3)
INTO ForSale VALUES (7, 6)
INTO ForSale VALUES (8, 9)
INTO ForSale VALUES (11, 10)
INTO ForSale VALUES (12, 5)
INTO ForSale VALUES (15, 6)
INTO ForSale VALUES (17, 2)
INTO ForSale VALUES (18, 8)
INTO ForSale VALUES (3, 5)
INTO ForSale VALUES (4, 1)
INTO ForSale VALUES (6, 6)
INTO ForSale VALUES (9, 4)
INTO ForSale VALUES (10, 8)
INTO ForSale VALUES (13, 10)
INTO ForSale VALUES (14, 4)
INTO ForSale VALUES (16, 6)
INTO ForSale VALUES (19, 7)
INTO ForSale VALUES (20, 1)
SELECT * FROM dual;

INSERT ALL
INTO SOLD VALUES (1, 2, 2)
INTO SOLD VALUES (8, 9, 4)
INTO SOLD VALUES (11, 10, 5)
INTO SOLD VALUES (17, 2, 8)
INTO SOLD VALUES (18, 8, 9)
INTO SOLD VALUES (15, 6, 1)
INTO SOLD VALUES (9, 4, 6)
INTO SOLD VALUES (3, 5, 3)
INTO SOLD VALUES (16, 6,  7)
INTO SOLD VALUES (20, 1, 10)
SELECT * FROM dual;




/* Finds the average number of bedrooms from the property table where the type of property is a house 
This is a basic but non-trivial query because 
it uses the function AVG() to find the average number of bedrooms for houses in the Property table
*/
SELECT AVG(NUMBEDROOMS) FROM PROPERTY WHERE TYPE = 'house';

/*Finds the price of the most expensive property that has been sold to a customer
This is a basic but non-trivial query because it uses both the function MAX() and 
a join statement to find the most expensive property that has been sold to someone by one of the agencies
*/
SELECT MAX(P.PRICE) 
FROM PROPERTY P 
JOIN SOLD S ON S.PROPERTYID = P.ID;


/* 
This is medium query as seen in the use of a complex join(outer join) and a group by statement to 
find the number of properties sold by each agency using the SOLD Table and the Office Table  
*/
SELECT O.ID,COUNT(O.AGENCYID)
FROM OFFICE O
FULL OUTER JOIN SOLD S
ON O.ID = S.OFFICEID
GROUP BY O.ID;

/*
This is medium query as seen in the use of a complex join(outer join) and a group by statement to 
the number of properties each office has for rent and for sale currently using the ForRent Table and the ForSale
*/

SELECT O.ID,COUNT(R.OFFICEID)
FROM ForRent R
FULL OUTER JOIN ForSale S
ON R.OFFICEID = S.OFFICEID
LEFT JOIN OFFICE O ON O.ID = R.OFFICEID
GROUP BY O.ID;

/* 
This is a medium query as seen in the use of a complex join (outer join) and a group by statement
(along with the aggregation, COUNT()) to
find the total number of bedrooms available to rent
*/ 

SELECT SUM(P.NUMBEDROOMS)
FROM PROPERTY P
FULL OUTER JOIN FORRENT F
ON P.ID = F.PROPERTYID
WHERE F.PROPERTYID IS NOT NULL
GROUP BY P.ID;

/* 
This is an advanced query as seen in its use aggregations
and nested queries to find the postcode and prices of each property that is for sale 
and is worth more than the average price of the properties in the ForSale table
*/
SELECT P.ID,P.AREA,P.DISTRICT,P.SECTOR,P.UNIT,P.PRICE
FROM PROPERTY P
INNER JOIN FORSALE F ON F.PROPERTYID = P.ID
WHERE P.PRICE > (SELECT AVG(P.PRICE) FROM PROPERTY P
INNER JOIN FORSALE F ON F.PROPERTYID = P.ID);

/*
Find the sum of properties for sale where the district is greater than the average district of properties for sale.
Nested query used after the WHERE clause
Aggregations used after SELECT clauses, SUM() and AVG()
*/
SELECT SUM(P.PRICE) 
FROM PROPERTY P 
INNER JOIN FORSALE F 
ON P.ID = F.PROPERTYID 
WHERE P.DISTRICT > (SELECT AVG(P.DISTRICT) 
FROM PROPERTY P 
INNER JOIN FORSALE F ON P.ID = F.PROPERTYID);

/*
Select ID, AREA, DISTRICT, SECTOR, UNIT of properties in Bristol for rent where number of rooms is greater than the average number of rooms of properties to rent
This is an advanced query as seen in the use of a nested query used after the WHERE clause
and the aggregation used after SELECT clause, AVG()
*/
SELECT P.ID, P.AREA, P.DISTRICT, P.SECTOR, P.UNIT 
FROM PROPERTY P 
INNER JOIN FORRENT F 
ON P.ID = F.PROPERTYID 
WHERE P.NUMBEDROOMS > (SELECT AVG(P.NUMBEDROOMS) 
FROM PROPERTY P 
INNER JOIN FORRENT F 
ON P.ID = F.PROPERTYID) 
AND P.CITY = 'Bristol';