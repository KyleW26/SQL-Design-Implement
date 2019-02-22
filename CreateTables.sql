-- Hospital Physical Design
-- Mathew Kyle Williams

CREATE TABLE Hospital (
	hospitalID varchar(5) NOT NULL,
    hospitalName text(64),
    hospitalPostcode varchar(9) NOT NULL,
    hospitalPhone varchar(12) NOT NULL,
    hospitalEmail varchar(248),
    hospitalManager text(128),
    
    PRIMARY KEY (hospitalID)
) ENGINE = InnoDB;

CREATE TABLE Staff (
	staffID varchar(10) NOT NULL,
    staffForename text(64),
    staffSurname text(64) NOT NULL,
    staffSalary double,
    staffPosition text(64),
    INDEX (staffID, staffSalary, staffPosition),
    
    PRIMARY KEY (staffID)
) ENGINE = InnoDB;

CREATE TABLE Patient (
	patientID varchar(11) NOT NULL,
    patientForename text(64),
    patientSurname text(64) NOT NULL,
    patientBirthDate date NOT NULL,
    patientSex text(6),
    
    PRIMARY KEY (patientID)
) ENGINE = InnoDB;

CREATE TABLE Medication (
	medicationID varchar(64) NOT NULL,
    medicationName text(128) NOT NULL,
    medicationCD varchar(256),
    INDEX(medicationID, medicationCD),
    
    PRIMARY KEY (medicationID)
) ENGINE = InnoDB;

CREATE TABLE Ward (
	wardID varchar(10),
    hospitalID varchar(5),
    wardName varchar(64),
    wardSpecialism varchar(128),
    INDEX (hospitalID, wardName, wardSpecialism),
    
    PRIMARY KEY (wardID)
) ENGINE = InnoDB;

CREATE TABLE PatientsOnWard (
	wardID varchar(10),
    patientID varchar(11) NOT NULL,
     
    PRIMARY KEY (wardID, patientID),
    FOREIGN KEY (wardID) REFERENCES Ward(wardID),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE MedicationGiven (
	staffID varchar(10) NOT NULL,
    patientID varchar(11) NOT NULL,
    medicationID varchar(64) NOT NULL,
    medicationStart date NOT NULL,
    medicationDose varchar(5) NOT NULL,
    medicationFOA varchar(128) NOT NULL,
    INDEX (medicationID, medicationStart, medicationDose, medicationFOA),
    
    PRIMARY KEY(staffID, medicationID)
) ENGINE = InnoDB;

CREATE TABLE HospitalStaff (
	staffID varchar(10) NOT NULL,
    hospitalID varchar(5) NOT NULL,
    staffPosition varchar(64),
    
    PRIMARY KEY (hospitalID, staffID)
    -- FOREIGN KEY (staffID) REFERENCES Staff(staffID) ON DELETE CASCADE ON UPDATE CASCADE,
    -- FOREIGN KEY (hospitalID) REFERENCES Hospital(hospitalID) ON DELETE CASCADE ON UPDATE CASCADE,
	-- FOREIGN KEY (staffPosition) REFERENCES Staff(staffPosition) ON DELETE CASCADE ON UPDATE CASCADE 
) ENGINE = InnoDB;

CREATE TABLE HospitalPatients (
	hospitalID varchar(5) NOT NULL,
    patientID varchar(11) NOT NULL,
    NOKName varchar(128),
    NOKNumber varchar(11),
    admissionDate date,
    leavingDate date,
    patientNotes varchar(128),
    
    PRIMARY KEY (hospitalID, patientID),
    FOREIGN KEY (hospitalID) REFERENCES Hospital(hospitalID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (patientID) REFERENCES Patient(patientID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

ALTER TABLE Staff
ADD FOREIGN KEY (staffPosition) REFERENCES HospitalStaff(staffPosition) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Patient
ADD FOREIGN KEY (NOKName, NOKNumber) REFERENCES HospitalPatients(NOKName, NOKNumber) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Ward
ADD FOREIGN KEY (hospitalID) REFERENCES Hospital(hospitalID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE MedicationGiven
ADD FOREIGN KEY (staffID) REFERENCES Staff(staffID),
ADD FOREIGN KEY (medicationID) REFERENCES Medication(medicationID),
ADD FOREIGN KEY (patientID) REFERENCES Patient(patientID);

CREATE VIEW EmployeeRestrictions AS
SELECT staffForename, staffSurname, staffPosition FROM Staff;