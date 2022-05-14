CREATE PROC StudiosCreate
@Studio_Id int,
@Studio varchar(100)
AS	
BEGIN 
INSERT INTO Studios(Studio_Id,Studio)
VALUES (@Studio_Id,@Studio)
END

CREATE PROC StudiosUpdate
@Studio_Id int,
@Studio varchar(100)
AS	
BEGIN 
UPDATE Studios
SET	
Studio=@Studio
WHERE Studio_Id= @Studio_Id
END



CREATE PROC StudiosViewById
@Studio_Id int
AS
	BEGIN
	SELECT *
	FROM Studios
	WHERE Studio_Id = @Studio_Id
	END


CREATE PROC StudiosViewAll
AS
	BEGIN
	SELECT *
	FROM Studios
	END



CREATE PROC StudiosDeleteById
@Studio_Id int
AS
	BEGIN
	DELETE FROM Studios
	WHERE Studio_Id = @Studio_Id
	END


CREATE PROC ProducersCreate
@Producer_Id int,
@Producer_Full_Name varchar(100)
AS	
BEGIN 
INSERT INTO Producers(Producer_Id,Producer_Full_Name)
VALUES (@Producer_Id,@Producer_Full_Name)
END

CREATE PROC ProducersUpdate
@Producer_Id int,
@Producer_Full_Name varchar(100)
AS	
BEGIN 
UPDATE Producers
SET	
Producer_Full_Name=@Producer_Full_Name
WHERE Producer_Id= @Producer_Id
END



CREATE PROC ProducersViewById
@Producer_Id int
AS
	BEGIN
	SELECT *
	FROM Producers
	WHERE Producer_Id = @Producer_Id
	END


CREATE PROC ProducersViewAll
AS
	BEGIN
	SELECT *
	FROM Producers
	END



CREATE PROC ProducersDeleteById
@Producer_Id int
AS
	BEGIN
	DELETE FROM Producers
	WHERE Producer_Id = @Producer_Id
	END	

CREATE PROC ActorsCreate
@Actor_Id int,
@Actor_First_Name varchar(100),
@Actor_Last_Name varchar(100)
AS	
BEGIN 
INSERT INTO Actors(Actor_Id,Actor_First_Name,Actor_Last_Name)
VALUES (@Actor_Id,@Actor_First_Name,@Actor_Last_Name)
END

CREATE PROC ActorsUpdate
@Actor_Id int,
@Actor_First_Name varchar(100),
@Actor_Last_Name varchar(100)
AS	
BEGIN
UPDATE Actors
SET	
Actor_First_Name=@Actor_First_Name,
Actor_Last_Name=@Actor_Last_Name
WHERE Actor_Id= @Actor_Id
END


CREATE PROC ActorsViewById
@Actor_Id int
AS
	BEGIN
	SELECT *
	FROM Actors
	WHERE Actor_Id = @Actor_Id
	END


CREATE PROC ActorsDeleteById
@Actor_Id int
AS
	BEGIN
	DELETE FROM Actors
	WHERE Actor_Id = @Actor_Id
	END


CREATE PROC ActorsViewAll
AS
	BEGIN
	SELECT *
	FROM Actors
	END



CREATE PROC ActorsCreateOrUpdate
@Actor_Id int,
@Actor_First_Name varchar(100),
@Actor_Last_Name varchar(100)
AS
BEGIN
IF (@Actor_Id=0)
	BEGIN 
	INSERT INTO Actors(Actor_Id,Actor_First_Name,Actor_Last_Name)
	VALUES (@Actor_Id,@Actor_First_Name,@Actor_Last_Name)
	END
ELSE
	BEGIN
	UPDATE Actors
	SET	
		Actor_First_Name=@Actor_First_Name,
		Actor_Last_Name=@Actor_Last_Name
	WHERE Actor_Id= @Actor_Id
	END
END



CREATE PROC listViewCastMemBProc
AS
	BEGIN
	SELECT Actor_Id, CONCAT(Actor_First_Name,' ', Actor_Last_Name) AS fullname_actor
	FROM Actors
	END


CREATE PROC DDLProducer
AS
	BEGIN
	SELECT *
	FROM Producers
	END


CREATE PROC DDLStudio
AS
	BEGIN
	SELECT *
	FROM Studios
	END



CREATE PROC MembershipCatCreate
@Mem_Cat_Id int,
@Mem_Cat_Title varchar(100),
@Max_Dvd_Loans int
AS	
BEGIN 
INSERT INTO Membership_Category(Mem_Cat_Id,Mem_Cat_Title,Max_Dvd_Loans)
VALUES (@Mem_Cat_Id,@Mem_Cat_Title,@Max_Dvd_Loans)
END

CREATE PROC MembershipCatUpdate
@Mem_Cat_Id int,
@Mem_Cat_Title varchar(100),
@Max_Dvd_Loans int
AS	
BEGIN 
UPDATE Membership_Category
SET	
Mem_Cat_Title=@Mem_Cat_Title,
Max_Dvd_Loans=@Max_Dvd_Loans
WHERE Mem_Cat_Id= @Mem_Cat_Id
END



CREATE PROC MembershipCatViewById
@Mem_Cat_Id int
AS
	BEGIN
	SELECT *
	FROM Membership_Category
	WHERE Mem_Cat_Id = @Mem_Cat_Id
	END


CREATE PROC MembershipCatViewAll
AS
	BEGIN
	SELECT *
	FROM Membership_Category
	END



CREATE PROC MembershipCatDeleteById
@Mem_Cat_Id int
AS
	BEGIN
	DELETE FROM Membership_Category
	WHERE Mem_Cat_Id = @Mem_Cat_Id
	END


CREATE PROC DDLmembershipCategory
AS
	BEGIN
	SELECT *
	FROM Membership_Category
	END


CREATE PROC MembersCreate
@Member_Id int,
@Member_Contact varChar(80),
@Member_Age int,
@Membership_Category int,
@Member_First_Name varChar(80),
@Member_Last_Name varChar(80),
@Member_Address varChar(80)
AS	
BEGIN 
INSERT INTO Members(Member_Id,Member_Contact,Member_Age,Membership_Category,Member_First_Name,Member_Last_Name,Member_Address)
VALUES (@Member_Id,@Member_Contact,@Member_Age,@Membership_Category,@Member_First_Name,@Member_Last_Name,@Member_Address)
END



CREATE PROC MembersUpdate
@Member_Id int,
@Member_Contact varChar(80),
@Member_Age int,
@Membership_Category int,
@Member_First_Name varChar(80),
@Member_Last_Name varChar(80),
@Member_Address varChar(80)
AS	
BEGIN 
UPDATE Members
SET	
Member_Contact=@Member_Contact,
Member_Age=@Member_Age,
Membership_Category=@Membership_Category,
Member_First_Name=@Member_First_Name,
Member_Last_Name=@Member_Last_Name,
Member_Address=@Member_Address
WHERE Member_Id= @Member_Id
END



CREATE PROC MembersViewById
@Member_Id int
AS
	BEGIN
	SELECT *
	FROM Members
	WHERE Member_Id = @Member_Id
	END


CREATE PROC MembersViewAll
AS
	BEGIN
	SELECT *
	FROM Members
	END



CREATE PROC MembersDeleteById
@Member_Id int
AS
	BEGIN
	DELETE FROM Members
	WHERE Member_Id = @Member_Id
	END



CREATE PROC LoanTypesCreate
@Loan_Type_Id int,
@Loan_Type varChar(50)
AS	
BEGIN 
INSERT INTO Loan_Types(Loan_Type_Id,Loan_Type)
VALUES (@Loan_Type_Id,@Loan_Type)
END



CREATE PROC LoanTypesUpdate
@Loan_Type_Id int,
@Loan_Type varChar(50)
AS	
BEGIN 
UPDATE Loan_Types
SET	
Loan_Type=@Loan_Type
WHERE Loan_Type_Id= @Loan_Type_Id
END



CREATE PROC LoanTypesViewById
@Loan_Type_Id int
AS
	BEGIN
	SELECT *
	FROM Loan_Types
	WHERE Loan_Type_Id = @Loan_Type_Id
	END


CREATE PROC LoanTypesViewAll
AS
	BEGIN
	SELECT *
	FROM Loan_Types
	END



CREATE PROC LoanTypesDeleteById
@Loan_Type_Id int
AS
	BEGIN
	DELETE FROM Loan_Types
	WHERE Loan_Type_Id = @Loan_Type_Id
	END



CREATE PROC DDLmoviesToDVDStock
AS
	BEGIN
	SELECT *
	FROM Movies
	END

CREATE PROC DvdStockCreate
@Dvd_Stock_Id int,
@Dvd_Movie_Id int,
@Dvd_Copy_No varChar(80),
@Is_Loaned bit,
@Dvd_Price varChar(80),		 
@Date_Added varChar(80)
AS	
BEGIN 
INSERT INTO Dvd_Stock(Dvd_Stock_Id,Dvd_Movie_Id,Dvd_Copy_No,Is_Loaned,Dvd_Price,Date_Added)
VALUES (@Dvd_Stock_Id,@Dvd_Movie_Id,@Dvd_Copy_No,@Is_Loaned,@Dvd_Price,@Date_Added)
END



CREATE PROC DvdStockUpdate
@Dvd_Stock_Id int,
@Dvd_Movie_Id int,
@Dvd_Copy_No varChar(80),
@Is_Loaned bit,
@Dvd_Price varChar(80),		 
@Date_Added varChar(80)
AS	
BEGIN 
UPDATE Dvd_Stock
SET	
Dvd_Movie_Id=@Dvd_Movie_Id,
Dvd_Copy_No=@Dvd_Copy_No,
Is_Loaned=@Is_Loaned,
Dvd_Price=@Dvd_Price,
Date_Added=@Date_Added
WHERE Dvd_Stock_Id= @Dvd_Stock_Id
END



CREATE PROC AssistantCreate
@UserNumber int,
@UserName varChar(100),
@User_Role int,
@UserPassword varChar(50)
AS	
BEGIN 
INSERT INTO Users(UserNumber,UserName,User_Role,UserPassword)
VALUES (@UserNumber,@UserName,@User_Role,@UserPassword)
END

CREATE PROC AssistantUpdate
@UserNumber int,
@UserName varChar(100),
@User_Role int,
@UserPassword varChar(50)
AS	
BEGIN 
UPDATE Users
SET	
UserName=@UserName,
User_Role=@User_Role,
UserPassword=@UserPassword
WHERE UserNumber= @UserNumber
END



CREATE PROC AssistantViewById
@UserNumber int
AS
	BEGIN
	SELECT *
	FROM Users
	WHERE UserNumber = @UserNumber
	END


CREATE PROC AssistantViewAll
AS
	BEGIN
	SELECT *
	FROM Users
	where User_Role = 1
	END



CREATE PROC AssistantDeleteById
@UserNumber int
AS
	BEGIN
	DELETE FROM Users
	WHERE UserNumber = @UserNumber
	END



CREATE PROC ManagerCreate
@UserNumber int,
@UserName varChar(100),
@User_Role int,
@UserPassword varChar(50)
AS	
BEGIN 
INSERT INTO Users(UserNumber,UserName,User_Role,UserPassword)
VALUES (@UserNumber,@UserName,@User_Role,@UserPassword)
END

CREATE PROC ManagerUpdate
@UserNumber int,
@UserName varChar(100),
@User_Role int,
@UserPassword varChar(50)
AS	
BEGIN 
UPDATE Users
SET	
UserName=@UserName,
User_Role=@User_Role,
UserPassword=@UserPassword
WHERE UserNumber= @UserNumber
END



CREATE PROC ManagerViewById
@UserNumber int
AS
	BEGIN
	SELECT *
	FROM Users
	WHERE UserNumber = @UserNumber
	END


CREATE PROC ManagerViewAll
AS
	BEGIN
	SELECT *
	FROM Users
	where User_Role = 2
	END



CREATE PROC ManagerDeleteById
@UserNumber int
AS
	BEGIN
	DELETE FROM Users
	WHERE UserNumber = @UserNumber
	END