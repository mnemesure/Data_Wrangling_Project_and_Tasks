--QUESTION1

select tri_age as age,
gendercode as gender,
contactid as id,
Address1_Stateorprovince as state,
tri_imaginecareenrollmentemailsentdate as emailsentdate,
tri_enrollmentcompletedate as completedate,
tri_imaginecareenrollmentstatus as status,
datediff(day, try_convert(date, tri_imaginecareenrollmentemailsentdate),
try_convert(date, tri_enrollmentcompletedate)) as timetocomplete into mnemesure.MattHW1 from demographics

--QUESTION2

alter table mnemesure.MattHW1 add enrollment_status nvarchar(255)

update mnemesure.MattHW1
set enrollment_status = 'Complete' 
where status = 167410011

update mnemesure.MattHW1
set enrollment_status = 'Email Sent' 
where status = 167410001

update mnemesure.MattHW1
set enrollment_status = 'Non responder' 
where status = 167410004

update mnemesure.MattHW1
set enrollment_status = 'Facilitated Enrollment' 
where status = 167410005

update mnemesure.MattHW1
set enrollment_status = 'Incomplete Enrollments' 
where status = 167410002

update mnemesure.MattHW1
set enrollment_status = 'Opted Out' 
where status = 167410003

update mnemesure.MattHW1
set enrollment_status = 'Unprocessed' 
where status = 167410000

update mnemesure.MattHW1
set enrollment_status = 'Second email sent' 
where status = 167410006

--QUESTION3

alter table mnemesure.MattHW1 add Sex nvarchar(255)

update mnemesure.MattHW1
set Sex = 'Female'
where gender = '2'

update mnemesure.MattHW1
set Sex = 'Male'
where gender = '1'

update mnemesure.MattHW1
set Sex = 'Other'
where gender = '167410000'

update mnemesure.MattHW1
set Sex = 'Unknown'
where gender = 'NULL'

--QUESTION4

alter table mnemesure.MattHW1 add Age_Group NVARCHAR(255)

update mnemesure.MattHW1
set Age_Group = '0-25'
where age >= 0 and age < 25

update mnemesure.MattHW1
set Age_Group = '26-50'
where age >= 25 and age < 50

update mnemesure.MattHW1
set Age_Group = '51-75'
where age >= 50 and age < 75

update mnemesure.MattHW1
set Age_Group = '76-100'
where age >= 75 and age < 100
