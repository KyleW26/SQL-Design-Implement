-- Hospital Physical Design
-- Mathew Kyle Williams

INSERT INTO Hospital
VALUES ('12345', 'Bangor Hospital', 'LL57 2PW', '01248 384384', 'ysbytygwynedd@betsicadwalader.ac.uk', 'Stephen Pritchard');

INSERT INTO Hospital
VALUES ('12293', 'Penrhos Stanley', 'LL65 2QA', '01407 766000', 'penrhosstanley@betsicadwalader.ac.uk', 'Susan Jenkins');

INSERT INTO Staff
VALUES ('00001', 'Jessica', 'Thomas', '10000', 'Student Nurse');

INSERT INTO Staff
VALUES ('00002', 'Jonathan', 'Davies', '30000', 'Senior Consultant');

INSERT INTO Staff
VALUES ('00003', 'David', 'Williams', '45000', 'Doctor');

INSERT INTO Staff
VALUES ('00004', 'Jeniffer', 'Stephens', '23000', 'Nurse');

INSERT INTO Staff
VALUES ('00005', 'Sharon', 'Evans', '12000', 'Receptionist');

INSERT INTO Staff 
VALUES ('00006', 'Stephen', 'Pritchard', '47374', 'Manager');

INSERT INTO Staff
VALUES ('00007', 'Susan', 'Jenkins', '47374', 'Manager');

INSERT INTO Staff
VALUES ('00008', 'Jonathan', 'Roberts', '30000', 'Consultant');

INSERT INTO Patient
VALUES ('JB 51 71 23', 'Jeremy', 'Scott', '1973-02-23', 'Male');

INSERT INTO Patient
VALUES ('CL 44 47 46', 'Chloe', 'Evans', '1997-11-07', 'Female');

INSERT INTO Medication
VALUES ('NHS-31-20-34', 'Co-Codamol', 'Makes patient groggy, DO NOT Drive for 4 hours after taking');

INSERT INTO Medication
VALUES ('NHS-01-23-43', 'Paracetamol', 'No Contra-indications');

INSERT INTO Medication
VALUES ('NHS-32-42-12', 'Zenelop', 'Head injury or pregnant');

INSERT INTO Medication
VALUES ('NHS-30-23-59', 'Zanaflex', 'Can be taken with or without food, but this choice must be stuck to');

INSERT INTO Ward
VALUES ('YG-001', '12345', 'High Dependency Unit', 'For people in need of critical care');

INSERT INTO Ward
VALUES ('YG-002', '12345', 'Intensive Care Unit', 'For people who have undergone intensive therapy');

INSERT INTO Ward
VALUES ('PS-001', '12293', 'Minor Injuries', 'For people who are not badly injured');

INSERT INTO Ward
VALUES ('YG-003', '12293', 'Coronory Care', 'People with heart problems');

INSERT INTO Ward
VALUES ('PS-002', '12345', 'Coronory Care', 'People with heart problems');

INSERT INTO HospitalPatients
VALUES ('12293', 'JB 51 71 23', 'Debra Scott', '07936273641', '2018-04-04', '2018-04-06', 'Requires specialist care during his stay');

INSERT INTO HospitalPatients
VALUES ('12345', 'CL 44 47 46', 'Claire Evans', '07463726354', '2018-02-27', '2018-03-01', 'Nothing major to be concerned about');

INSERT INTO HospitalStaff
SELECT DISTINCT s.staffID, h.hospitalID, s.staffPosition
FROM Staff s, Hospital h;

INSERT INTO MedicationGiven
VALUES ('00002', 'JB 51 71 23', 'NHS-31-20-34', '2018-04-02', '20mg', '3 tablets a day, 1 with between each meal');

INSERT INTO MedicationGiven
VALUES ('00003', 'CL 44 47 46', 'NHS-30-23-59', '2018-03-16', '15mg', '1 Tablet every morning');

INSERT INTO PatientsOnWard
VALUES ('YG-001', 'JB 51 71 23');

INSERT INTO PatientsOnWard
VALUES ('PS-001', 'CL 44 47 46');

