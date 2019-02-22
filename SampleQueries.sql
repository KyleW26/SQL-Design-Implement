-- Hospital Physical Design
-- Mathew Kyle Williams

-- a) CONTRA INDICATIONS --
-- Paracetamol Conta-indications
SELECT medicationCD
FROM Medication
WHERE medicationID = 'NHS-01-23-43';

-- Zanaflex Contra-indications
SELECT medicationCD
FROM Medication
WHERE medicationID = 'NHS-30-23-59';

-- CoCodamol Contra-indications
SELECT medicationCD
FROM Medication
WHERE medicationID = 'NHS-31-20-34';

-- b) Average Salary of all consultants --
SELECT staffID, staffSalary
FROM Staff
WHERE staffPosition = 'Consultant';

-- c) Get hospitals with coronory care --
SELECT DISTINCT w.wardName, h.hospitalName
FROM Ward w, Hospital h
WHERE wardName = 'Coronory Care';

-- e) Get next of Kin details for a specific patient --
SELECT DISTINCT NOKName, NOKNumber
FROM HospitalPatients
WHERE patientID = 'CL 44 47 46';

-- f) Get the name of the doctor who precribed a specific medication to a patient -- 
SELECT DISTINCT s.staffForename, s.staffSurname
FROM Staff s, MedicationGiven mg
WHERE s.staffID = mg.staffID 
AND mg.medicationID = 'NHS-31-20-34';

-- g) Get all notes for a specific patient for all their stays in a specific hospital --
SELECT DISTINCT patientNotes
FROM HospitalPatients
WHERE hospitalID = '12293' AND patientID='JB 51 71 23';

-- h) Get all medication where the contra-indication contains head injury --
SELECT DISTINCT medicationID, medicationName, medicationCD
FROM Medication
WHERE medicationCD LIKE '%Head injury%';