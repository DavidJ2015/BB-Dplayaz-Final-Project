Employment <- list(Employed.Age.15.Plus = "SL.EMP.TOTL", Males.Age.15.Plus = "SL.EMP.TOTL.MA",
                   Females.Age.15.Plus = "SL.EMP.TOTL.FE", Labor.Force = "SL.TLF")

UnemploymentPercentages <- list(Of.Labor.Force = "SL.UEM.TOTL.ZS", Of.Male.LF = "SL.UEM.TOTL.MA.ZS", 
                                Of.Female.LF = "SL.UEM.TOTL.FE.ZS", Long.Term = "SL.UEM.LTRM.ZS",
                                With.Basic.Ed = "SL.UEM.BASC.ZS", With.Adv.Ed = "SL.UEM.ADVN.ZS")

Education <- list(Illitereate.Age.15to24 = "UIS.LP.AG15T24", Illiterate.Age.15.Plus = "UIS.LP.AG15T99", 
                  Enrollment.Public = "UIS.E.1.Pu", Enrollment.Private = "UIS.E.1.PR")

EducationPercentages <- list(Literacy.Age.65.Plus = "UIS.LR.AG65", Primary.Enrollment = "UIS.OAEP.1",
                             Literacy.Age.15.Plus ="SE.ADT.LITR.ZS", Male.Literacy = "SE.ADT.LITR.MA.ZS",
                             Female.Literacy = "SE.ADT.LITR.FE.ZS", Pop.With.Bachelors = "SE.TER.CUAT.BA.ZS", 
                             Males.With.Bachlors = "SE.TER.CUAT.BA.MA.ZS", Females.With.Bachlors = "SE.TER.CUAT.BA.FE.ZS", 
                             Pop.With.Masters = "SE.TER.CUAT.MS.ZS", Pop.With.Doctoral = "SE.TER.CUAT.DO.ZS")

Population <- list(Total = "SP.POP.TOTL", Males = "SP.POP.TOTL.MA.IN", Females = "SP.POP.TOTL.FE.IN",
                   Urban = "SP.URB.TOTL", Rural = "SP.RUR.TOTL", Age.15to64 = "SP.POP.1564.TO", 
                   Birth.Rate.Per.1000 = "SP.DYN.CBRT.IN", Death.Rate.Per.1000 = "SP.DYN.CDRT.IN", 
                   Infant.Mortality.Per.1000 = "SP.DYN.IMRT.IN", Life.Exectancy.At.Birth = "SP.DYN.LE00.IN", 
                   Suicide.Mortality.Per.100000 = "SH.STA.SUIC.P5", Foreign.Labor.Force = "SM.TLF.FRGN.ZS", 
                   Net.Migration = "SM.POP.NETM", Foreign.Population = "SM.POP.FRGN.ZS")

PopulationPercentages <- list(Urban.Population = "SP.URB.TOTL.IN.ZS", Rural.Population = "SP.RUR.TOTL.ZS",
                              Age.15to64 = "SP.POP.1564.TO.ZS", Males.Age.15to64 = "SP.POP.1564.MA.ZS", 
                              Females.Age.15to64 = "SP.POP.1564.FE.ZS")

Health <- list(Pop.Per.Nurse = "SH.MED.NURS.ZS", Physicians.Per.1000 = "SH.MED.PHYS.ZS", Specialists.Per.100000 = "SH.MED.SAOP.P5",
               Hospitals = "SH.HOSP.TOTL", Doctors = "SH.DR.TOTL", Adults.With.HIV = "SH.DYN.AIDS", 
               Total.With.HIV.And.AIDS = "SH.HIV.TOTL.NUM", Estimated.AIDS.Deaths = "SH.DYN.AIDS.DH") 

HealthPercentages <- list(Pop.With.Access.To.Healthcare = "SH.STA.ACCH.ZS", Pop.With.Improved.Water.Source = "SH.H2O.SAFE.ZS",
                          Households.With.Water = "SG.H2O.PRMS.HH.ZS", Pop.HIV.Prevalence.Age.15to49 = "SH.DYN.AIDS.ZS")
#55
Economy <- list(Total.Wealth.2014.Dollar = "NW.TOW.TO", Net.National.Income.2010.Dollar = "NY.ADJ.NNTY.KD",
                Human.Capital.2014.Dollar = "NW.HCA.TO", Product.Taxes.Current.Dollar = "NY.TAX.NIND.CD",
                Indirect.Taxes.Current.Dollar = "NY.TAX.IDRT.CD")

EconomyPercentages <- list(Annual.GDP.Growth = "NY.GDP.MKTP.KN.87.ZG", Gross.Domestic.Savings.Of.GDP = "NY.GDS.TOTL.ZS", 
                           Annual.Inflation = "NY.GDP.DEFL.KD.ZG", Food.Exports = "TX.VAL.FOOD.ZS.UN",
                           Ore.And.Metal.Exports = "TX.VAL.MMTL.ZS.UN", Mineral.Exports = "TX.VAL.MNRL.UN.ZS",
                           High.Tech.Exports = "TX.VAL.TECH.MF.ZS", National.Income.Annual.Growth = "NY.ADJ.NNTY.KD.ZG",
                           Military.Expenditure.Of.GDP = "MS.MIL.XPND.GD.ZS")

FunFacts <- list(Aircraft.Departures.1000s = "SF.TRN.AIR.DPRT", Televisions.Per.1000 = "SF.CMN.TELE.TH",
                 Mobile.Phones.Per.1000 = "SF.CMN.PHON.CELL.TH", Intentional.Homicides.Per.100000 = "VC.IHR.PSRC.P5")

FunFactsPercentages <- list(Male.Adult.Smokers = "SH.PRV.SMOK.MA", Female.Adult.Smokers = "SH.PRV.SMOK.FE",
                         Adults.With.Credit.Card = "WP_time_03.1", Access.To.Electricity = "EG.ELC.ACCS.ZS")

IndicatorsData <- data.frame(Employment = matrix(unlist(Employment), nrow=132, byrow=T), 
                             UnemploymentPercentages = matrix(unlist(UnemploymentPercentages), nrow=132, byrow=T), 
                             Education = matrix(unlist(Education), nrow=132, byrow=T),
                             EducationPercentages = matrix(unlist(EducationPercentages), nrow=132, byrow=T),
                             Population = matrix(unlist(Population), nrow=132, byrow=T),
                             PopulationPercentages = matrix(unlist(PopulationPercentages), nrow=132, byrow=T),
                             Health = matrix(unlist(Health), nrow=132, byrow=T),
                             HealthPercentages = matrix(unlist(HealthPercentages), nrow=132, byrow=T),
                             Economy = matrix(unlist(Economy), nrow=132, byrow=T),
                             EconomyPercentages = matrix(unlist(EconomyPercentages), nrow=132, byrow=T),
                             FunFacts = matrix(unlist(FunFacts), nrow=132, byrow=T),
                             FunFactsPercentages = matrix(unlist(FunFactsPercentages), nrow=132, byrow=T),
                             stringsAsFactors=FALSE)

write.csv(IndicatorsData, file = "IndicatorsData.csv")
