CREATE TABLE FACT_CLIENT (
	ClientID int PRIMARY KEY,
	ClientFN varchar(40) Not Null,
	ClientLN varchar(40) Not Null,
	ClientEmail varchar(40) Not Null,
	ClientPhone int Not Null,
	ClientBirthDate date Not Null,
	ClientBackground boolean Not Null
	);

	
CREATE TABLE FACT_EMPLOYEE (
	EmpID int PRIMARY KEY,
	EmpFN varchar(40) Not Null,
	EmpLN varchar(40) Not Null,
	EmpEmail varchar(40) Not Null,
	EmpSSN int Not Null,
	Foreign Key (CenterID) References FACT_CENTER(CenterID),
	);


CREATE TABLE FACT_CENTER (
	CenterID int Primary Key,
	CenterName varchar(40) Not Null,
	CenterState varchar(40) Not Null,
	CenterCity varchar(30) Not Null,
	CenterStreet varchar(30) Not Null,
	CenterPhone int Not Null,
	);


CREATE TABLE FACT_PET (
	PetID int Primary Key,
	PetBirthDate date Not Null,
	PetName varchar(30) Not Null,
	Foreign Key CenterID References FACT_CENTER(CenterID),
	);

	
CREATE TABLE FACT_BREED (
	PetID int Not Null,
	BreedType varchar(30) Not Null,
	Primary Key (PetID, BreedType),
	Foreign Key PetID References FACT_PET(PetID),
	);


CREATE TABLE FACT_DROPSOFF (
	DropsOffDate date,
    PetID SMALLINT,
    ClientID SMALLINT,
    FOREIGN KEY(PetID) REFERENCES FACT_PET(PetID),
    FOREIGN KEY(ClientID) REFERENCES FACT_CLIENT(ClientID),
    PRIMARY KEY(DropsOffDate, PetID, ClientID)
	);


CREATE TABLE FACT_ADOPTS (
	AdoptionDate date,
    PetID SMALLINT,
    ClientID SMALLINT,
    FOREIGN KEY(PetID) REFERENCES FACT_PET(PetID),
    FOREIGN KEY(ClientID) REFERENCES FACT_CLIENT(ClientID),
    PRIMARY KEY(AdoptionDate, PetID, ClientID)
	);


CREATE TABLE FACT_MEDHISTORY (
    PetID SMALLINT,
   	MedicalReason VARCHAR(100),
    VistNum SMALLINT,
    FOREIGN KEY(PetID) REFERENCES FACT_PET(PetID),
    PRIMARY KEY(PetID, MedicalReason, VisitNum)
	);
    
