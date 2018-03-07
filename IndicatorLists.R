

Unemployment <- list(Unemployment_Percent.Tot.Labor.Force = "SL.UEM.TOTL.ZS", Unemployed.Males_Percent.Male.LF = "SL.UEM.TOTL.MA.ZS", 
                     Unemployed_Percent.Female.LF = "SL.UEM.TOTL.FE.ZS", Percent.Youth.Not.In.Education.Employment.Or.Training = "SL.UEM.NEET.ZS",
                     Long.Term.Unemployment_Percent.Tot.Unemp = "SL.UEM.LTRM.ZS", Percent.Unemployed.With.Basic.Ed = "SL.UEM.BASC.ZS", 
                     Percent.Unemployed.With.Adv.Education = "SL.UEM.ADVN.ZS", Unemployment.To.Pop.Percent.Age.15.Plus = "SL.EMP.TOTL.SP.NE.ZS",
                     Number.People.Employed = "L.EMP.TOTL", Tot.Employment.Male.Age.15.Plus = "SL.EMP.TOTL.MA", 
                     Tot.Employment.Female.Age.15.Plus = "SL.EMP.TOTL.FE", Num.People.In.LF = "SL.TLF")

Education <- list(Public.Expend.Education_Percent.GDP = "SE.XPD.EDUC.ZS", Percentage.Male.Repeat.Secondary.Ed = "UIS.REPP.2.GPV.M", 
                  Percent.Repetition.Primary.Ed = "UIS.REPR.1", Illitereate.Pop.Age.15to24 = "UIS.LP.AG15T24", 
                  Illiterate.Pop.Age.15.Plus = "UIS.LP.AG15T99", Percent.Literacy.Age.65.Plus = "UIS.LR.AG65",
                  Primary.Enrollment.Percentage = "UIS.OAEP.1", Primary.Ed.Enrollment.Public = "UIS.E.1.Pu",
                  Primary.Ed.Enrollment.Private = "UIS.E.1.PR", Percent.Literacy.Age.15.Plus ="SE.ADT.LITR.ZS",
                  Percent.Male.Literacy.Age.15.Plus = "SE.ADT.LITR.MA.ZS", Percent.Female.Literacy.Age.15.Plus = "SE.ADT.LITR.FE.ZS",
                  Tertiary.Pupil.Teacher.Ratio = "UIS.PTRHC.56", Upper.Secondary.Pupil.Teacher.Ratio = "UIS.PTRHC.3",
                  Lower.Secondary.Pupil.Teacher.Ratio = "UIS.PTRHC.2", Percent.Children.Out.Of.School.Primary.School.Age = "SE.PRM.UNER.ZS",
                  Educational.Attainment.Masters.Percent.Pop = "SE.TER.CUAT.MS.ZS", Educational.Attainment.Bachelors.Percent.Pop = "SE.TER.CUAT.BA.ZS",
                  Educational.Attainment.Bachlors.Male = "SE.TER.CUAT.BA.MA.ZS", Educational.Attainment.Bachlors.Female = "SE.TER.CUAT.BA.FE.ZS",
                  Educational.Attainment.Doctoral.Percent.Pop = "SE.TER.CUAT.DO.ZS")

Population <- list(Population.Total = "P.POP.TOTL", Population.Male = "SP.POP.TOTL.MA.IN", Population.Female = "SP.POP.TOTL.FE.IN",
                   Urban.Population = "SP.URB.TOTL", Rural.Population = "SP.RUR.TOTL", Percent.Urban.Population = "SP.URB.TOTL.IN.ZS",
                   Percent.Rural.Population = "SP.RUR.TOTL.ZS", Population.Age.15to64 = "SP.POP.1564.TO", Percent.Population.Age.15to64 = "SP.POP.1564.TO.ZS",
                   Percent.Male.Pop.Age.15to64 = "SP.POP.1564.MA.ZS", Percent.Female.Pop.Age.15to64 = "SP.POP.1564.FE.ZS", 
                   Population.65.And.Up.2005and2010 = "SP.POP.65UP.TO", Birth.Rate.Crude.Per.1000 = "SP.DYN.CBRT.IN", 
                   Death.Rate.Crude.Per.1000 = "SP.DYN.CDRT.IN", Infant.Mortality.Rate.Per.1000.Live = "SP.DYN.IMRT.IN", 
                   Life.Exectancy.At.Birth = "SP.DYN.LE00.IN", Suicide.Mortality.Rate.Per.100000 = "SH.STA.SUIC.P5", Foreign.Labor.Force = "SM.TLF.FRGN.ZS", 
                   Net.Migration = "SM.POP.NETM", Foreign.Population = "SM.POP.FRGN.ZS")

Health <- list(Public.Health.Expenditure.Percent.GDP = "SH.XPD.PUBL.ZS", Health.Care.Percent.Pop.With.Access = "SH.STA.ACCH.ZS", 
               Population.Per.Nurse = "SH.MED.NURS.ZS", Physicians.Per.1000 = "SH.MED.PHYS.ZS", Specialist.Surgical.Workforce.Per.100000 = "SH.MED.SAOP.P5",
               Number.Of.Hospitals = "SH.HOSP.TOTL", Number.Of.Doctors = "SH.DR.TOTL", Percent.Pop.With.Basic.Sanitation.Dervices = "SH.STA.BASS.ZS",
               Percent.Pop.With.Improved.Sanitation.Facilities = "SH.STA.ACSN", Percent.Rural.Pop.With.Improved.Sanitation.Services = "SH.STA.ACSN.RU",
               Percent.Urban.Pop.With.Improved.Sanitation.Services = "SH.STA.ACSN.UR", Percent.Pop.With.Improved.Water.Source = "SH.H2O.SAFE.ZS",
               Percent.Households.With.Water.On.Premise = "SG.H2O.PRMS.HH.ZS", Percent.Households.With.Water.30mins.Or.Longer.Away = "SG.H2O.TM30.HH.ZS",
               Percent.Pop.HIV.Prevalence.Age.15to49 = "SH.DYN.AIDS.ZS", Adults.With.HIV.Age.15.Plus = "SH.DYN.AIDS", 
               Total.People.With.HIV.And.AIDS = "SH.HIV.TOTL.NUM", Estimated.AIDS.Deaths = "SH.DYN.AIDS.DH", 
               Percent.Mortality.From.CVD.Cancer.Diabetes.Or.CRD.Age.30to70 = "SH.DYN.NCOM.ZS", Percent.Prevalence.Overweight.Adults = "SH.STA.OWAD.ZS",
               Percent.Prevalence.Overweight.Adult.Males = "SH.STA.OWAD.MA.ZS", Percent.Prevalence.Overweight.Adult.Females = "SH.STA.OWAD.FE.ZS",
               Prevalence.Of.Undernourished = "SN.ITK.DEFC")

Economy <- list(Total.Wealth.Constant.2014.US.Dollars = "NW.TOW.TO", Annual.Percentage.GDP.Growth = "NY.GDP.MKTP.KN.87.ZG", 
                Gross.Domestic.Savings.Percentage.Of.GDP = "NY.GDS.TOTL.ZS", Annual.Percentage.Inflation = "NY.GDP.DEFL.KD.ZG",
                Adjusted.Net.National.Income.2010.Constant.US.Dollars = "NY.ADJ.NNTY.KD",
                Adjusted.Net.National.Income.Annual.Percent.Growth = "NY.ADJ.NNTY.KD.ZG", Human.Capital.2014.Constant.US.Dollars = "NW.HCA.TO",
                Natural.Capital.Subsoil.Assets.2014.Constant.US.Dollars = "NW.NCA.SSOI.TO", 
                Natural.Capital.Subsoil.Assets.Oil.2014.Constant.US.Dollars = "NW.NCA.SAOI.TO",
                Natural.Capital.Subsoil.Assets.Silver.2014.Constant.US.Dollars = "NW.NCA.MSIL.TO",
                Natural.Capital.Subsoil.Assets.Gold.2014.Constant.US.Dollars = "NW.NCA.MGOL.TO",
                Natural.Capital.Agricultural.Land.Cropland.2014.Constant.US.Dollars = "NW.NCA.CROL.TO",
                Natural.Capital.Forests.2014.Constant.US.Dollars = "NW.NCA.FORE.TO", Percent.Merchandise.Exports.Food = "TX.VAL.FOOD.ZS.UN",
                Percent.Merchandise.Exports.Ores.And.Metals = "TX.VAL.MMTL.ZS.UN", Percent.Merchandise.Exports.Minerals = "TX.VAL.MNRL.UN.ZS",
                Percent.Manufactured.Exports.High.Technology = "TX.VAL.TECH.MF.ZS", Net.Taxes.On.Products.Current.US.Dollars = "NY.TAX.NIND.CD",
                Indirect.Taxes.Current.US.Dollars = "NY.TAX.IDRT.CD", International.Tourism.Expenditures.Current.US.Dollars = "ST.INT.XPND.CD",
                Military.Expenditure.Percent.of.GDP = "MS.MIL.XPND.GD.ZS", Income.Share.Held.By.Highest.10.Percent = "SI.DST.10TH.10",
                Income.Share.Held.By.Lowest.20.Percent = "SI.DST.FRST.20")

FunFacts <- list(Smoking.Prevalence.Males.Percent.Adults = "SH.PRV.SMOK.MA", Smoking.Prevalence.Females.Percent.Adults = "SH.PRV.SMOK.FE",
                 Aircraft.Departures.1000s = "SF.TRN.AIR.DPRT", Television.Sets.Per.1000.People = "SF.CMN.TELE.TH",
                 Mobile.Phones.Per.1000.People = "SF.CMN.PHON.CELL.TH", Prencence.Of.Peace.Keepers.In.Mandate = "VC.PKP.TOTL.UN", 
                 Intentional.Homicides.Per.100000.People = "VC.IHR.PSRC.P5", Intentional.Homicide.Rate.Per.100000.People = "VC.HOM.ITEN.P5.LE",
                 Percent.Population.Age.15.Plus.With.Credit.Card = "WP_time_03.1", Percent.Population.With.Access.To.Electricity = "EG.ELC.ACCS.ZS")



