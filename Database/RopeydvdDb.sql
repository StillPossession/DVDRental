

CREATE TABLE Users (
    UserNumber int NOT NULL,
	UserName varChar(100) NOT NULL,
	User_Role int NOT NULL,
	UserPassword varChar(50) NOT NULL,
	PRIMARY KEY (UserNumber),
	CONSTRAINT FK_UserRole FOREIGN KEY (User_Role)
    REFERENCES User_Roles(User_Role_Id)  
);

CREATE TABLE User_Roles (
    User_Role_Id int NOT NULL,
	Role varChar(50) NOT NULL,
	PRIMARY KEY (User_role_Id)  
);

CREATE TABLE Studios (
    Studio_Id int NOT NULL,
	Studio varChar(100) NOT NULL,
	PRIMARY KEY (Studio_Id)  
);

CREATE TABLE Producer (
    Producer_Id int NOT NULL,
	Producer_Name varChar(100) NOT NULL,
	PRIMARY KEY (Producer_Id)  
);


CREATE TABLE Actors (
    Actor_Id int NOT NULL,
	Actor_First_Name varChar(100) NOT NULL,
	Actor_Last_Name varChar(100) NOT NULL,
	PRIMARY KEY (Actor_Id)  
);


INSERT INTO User_Roles (User_Role_Id, Role)
VALUES (1,'Assistant');
INSERT INTO User_Roles (User_Role_Id, Role)
VALUES (2,'Manager');



INSERT INTO Users (UserNumber, UserName, User_Role, UserPassword)
VALUES (1,'Assistant1', '1', 'Assistant1@123');
INSERT INTO Users (UserNumber, UserName, User_Role, UserPassword)
VALUES (2,'Manager1', '2', 'Manager1@123');



CREATE TABLE Movies (
    Movie_Id int NOT NULL,
	Movie_Name varChar(100) NOT NULL,
	Producer int NOT NULL,
	Studio int NOT NULL,
	Release_Date varChar(50) NOT NULL,
	Is_Age_Restricted bit,
	PRIMARY KEY (Movie_Id),
    CONSTRAINT FK_ProducerID FOREIGN KEY (Producer)
    REFERENCES Producers(Producer_Id),
	CONSTRAINT FK_StudioID FOREIGN KEY (Studio)
    REFERENCES Studios(Studio_Id)
);

;

CREATE TABLE Movie_Cast (
	Movie int NOT NULL,
	Cast_Member int NOT NULL,
    CONSTRAINT FK_MovieID FOREIGN KEY (Movie)
    REFERENCES Movies(Movie_Id),
	CONSTRAINT FK_ActorId FOREIGN KEY (Cast_Member)
    REFERENCES Actors(Actor_Id)
);

CREATE TABLE Membership_Category (
    Mem_Cat_Id int NOT NULL,
	Mem_Cat_Title varChar(100) NOT NULL,
	Max_Dvd_Loans int NOT NULL,
	PRIMARY KEY (Mem_Cat_Id)  
);

CREATE TABLE Members (
	Member_Id int NOT NULL,
	Member_Contact varChar(80) NOT NULL,
	Member_Age int NOT NULL,
	Membership_Category int NOT NULL,
	Member_First_Name varChar(80) NOT NULL,
	Member_Last_Name varChar(80) NOT NULL,
	Member_Address varChar(80) NOT NULL,
	PRIMARY KEY (Member_Id),  
    CONSTRAINT FK_MemCatId FOREIGN KEY (Membership_Category)
    REFERENCES Membership_Category(Mem_Cat_Id)	
);


CREATE TABLE Loan_Types (
    Loan_Type_Id int NOT NULL,
	Loan_Type varChar(50) NOT NULL,
	PRIMARY KEY (Loan_Type_Id)  
);

CREATE TABLE Loans (
    Loan_Id int NOT NULL,
	Loan_Type int NOT NULL,
	Movie int NOT NULL,
	Copy_Num int NOT NULL,
	Member_Num int NOT NULL,		 
	Date_Out varChar(80) NOT NULL,
	Date_Due varChar(80) NOT NULL,
	Date_Returned varChar(80) NOT NULL,
	Duration int NOT NULL,
	Total_Charge int NOT NULL,	
	PRIMARY KEY (Loan_Id),
    CONSTRAINT FK_LoanTypeId FOREIGN KEY (Loan_Type)
    REFERENCES Loan_Types(Loan_Type_Id),
	CONSTRAINT FK_MemberId FOREIGN KEY (Member_Num)
    REFERENCES Members(Member_Id),
	CONSTRAINT FK_Movie_Id FOREIGN KEY (Movie)
    REFERENCES Movies(Movie_Id)
);


CREATE TABLE Dvd_Stock (
    Dvd_Stock_Id int NOT NULL,
	Dvd_Movie_Id int NOT NULL,
	Dvd_Copy_No varChar(80) NOT NULL,
	Is_Loaned bit,
	Dvd_Price varChar(80) NOT NULL,		 
	Date_Added varChar(80) NOT NULL,	
	PRIMARY KEY (Dvd_Stock_Id),
    CONSTRAINT FK_DvdStockId FOREIGN KEY (Dvd_Movie_Id)
    REFERENCES Movies(Movie_Id)	
);




