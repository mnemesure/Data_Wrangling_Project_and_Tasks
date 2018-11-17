--counts of a few columns to make sure it matches the website

select mnemesure.datamidterm.[_DIQ172_],
count([_SEQN_]) as DIQ170count from mnemesure.datamidterm
group by [_DIQ172_]

select mnemesure.datamidterm.[_DIQ170_],
count([_SEQN_]) as DIQ170count from mnemesure.datamidterm
group by [_DIQ170_]

select mnemesure.datamidterm.[_DIQ275_],
count([_SEQN_]) as DIQ170count from mnemesure.datamidterm
group by [_DIQ275_]

select mnemesure.datamidterm.[_DIQ240_],
count([_SEQN_]) as DIQ170count from mnemesure.datamidterm
group by [_DIQ240_]

--updating numeric answes to yes/no/etc

update mnemesure.datamidterm
set [_DIQ010_] = 'yes'
where [_DIQ010_] = '1'

update mnemesure.datamidterm
set [_DIQ010_] = 'no'
where [_DIQ010_] = '2'

update mnemesure.datamidterm
set [_DIQ010_] = 'borderline'
where [_DIQ010_] = '3'

update mnemesure.datamidterm
set [_DIQ010_] = 'dont know'
where [_DIQ010_] = '9'




update mnemesure.datamidterm
set [_DIQ160_] = 'yes'
where [_DIQ160_] = '1'

update mnemesure.datamidterm
set [_DIQ160_] = 'no'
where [_DIQ160_] = '2'

update mnemesure.datamidterm
set [_DIQ160_] = 'dont know'
where [_DIQ160_] = '9'



update mnemesure.datamidterm
set [_DIQ170_] = 'yes'
where [_DIQ170_] = '1'

update mnemesure.datamidterm
set [_DIQ170_] = 'no'
where [_DIQ170_] = '2'

update mnemesure.datamidterm
set [_DIQ170_] = 'dont know'
where [_DIQ170_] = '9'


update mnemesure.datamidterm
set [_DIQ172_] = 'yes'
where [_DIQ172_] = '1'

update mnemesure.datamidterm
set [_DIQ172_] = 'no'
where [_DIQ172_] = '2'

update mnemesure.datamidterm
set [_DIQ172_] = 'refused'
where [_DIQ172_] = '7'

update mnemesure.datamidterm
set [_DIQ172_] = 'dont know'
where [_DIQ172_] = '9'


update mnemesure.datamidterm
set [_DIQ180_] = 'yes'
where [_DIQ180_] = '1'

update mnemesure.datamidterm
set [_DIQ180_] = 'no'
where [_DIQ180_] = '2'

update mnemesure.datamidterm
set [_DIQ180_] = 'refused'
where [_DIQ180_] = '7'

update mnemesure.datamidterm
set [_DIQ180_] = 'dont know'
where [_DIQ180_] = '9'




update mnemesure.datamidterm
set [_DIQ050_] = 'yes'
where [_DIQ050_] = '1'

update mnemesure.datamidterm
set [_DIQ050_] = 'no'
where [_DIQ050_] = '2'

update mnemesure.datamidterm
set [_DIQ050_] = 'refused'
where [_DIQ050_] = '7'

update mnemesure.datamidterm
set [_DIQ050_] = 'dont know'
where [_DIQ050_] = '9'



update mnemesure.datamidterm
set [_DIQ070_] = 'yes'
where [_DIQ070_] = '1'

update mnemesure.datamidterm
set [_DIQ070_] = 'no'
where [_DIQ070_] = '2'

update mnemesure.datamidterm
set [_DIQ070_] = 'refused'
where [_DIQ070_] = '7'

update mnemesure.datamidterm
set [_DIQ070_] = 'dont know'
where [_DIQ070_] = '9'




update mnemesure.datamidterm
set [_DIQ240_] = 'yes'
where [_DIQ240_] = '1'

update mnemesure.datamidterm
set [_DIQ240_] = 'no'
where [_DIQ240_] = '2'


update mnemesure.datamidterm
set [_DIQ275_] = 'yes'
where [_DIQ275_] = '1'

update mnemesure.datamidterm
set [_DIQ275_] = 'no'
where [_DIQ275_] = '2'

update mnemesure.datamidterm
set [_DIQ275_] = 'dont know'
where [_DIQ275_] = '9'



update mnemesure.datamidterm
set [_DIQ080_] = 'yes'
where [_DIQ080_] = '1'

update mnemesure.datamidterm
set [_DIQ080_] = 'no'
where [_DIQ080_] = '2'

update mnemesure.datamidterm
set [_DIQ080_] = 'dont know'
where [_DIQ080_] = '9'


--changing column names and adding the new columns for numeric values without the codes like 6666

select _SEQN_ as ID,
_DIQ010_ as HaveDiabetes,
_DID040_ as AgeWhenToldDiabetes,
_DIQ160_ as EverToldPreDiabetes,
_DIQ170_ as HealthRiskDiabetes,
_DIQ172_ as FeelatRisk,
_DIQ175A_ as FamilyHistory,
_DIQ175B_ as Overweight,
_DIQ175C_ as Age,
_DIQ175D_ as PoorDiet,
_DIQ175E_ as Race,
_DIQ175F_ as BabyOver9Lbs,
_DIQ175G_ as LackPhysicalAct,
_DIQ175H_ as HighBP,
_DIQ175I_ as HighBS,
_DIQ175J_ as HighChol,
_DIQ175K_ as Hypoglycemic,
_DIQ175L_ as Extremehunger,
_DIQ175M_ as TinglingHandsFeet,
_DIQ175N_ as BlurredVis,
_DIQ175O_ as Fatigue,
_DIQ175P_ as AnyoneAtRisk,
_DIQ175Q_ as DoctorWarning,
_DIQ175R_ as Other,
_DIQ175S_ as Gestational,
_DIQ175T_ as FreqUrination,
_DIQ175U_ as Thirst,
_DIQ175V_ as CravingSweet,
_DIQ175W_ as Meds,
_DIQ175X_ as PolycysticOvSyn,
_DIQ180_ as Hadbloodtestedlast3years,
_DIQ050_ as TakingInsulin,
_DID060_ as HowLongTakingInsulin,
_DIQ060U_ as UnitmeasureInsulin,
_DIQ070_ as DiabeticPills,
_DIQ230_ as Howlongagoseenspecialist,
_DIQ240_ as OneDr,
_DID250_ as Timesseendoctoryear,
_DID260_ as Howoftencheckblood,
_DIQ260U_ as UnitBlood,
_DIQ275_ as PastYearCheckedA1C,
_DIQ291_ as A1Cshouldbe,
_DIQ300S_ as RecentSBP,
_DIQ300D_ as RecentDBP,
_DID310S_ as DoctorsaysSBP,
_DID310D_ as DoctorsaysDBP,
_DID320_ as RecentLDL,
_DID330_ as DrsaysLDL,
_DID341_ as Drcheckfeetyear,
_DID350_ as youcheckfeet,
_DIQ350U_ as measurefeet,
_DIQ360_ as lastpupilsdilated,
_DID040_ as actualage,
_DIQ300S_ as recentSBPnumeric,
_DIQ300D_ as recentDBPnumeric,
_DID250_ as Timesseendoctorpastyear,
_DIQ280_ as LastA1Clevelnumeric,
_DID310D_ as doctorsaysDBPnumeric,
_DID310S_ as doctorsaysSBPnumeric,
_DID320_ as recentLDLnumeric,
_DID330_ as doctorsaysLDLnumeric,
_DID341_ as drcheckedfeetnumeric,
_DIQ080_ as Retinopathy into mnemesure.AddColumnMidterm from mnemesure.datamidterm

--updating numeric columns so they no longer have the codes

update mnemesure.AddColumnMidterm
set actualage = 0.5
where actualage = '666'

update mnemesure.AddColumnMidterm
set actualage = NULL
where actualage = '999'



update mnemesure.AddColumnMidterm
set recentSBPnumeric = NULL
where recentSBPnumeric = '9999'

update mnemesure.AddColumnMidterm
set recentSBPnumeric = NULL
where recentSBPnumeric = '7777'



update mnemesure.AddColumnMidterm
set recentDBPnumeric = NULL
where recentDBPnumeric = '7777'

update mnemesure.AddColumnMidterm
set recentDBPnumeric = NULL
where recentDBPnumeric = '9999'



update mnemesure.AddColumnMidterm
set Timesseendoctorpastyear = NULL
where Timesseendoctorpastyear = '7777'

update mnemesure.AddColumnMidterm
set Timesseendoctorpastyear = NULL
where Timesseendoctorpastyear = '9999'



update mnemesure.AddColumnMidterm
set LastA1Clevelnumeric = NULL
where LastA1Clevelnumeric = '7777'

update mnemesure.AddColumnMidterm
set LastA1Clevelnumeric = NULL
where LastA1Clevelnumeric = '9999'



update mnemesure.AddColumnMidterm
set doctorsaysDBPnumeric = NULL
where doctorsaysDBPnumeric = '6666'

update mnemesure.AddColumnMidterm
set doctorsaysDBPnumeric = NULL
where doctorsaysDBPnumeric = '7777'

update mnemesure.AddColumnMidterm
set doctorsaysDBPnumeric = NULL
where doctorsaysDBPnumeric = '9999'




update mnemesure.AddColumnMidterm
set doctorsaysSBPnumeric = NULL
where doctorsaysSBPnumeric = '6666'

update mnemesure.AddColumnMidterm
set doctorsaysSBPnumeric = NULL
where doctorsaysSBPnumeric = '7777'

update mnemesure.AddColumnMidterm
set doctorsaysSBPnumeric = NULL
where doctorsaysSBPnumeric = '9999'



update mnemesure.AddColumnMidterm
set recentLDLnumeric = NULL
where recentLDLnumeric = '5555'

update mnemesure.AddColumnMidterm
set recentLDLnumeric = NULL
where recentLDLnumeric = '6666'

update mnemesure.AddColumnMidterm
set recentLDLnumeric = NULL
where recentLDLnumeric = '7777'

update mnemesure.AddColumnMidterm
set recentLDLnumeric = NULL
where recentLDLnumeric = '9999'




update mnemesure.AddColumnMidterm
set doctorsaysLDLnumeric = NULL
where doctorsaysLDLnumeric = '6666'

update mnemesure.AddColumnMidterm
set doctorsaysLDLnumeric = NULL
where doctorsaysLDLnumeric = '7777'

update mnemesure.AddColumnMidterm
set doctorsaysLDLnumeric = NULL
where doctorsaysLDLnumeric = '9999'





update mnemesure.AddColumnMidterm
set drcheckedfeetnumeric = NULL
where drcheckedfeetnumeric = '7777'

update mnemesure.AddColumnMidterm
set drcheckedfeetnumeric = NULL
where drcheckedfeetnumeric = '9999'



--convert to numeric so I can make each one the same units(months)


update mnemesure.AddColumnMidterm
set HowLongTakingInsulin = cast(HowLongTakingInsulin as DECIMAL(4,0))
where UnitmeasureInsulin = '2'

update mnemesure.AddColumnMidterm
set HowLongTakingInsulin = cast(HowLongTakingInsulin as DECIMAL(4,0))
where UnitmeasureInsulin = '1'

update mnemesure.AddColumnMidterm
set HowLongTakingInsulin = HowLongTakingInsulin * 12
where UnitmeasureInsulin = '2'






update mnemesure.AddColumnMidterm
set Howoftencheckblood = cast(Howoftencheckblood as DECIMAL(4,0))
where UnitBlood = '1'

update mnemesure.AddColumnMidterm
set Howoftencheckblood = cast(Howoftencheckblood as DECIMAL(4,0))
where UnitBlood = '2'

update mnemesure.AddColumnMidterm
set Howoftencheckblood = cast(Howoftencheckblood as DECIMAL(4,0))
where UnitBlood = '3'

update mnemesure.AddColumnMidterm
set Howoftencheckblood = cast(Howoftencheckblood as DECIMAL(4,0))
where UnitBlood = '4'

update mnemesure.AddColumnMidterm
set Howoftencheckblood = Howoftencheckblood/7
where UnitBlood = '2'

update mnemesure.AddColumnMidterm
set Howoftencheckblood = Howoftencheckblood/30
where UnitBlood = '3'

update mnemesure.AddColumnMidterm
set Howoftencheckblood = Howoftencheckblood/365
where UnitBlood = '4'





update mnemesure.AddColumnMidterm
set youcheckfeet = cast(youcheckfeet as DECIMAL(4,0))
where measurefeet = '1'

update mnemesure.AddColumnMidterm
set youcheckfeet = cast(youcheckfeet as DECIMAL(4,0))
where measurefeet = '2'

update mnemesure.AddColumnMidterm
set youcheckfeet = cast(youcheckfeet as DECIMAL(4,0))
where measurefeet = '3'

update mnemesure.AddColumnMidterm
set youcheckfeet = cast(youcheckfeet as DECIMAL(4,0))
where measurefeet = '4'

update mnemesure.AddColumnMidterm
set youcheckfeet = youcheckfeet/7
where measurefeet = '2'

update mnemesure.AddColumnMidterm
set youcheckfeet = youcheckfeet/30
where measurefeet = '3'

update mnemesure.AddColumnMidterm
set youcheckfeet = youcheckfeet/365
where measurefeet = '4'

select * from mnemesure.AddColumnMidterm

