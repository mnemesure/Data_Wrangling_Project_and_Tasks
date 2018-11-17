--QUESTION1

Select * into mnemesure.MattHW2 from PhoneCall
Alter table mnemesure.MattHW2 add EnrollmentGroup NVARCHAR(255)

update mnemesure.MattHW2
set EnrollmentGroup = 'Clinical Alert'
where EncounterCode = 125060000

update mnemesure.MattHW2
set EnrollmentGroup = 'Health Coaching'
where EncounterCode = 125060001

update mnemesure.MattHW2
set EnrollmentGroup = 'Technical Question'
where EncounterCode = 125060002

update mnemesure.MattHW2
set EnrollmentGroup = 'Administrative'
where EncounterCode = 125060003

update mnemesure.MattHW2
set EnrollmentGroup = 'Other'
where EncounterCode = 125060004

update mnemesure.MattHW2
set EnrollmentGroup = 'Lack of Engagement'
where EncounterCode = 125060005


--QUESTION2
select mnemesure.MattHW2.EnrollmentGroup, 
count(customerID) as NumberRecords from mnemesure.MattHW2
group by enrollmentgroup

--QUESTION3
Select * into mnemesure.MattCallDuration from CallDuration

select * into mnemesure.join1 from mnemesure.MattCallDuration
inner join mnemesure.MattHW2 
on mnemesure.MattCallDuration.tri_CustomerIDEntityReference = mnemesure.MattHW2.CustomerId

--QUESTION4
select count(CallType) as Inbound from mnemesure.MattCallDuration where CallType = 1
select count(CallType) as Outbound from mnemesure.MattCallDuration where CallType = 2
select count(CallOutcome) as NoResponse from mnemesure.MattCallDuration where CallOutcome = 1
select count(CallOutcome) as LeftVoicemai from mnemesure.MattCallDuration where CallOutcome = 2
select count(CallOutcome) as Successful from mnemesure.MattCallDuration where CallOutcome = 3

select mnemesure.join1.EnrollmentGroup,
avg(callduration) as AverageCallDuration from mnemesure.join1
group by enrollmentgroup

--QUESTION5
select * into mnemesure.DemoJoin from Demographics
inner join ChronicConditions on Demographics.contactId = chronicconditions.tri_patientid

select * into mnemesure.AllJoin from mnemesure.DemoJoin
inner join text on mnemesure.DemoJoin.contactid = text.tri_contactid

select mnemesure.AllJoin.SenderName,
min(textsentdate) as Firsttext from mnemesure.AllJoin
Group by sendername

select mnemesure.AllJoin.SenderName,
min(textsentdate) as Firsttext from mnemesure.AllJoin
Group by sendername

select
datediff(week, '3/21/2016', '2/3/2017') as diffsystem,
datediff(week, '3/1/2016', '2/3/2017') as diffcustomer,
datediff(week, '2/7/2016', '2/3/2017') as diffclinician


select mnemesure.AllJoin.SenderName, 
count(textsentdate) as TotalTexts from mnemesure.AllJoin
group by SenderName


--QUESTION6
select mnemesure.AllJoin.tri_name,
min(textsentdate) as Firsttext from mnemesure.AllJoin
Group by tri_name

select mnemesure.AllJoin.tri_name,
max(textsentdate) as Lasttext from mnemesure.AllJoin
Group by tri_name

select
datediff(week, '2/7/2016', '2/3/2017') as diffactivitymonitoring,
datediff(week, '3/3/2016', '2/3/2017') as diffCOPD,
datediff(week, '3/7/2016', '2/3/2017') as diffdiabetes,
datediff(week, '3/2/2016', '2/3/2017') as diffHypertension,
datediff(week, '3/15/2016', '2/3/2017') as diffCongestiveHeartFailure


select mnemesure.AllJoin.tri_name,
count(textsentdate) as totaltext from mnemesure.AllJoin
group by tri_name