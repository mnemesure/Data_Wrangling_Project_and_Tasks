--updating each alert to status
update mnemesure.ic_bp
set bpalerts = 'Hypotension-1'
where bpalerts = 'Hypo1'

update mnemesure.ic_bp
set bpalerts = 'Hypotension-2'
where bpalerts = 'Hypo2'

update mnemesure.ic_bp
set bpalerts = 'Hypertension-1'
where bpalerts = 'HTN1'

update mnemesure.ic_bp
set bpalerts = 'Hypertension-2'
where bpalerts = 'HTN2'

update mnemesure.ic_bp
set bpalerts = 'Hypertension-3'
where bpalerts = 'HTN3'

select top 10 * from mnemesure.ic_bp


--add column and update column with dichotomous status
Alter table mnemesure.ic_bp
add BPControl nvarchar(55)

update mnemesure.ic_bp
set BPcontrol = 1
where bpalerts = 'Hypotension-1'

update mnemesure.ic_bp
set BPcontrol = 1
where bpalerts = 'Normal'


update mnemesure.ic_bp
set BPControl = 0
where bpalerts = 'Hypotension-2'


update mnemesure.ic_bp
set BPControl = 0
where bpalerts = 'Hypertension-1'


update mnemesure.ic_bp
set BPControl = 0
where bpalerts = 'Hypertension-2'


update mnemesure.ic_bp
set BPControl = 0
where bpalerts = 'Hypertension-3'

select top 10 * from mnemesure.ic_bp


select * into mnemesure.BPdemographics1 from demographics
INNER JOIN mnemesure.IC_BP on demographics.contactid = mnemesure.IC_BP.id
select top 10 * from qbs181.mnemesure.bpdemographics1


-- select values into table ordered by time
select contactid, observedtime, BPcontrol into mnemesure.OrderTime
from mnemesure.BPDemographics1
order by contactid, ObservedTime

-- select only the min time and contact id into table
select contactid as uniqueid,
min(observedtime) as minobservedtime into mnemesure.MinTime
from mnemesure.BPDemographics1
group by contactid


-- join the tables to have time as one column and min time as another
select * into mnemesure.bpweek1 from mnemesure.OrderTime
INNER JOIN mnemesure.mintime on mnemesure.ordertime.contactid = mnemesure.mintime.uniqueid

alter table mnemesure.bpweek1 add weeknumber nvarchar(55)

--make a column that has the week number
update mnemesure.bpweek1
set weeknumber = datediff(week, minobservedtime, observedtime) + 1

--make long table with avg score per week
select contactid, weeknumber,
avg(try_convert(numeric(3,0), bpcontrol)) as scoreavg
into mnemesure.bporderedavg
from mnemesure.bpweek1
group by weeknumber,contactid

--add columns for each week
alter table mnemesure.bporderedavg add week1 numeric(38,6)
alter table mnemesure.bporderedavg add week2 numeric(38,6)
alter table mnemesure.bporderedavg add week3 numeric(38,6)
alter table mnemesure.bporderedavg add week4 numeric(38,6)
alter table mnemesure.bporderedavg add week5 numeric(38,6)
alter table mnemesure.bporderedavg add week6 numeric(38,6)
alter table mnemesure.bporderedavg add week7 numeric(38,6)
alter table mnemesure.bporderedavg add week8 numeric(38,6)
alter table mnemesure.bporderedavg add week9 numeric(38,6)
alter table mnemesure.bporderedavg add week10 numeric(38,6)
alter table mnemesure.bporderedavg add week11 numeric(38,6)
alter table mnemesure.bporderedavg add week12 numeric(38,6)

--place values in columns
update mnemesure.bporderedavg
set week1 = scoreavg
where weeknumber = 1

update mnemesure.bporderedavg
set week2 = scoreavg
where weeknumber = 2

update mnemesure.bporderedavg
set week3 = scoreavg
where weeknumber = 3

update mnemesure.bporderedavg
set week4 = scoreavg
where weeknumber = 4

update mnemesure.bporderedavg
set week5 = scoreavg
where weeknumber = 5

update mnemesure.bporderedavg
set week6 = scoreavg
where weeknumber = 6

update mnemesure.bporderedavg
set week7 = scoreavg
where weeknumber = 7

update mnemesure.bporderedavg
set week8 = scoreavg
where weeknumber = 8

update mnemesure.bporderedavg
set week9 = scoreavg
where weeknumber = 9

update mnemesure.bporderedavg
set week10 = scoreavg
where weeknumber = 10

update mnemesure.bporderedavg
set week11 = scoreavg
where weeknumber = 11

update mnemesure.bporderedavg
set week12 = scoreavg
where weeknumber = 12



-- coerce into one row for each patient
select contactid,
avg(week1) as week1,
avg(week2) as week2,
avg(week3) as week3,
avg(week4) as week4,
avg(week5) as week5,
avg(week6) as week6,
avg(week7) as week7,
avg(week8) as week8,
avg(week9) as week9,
avg(week10) as week10,
avg(week11) as week11,
avg(week12) as week12
into mnemesure.twelveweekbp
from mnemesure.bporderedavg
group by contactid

select top 10 * from mnemesure.twelveweekbp




--add column thats difference between week 1 and week 12
alter table mnemesure.twelveweekbp add twelvewkdiff numeric(38,6)

update mnemesure.twelveweekbp
set twelvewkdiff = week12-week1

select top 10 * from mnemesure.twelveweekbp



--add dichotomous column for improvement vs no improvement
alter table mnemesure.twelveweekbp add controlchg numeric(38,6)

--if the difference between week 1 and week 0 is positive there was improvement
update mnemesure.twelveweekbp
set controlchg = 0
where twelvewkdiff <= 0

update mnemesure.twelveweekbp
set controlchg = 1
where twelvewkdiff > 0

select controlchg,
count(controlchg) as oneisimproved
from mnemesure.twelveweekbp
group by controlchg


--merge demographics and chronicconditions
select * into mnemesure.ChronicDemo from demographics
inner join ChronicConditions on demographics.contactid = chronicconditions.tri_patientid

--merge the first merged table with text messages
select * into mnemesure.TDCjoin from mnemesure.chronicdemo
inner join text on mnemesure.chronicdemo.contactid = text.tri_contactid

--create new table with unique contact id and last text send date
select contactid as contactidunique,
max(Textsentdate) as lasttextdate into mnemesure.LastTextID1 from mnemesure.TDCjoin
group by contactid

--join the unique contact ids and last text table with the all inclusive table
--to get all the information and just the last text sent date
select * into mnemesure.TDCLastText1 from mnemesure.TDCjoin
inner join mnemesure.LastTextID1 on mnemesure.TDCjoin.TextSentDate = mnemesure.LastTextID1.lasttextdate and mnemesure.TDCjoin.contactid = mnemesure.LastTextID1.contactidunique

--create table with final output
select distinct * into mnemesure.FinalOutput from mnemesure.TDCLastText1

select top 10 * from mnemesure.finaloutput

