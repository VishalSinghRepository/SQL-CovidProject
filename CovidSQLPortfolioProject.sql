-- creating a `database`, as a `portfolio project`

create schema portfolio_project;

-- using the portfolio_project `database` for the analysis

use portfolio_project;

-- creating tables `coviddeaths` and `covidvaccinations` with all the fields, and importing records

-- Jump to Data Exploration part --> line '261'
-- NOTE: HERE, I USED CHATGPT PROPMT, FOR THE TABLE CREATION AND DATA IMPORTATION, AS IT SAVE THE TIME TO IMPORT DATA

CREATE TABLE coviddeaths (  
  iso_code VARCHAR(10),
  continent VARCHAR(50),
  location VARCHAR(100),
  date DATE,
  total_cases DOUBLE,
  new_cases DOUBLE,
  new_cases_smoothed DOUBLE,
  total_deaths DOUBLE,
  new_deaths DOUBLE,
  new_deaths_smoothed DOUBLE,
  total_cases_per_million DOUBLE,
  new_cases_per_million DOUBLE,
  new_cases_smoothed_per_million DOUBLE,
  total_deaths_per_million DOUBLE,
  new_deaths_per_million DOUBLE,
  new_deaths_smoothed_per_million DOUBLE,
  reproduction_rate DOUBLE,
  icu_patients DOUBLE,
  icu_patients_per_million DOUBLE,
  hosp_patients DOUBLE,
  hosp_patients_per_million DOUBLE,
  weekly_icu_admissions DOUBLE,
  weekly_icu_admissions_per_million DOUBLE,
  weekly_hosp_admissions DOUBLE,
  weekly_hosp_admissions_per_million DOUBLE,
  new_tests DOUBLE,
  total_tests DOUBLE,
  total_tests_per_thousand DOUBLE,
  new_tests_per_thousand DOUBLE,
  new_tests_smoothed DOUBLE,
  new_tests_smoothed_per_thousand DOUBLE,
  positive_rate DOUBLE,
  tests_per_case DOUBLE,
  tests_units VARCHAR(50),
  total_vaccinations DOUBLE,
  people_vaccinated DOUBLE,
  people_fully_vaccinated DOUBLE,
  new_vaccinations DOUBLE,
  new_vaccinations_smoothed DOUBLE,
  total_vaccinations_per_hundred DOUBLE,
  people_vaccinated_per_hundred DOUBLE,
  people_fully_vaccinated_per_hundred DOUBLE,
  new_vaccinations_smoothed_per_million DOUBLE,
  stringency_index DOUBLE,
  population DOUBLE,
  population_density DOUBLE,
  median_age DOUBLE,
  aged_65_older DOUBLE,
  aged_70_older DOUBLE,
  gdp_per_capita DOUBLE,
  extreme_poverty DOUBLE,
  cardiovasc_death_rate DOUBLE,
  diabetes_prevalence DOUBLE,
  female_smokers DOUBLE,
  male_smokers DOUBLE,
  handwashing_facilities DOUBLE,
  hospital_beds_per_thousand DOUBLE,
  life_expectancy DOUBLE,
  human_development_index DOUBLE
);

SHOW VARIABLES LIKE 'secure_file_priv';                                           

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CovidDeaths.csv'   
INTO TABLE coviddeaths
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@iso_code,@continent,@location,@date,
 @total_cases,@new_cases,@new_cases_smoothed,
 @total_deaths,@new_deaths,@new_deaths_smoothed,
 @total_cases_per_million,@new_cases_per_million,@new_cases_smoothed_per_million,
 @total_deaths_per_million,@new_deaths_per_million,@new_deaths_smoothed_per_million,
 @reproduction_rate,@icu_patients,@icu_patients_per_million,@hosp_patients,@hosp_patients_per_million,
 @weekly_icu_admissions,@weekly_icu_admissions_per_million,@weekly_hosp_admissions,@weekly_hosp_admissions_per_million,
 @new_tests,@total_tests,@total_tests_per_thousand,@new_tests_per_thousand,@new_tests_smoothed,@new_tests_smoothed_per_thousand,
 @positive_rate,@tests_per_case,@tests_units,@total_vaccinations,@people_vaccinated,@people_fully_vaccinated,
 @new_vaccinations,@new_vaccinations_smoothed,@total_vaccinations_per_hundred,@people_vaccinated_per_hundred,@people_fully_vaccinated_per_hundred,
 @new_vaccinations_smoothed_per_million,@stringency_index,@population,@population_density,@median_age,@aged_65_older,@aged_70_older,
 @gdp_per_capita,@extreme_poverty,@cardiovasc_death_rate,@diabetes_prevalence,@female_smokers,@male_smokers,
 @handwashing_facilities,@hospital_beds_per_thousand,@life_expectancy,@human_development_index)
SET
 iso_code = @iso_code,
 continent = @continent,
 location = @location,
 date = STR_TO_DATE(@date, '%m-%d-%Y'),                                                
 total_cases = NULLIF(@total_cases,''),
 new_cases = NULLIF(@new_cases,''),
 new_cases_smoothed = NULLIF(@new_cases_smoothed,''),
 total_deaths = NULLIF(@total_deaths,''),
 new_deaths = NULLIF(@new_deaths,''),
 new_deaths_smoothed = NULLIF(@new_deaths_smoothed,''),
 total_cases_per_million = NULLIF(@total_cases_per_million,''),
 new_cases_per_million = NULLIF(@new_cases_per_million,''),
 new_cases_smoothed_per_million = NULLIF(@new_cases_smoothed_per_million,''),
 total_deaths_per_million = NULLIF(@total_deaths_per_million,''),
 new_deaths_per_million = NULLIF(@new_deaths_per_million,''),
 new_deaths_smoothed_per_million = NULLIF(@new_deaths_smoothed_per_million,''),
 reproduction_rate = NULLIF(@reproduction_rate,''),
 icu_patients = NULLIF(@icu_patients,''),
 icu_patients_per_million = NULLIF(@icu_patients_per_million,''),
 hosp_patients = NULLIF(@hosp_patients,''),
 hosp_patients_per_million = NULLIF(@hosp_patients_per_million,''),
 weekly_icu_admissions = NULLIF(@weekly_icu_admissions,''),
 weekly_icu_admissions_per_million = NULLIF(@weekly_icu_admissions_per_million,''),
 weekly_hosp_admissions = NULLIF(@weekly_hosp_admissions,''),
 weekly_hosp_admissions_per_million = NULLIF(@weekly_hosp_admissions_per_million,''),
 new_tests = NULLIF(@new_tests,''),
 total_tests = NULLIF(@total_tests,''),
 total_tests_per_thousand = NULLIF(@total_tests_per_thousand,''),
 new_tests_per_thousand = NULLIF(@new_tests_per_thousand,''),
 new_tests_smoothed = NULLIF(@new_tests_smoothed,''),
 new_tests_smoothed_per_thousand = NULLIF(@new_tests_smoothed_per_thousand,''),
 positive_rate = NULLIF(@positive_rate,''),
 tests_per_case = NULLIF(@tests_per_case,''),
 tests_units = @tests_units,
 total_vaccinations = NULLIF(@total_vaccinations,''),
 people_vaccinated = NULLIF(@people_vaccinated,''),
 people_fully_vaccinated = NULLIF(@people_fully_vaccinated,''),
 new_vaccinations = NULLIF(@new_vaccinations,''),
 new_vaccinations_smoothed = NULLIF(@new_vaccinations_smoothed,''),
 total_vaccinations_per_hundred = NULLIF(@total_vaccinations_per_hundred,''),
 people_vaccinated_per_hundred = NULLIF(@people_vaccinated_per_hundred,''),
 people_fully_vaccinated_per_hundred = NULLIF(@people_fully_vaccinated_per_hundred,''),
 new_vaccinations_smoothed_per_million = NULLIF(@new_vaccinations_smoothed_per_million,''),
 stringency_index = NULLIF(@stringency_index,''),
 population = NULLIF(@population,''),
 population_density = NULLIF(@population_density,''),
 median_age = NULLIF(@median_age,''),
 aged_65_older = NULLIF(@aged_65_older,''),
 aged_70_older = NULLIF(@aged_70_older,''),
 gdp_per_capita = NULLIF(@gdp_per_capita,''),
 extreme_poverty = NULLIF(@extreme_poverty,''),
 cardiovasc_death_rate = NULLIF(@cardiovasc_death_rate,''),
 diabetes_prevalence = NULLIF(@diabetes_prevalence,''),
 female_smokers = NULLIF(@female_smokers,''),
 male_smokers = NULLIF(@male_smokers,''),
 handwashing_facilities = NULLIF(@handwashing_facilities,''),
 hospital_beds_per_thousand = NULLIF(@hospital_beds_per_thousand,''),
 life_expectancy = NULLIF(@life_expectancy,''),
 human_development_index = NULLIF(@human_development_index,'');                           
 
SELECT count(*) FROM portfolio_project.coviddeaths;                                       
 
drop table IF EXISTS covidvaccinations;
-- Step 1: Create table
CREATE TABLE covidvaccinations (
    iso_code VARCHAR(20),
    continent VARCHAR(50),
    location VARCHAR(100),
    date VARCHAR(100),
    new_tests DOUBLE NULL,
    total_tests DOUBLE NULL,
    total_tests_per_thousand DOUBLE NULL,
    new_tests_per_thousand DOUBLE NULL,
    new_tests_smoothed DOUBLE NULL,
    new_tests_smoothed_per_thousand DOUBLE NULL,
    positive_rate DOUBLE NULL,
    tests_per_case DOUBLE NULL,
    tests_units VARCHAR(50),
    total_vaccinations DOUBLE NULL,
    people_vaccinated DOUBLE NULL,
    people_fully_vaccinated DOUBLE NULL,
    new_vaccinations DOUBLE NULL,
    new_vaccinations_smoothed DOUBLE NULL,
    total_vaccinations_per_hundred DOUBLE NULL,
    people_vaccinated_per_hundred DOUBLE NULL,
    people_fully_vaccinated_per_hundred DOUBLE NULL,
    new_vaccinations_smoothed_per_million DOUBLE NULL,
    stringency_index DOUBLE NULL,
    population DOUBLE NULL,
    population_density DOUBLE NULL,
    median_age DOUBLE NULL,
    aged_65_older DOUBLE NULL,
    aged_70_older DOUBLE NULL,
    gdp_per_capita DOUBLE NULL,
    extreme_poverty DOUBLE NULL,
    cardiovasc_death_rate DOUBLE NULL,
    diabetes_prevalence DOUBLE NULL,
    female_smokers DOUBLE NULL,
    male_smokers DOUBLE NULL,
    handwashing_facilities DOUBLE NULL,
    hospital_beds_per_thousand DOUBLE NULL,
    life_expectancy VARCHAR(100) NULL,
    human_development_index DOUBLE NULL
);

-- Step 2: Load data from CSV
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CovidVaccinations.csv'
INTO TABLE covidvaccinations
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  @iso_code, @continent, @location, @date, @new_tests, @total_tests,
  @total_tests_per_thousand, @new_tests_per_thousand, @new_tests_smoothed,
  @new_tests_smoothed_per_thousand, @positive_rate, @tests_per_case, @tests_units,
  @total_vaccinations, @people_vaccinated, @people_fully_vaccinated, @new_vaccinations,
  @new_vaccinations_smoothed, @total_vaccinations_per_hundred, @people_vaccinated_per_hundred,
  @people_fully_vaccinated_per_hundred, @new_vaccinations_smoothed_per_million, @stringency_index,
  @population, @population_density, @median_age, @aged_65_older, @aged_70_older, @gdp_per_capita,
  @extreme_poverty, @cardiovasc_death_rate, @diabetes_prevalence, @female_smokers, @male_smokers,
  @handwashing_facilities, @hospital_beds_per_thousand, @life_expectancy, @human_development_index
)
SET
  iso_code = NULLIF(@iso_code,''),
  continent = NULLIF(@continent,''),
  location = NULLIF(@location,''),
  date = STR_TO_DATE(@date, '%m-%d-%Y'),
  new_tests = NULLIF(@new_tests,''),
  total_tests = NULLIF(@total_tests,''),
  total_tests_per_thousand = NULLIF(@total_tests_per_thousand,''),
  new_tests_per_thousand = NULLIF(@new_tests_per_thousand,''),
  new_tests_smoothed = NULLIF(@new_tests_smoothed,''),
  new_tests_smoothed_per_thousand = NULLIF(@new_tests_smoothed_per_thousand,''),
  positive_rate = NULLIF(@positive_rate,''),
  tests_per_case = NULLIF(@tests_per_case,''),
  tests_units = NULLIF(@tests_units,''),
  total_vaccinations = NULLIF(@total_vaccinations,''),
  people_vaccinated = NULLIF(@people_vaccinated,''),
  people_fully_vaccinated = NULLIF(@people_fully_vaccinated,''),
  new_vaccinations = NULLIF(@new_vaccinations,''),
  new_vaccinations_smoothed = NULLIF(@new_vaccinations_smoothed,''),
  total_vaccinations_per_hundred = NULLIF(@total_vaccinations_per_hundred,''),
  people_vaccinated_per_hundred = NULLIF(@people_vaccinated_per_hundred,''),
  people_fully_vaccinated_per_hundred = NULLIF(@people_fully_vaccinated_per_hundred,''),
  new_vaccinations_smoothed_per_million = NULLIF(@new_vaccinations_smoothed_per_million,''),
  stringency_index = NULLIF(@stringency_index,''),
  population = NULLIF(@population,''),
  population_density = NULLIF(@population_density,''),
  median_age = NULLIF(@median_age,''),
  aged_65_older = NULLIF(@aged_65_older,''),
  aged_70_older = NULLIF(@aged_70_older,''),
  gdp_per_capita = NULLIF(@gdp_per_capita,''),
  extreme_poverty = NULLIF(@extreme_poverty,''),
  cardiovasc_death_rate = NULLIF(@cardiovasc_death_rate,''),
  diabetes_prevalence = NULLIF(@diabetes_prevalence,''),
  female_smokers = NULLIF(@female_smokers,''),
  male_smokers = NULLIF(@male_smokers,''),
  handwashing_facilities = NULLIF(@handwashing_facilities,''),
  hospital_beds_per_thousand = NULLIF(@hospital_beds_per_thousand,''),
  life_expectancy = NULLIF(TRIM(@life_expectancy), ''),
  human_development_index = NULLIF(@human_development_index,'');
  
-- Exploring Data

-- 1. Population V/s InfectionRate

select location, date, population, total_cases, round((total_cases/population)*100,2) as percent_population_infected
from coviddeaths
where nullif(continent, '') is  not null
order by location, date asc
;

-- 2. Percentage of Covid Infected People per Country

select location, max(population) as population, max(total_cases) as total_casecount, round(max((total_cases/population)*100 ),2) as perecentage_population_infected
from coviddeaths
where nullif(continent, '') is  not null
group by location
order by location asc
;

-- 3. TotalCases V/s TotalDeathRate

select location, date, total_cases, total_deaths,  round(((total_deaths/total_cases)*100),2) as percent_population_died
from coviddeaths
where nullif(continent, '') is  not null
order by location, date asc
;

-- 4. Percentage of Covid Infected People Died per Country

select location, max(total_cases) as total_casecount, max(total_deaths) as total_deathcount, round(max((total_deaths/total_cases)*100),2) as       percent_population_died
from coviddeaths
where nullif(continent, '') is  not null
group by location
order by location asc
;

-- 5. TotalDeathCount per Country

select location, max(total_deaths) as total_death_count
from coviddeaths
where nullif(continent, '') is  not null
group by location
-- order by total_death_count desc;
;

-- Breaking Down by Continent
-- update coviddeaths set continent = null where continent = '';

-- 1. Percentage of Covid Infected People per Continent

select location as continent, max(population) as population, max(total_cases) as total_casecount, round(max((total_cases/population)*100 ),2) as perecentage_population_infected
from coviddeaths
where nullif(continent, '') is null
group by location
order by location asc
;

-- 2. Percentage of Covid Infected People died per Continent

select location as continent, max(total_cases) as total_casecount, max(total_deaths) as total_deathcount, round(max((total_deaths/total_cases)*100),2) as       percent_population_died
from coviddeaths
where nullif(continent, '') is null
group by location
order by location asc
;

-- 3. TotalDeathCount per Continent

select location as continent, max(total_deaths) as total_death_count
from coviddeaths
where nullif(continent, '') is null
group by location
-- order by total_death_count desc
;

-- Global Figures

-- 1. Infected Population Death Percentage

select date, sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, (sum(new_deaths)/sum(new_cases))*100 death_percentage
from coviddeaths
where nullif(continent, '') is not null
group by date
order by date asc;

-- 2. Overall Death Percentage 

select location, max(total_cases) as total_casecount, max(total_deaths) as total_deathcount, round((max(total_deaths)/max(total_cases))*100,2) death_percentage
from coviddeaths
where nullif(continent, '') is null and location = "world"
group by location
-- order by total_death_count desc
-- limit 1
;

-- Looking Into Vaccinations

-- 1. People Who Got Vaccinated Atleast Once by Country

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(vac.new_vaccinations) over(partition by dea.location order by dea.date) as rolling_people_vaccinated -- (rolling_people_vaccinated/dea.population)*100 as percent_population_vaccinated
from coviddeaths dea
join covidvaccinations vac
     on dea.location = vac.location and dea.date = vac.date
where nullif(dea.continent, '') is not null -- and dea.location like "%India%"
order by 2,3
;

-- 2. Creating CTE to Perform Calculation on the previous Query

with PercentPopulationVaccinated (continent, location, date, population, new_vaccinations, rolling_people_vaccinated) as
(select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(vac.new_vaccinations) over(partition by dea.location order by dea.date) as rolling_people_vaccinated -- (rolling_people_vaccinated/dea.population)*100 as percent_population_vaccinated
from coviddeaths dea
join covidvaccinations vac
     on dea.location = vac.location and dea.date = vac.date
where nullif(dea.continent, '') is not null -- and dea.location like "%India%"
)
select *, round((rolling_people_vaccinated/population)*100,2) as percent_population_vaccinated
from PercentPopulationVaccinated 
order by 2,3
;

-- 3. Using Temptable to perform the same Calculation on Previous Query

drop temporary table if exists PercentPopulationVaccinated;
create temporary table PercentPopulationVaccinated 
     (continent nvarchar(200),
      location nvarchar(200),
      date date,
      population bigint,
      new_vaccinations double,
      rolling_people_vaccinated double
     );
     
insert into PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(vac.new_vaccinations) over(partition by dea.location order by dea.date) as rolling_people_vaccinated -- (rolling_people_vaccinated/dea.population)*100 as percent_population_vaccinated
from coviddeaths dea
join covidvaccinations vac
     on dea.location = vac.location and dea.date = vac.date
where nullif(dea.continent, '') is not null -- and dea.location like "%India%"
;

select *, (rolling_people_vaccinated/population)*100 as percent_population_vaccinated
from PercentPopulationVaccinated
order by 2,3
;

-- CREATING VIEWS;

-- 1. PopulationVaccinated

create view PopulationVaccinated as 
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(vac.new_vaccinations) over(partition by dea.location order by dea.date) as rolling_people_vaccinated, (sum(vac.new_vaccinations) over(partition by dea.location order by dea.date)/dea.population)*100 as percent_population_vaccinated
from coviddeaths dea
join covidvaccinations vac
     on dea.location = vac.location and dea.date = vac.date
where nullif(dea.continent, '') is not null -- and dea.location like "%India%"
order by 2,3
;
-- select * from PopulationVaccinated;

-- 2. DeathPercentageRate

create view DeathPercentageRate as
select date, sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, (sum(new_deaths)/sum(new_cases))*100 death_percentage
from coviddeaths
where nullif(continent, '') is not null
group by date
order by date asc;
-- select * from deathpercentagerate;

-- 3. GlobalDeathPercentage

create view DeathPercentageGlobal as
select location, max(total_cases) as total_casecount, max(total_deaths) as total_deathcount, round((max(total_deaths)/max(total_cases))*100,2) death_percentage
from coviddeaths
where nullif(continent, '') is null and location = "world"
group by location
-- order by total_death_count desc
-- limit 1
;
-- select * from globaldeathpercentage;

-- 4. PercentagePopulationInfectedContinent

create view PercentPopulationInfectedContinent as
select location as continent, max(population) as population, max(total_cases) as total_casecount, round(max((total_cases/population)*100 ),2) as perecentage_population_infected
from coviddeaths
where nullif(continent, '') is null
group by location
order by location asc
;
-- select * from PercentPopulationInfectedContinent;

-- 5. PercentagePopulationDiedContinent

create view PercentPopulationDiedContinent as
select location as continent, max(total_cases) as total_casecount, max(total_deaths) as total_deathcount, round(max((total_deaths/total_cases)*100),2) as       percent_population_died
from coviddeaths
where nullif(continent, '') is null
group by location
order by location asc
;
-- select * from percentpopulationdiedcontinent;

-- 6. DeathCountContinent

create view PercentDeathCountContinent as
select location as continent, max(total_deaths) as total_death_count
from coviddeaths
where nullif(continent, '') is null
group by location
-- order by total_death_count desc
;
-- select * from DeathCountContinent;

-- 7. PercentPopulationInfectedCountry
  
create view PercentPopulationInfectedCountry as
select location, max(population) as population, max(total_cases) as total_casecount, round(max((total_cases/population)*100 ),2) as perecentage_population_infected
from coviddeaths
where nullif(continent, '') is  not null
group by location
order by location asc
;
-- select * from PercentPopulationInfectedCountry;

-- 8. PercentPopulationDiedCountry

create view PercentPopulationDiedCountry as
select location, max(total_cases) as total_casecount, max(total_deaths) as total_deathcount, round(max((total_deaths/total_cases)*100),2) as       percent_population_died
from coviddeaths
where nullif(continent, '') is  not null
group by location
order by location asc
;

-- 9. DeathCountCountry

create view DeathCountCountry as
select location, max(total_deaths) as total_death_count
from coviddeaths
where nullif(continent, '') is  not null
group by location
-- order by total_death_count desc;
;

-- 10. InfectionRateCountry

create view InfectionRateCountry as
select location, date, population, total_cases, round((total_cases/population)*100,2) as percent_population_infected
from coviddeaths
where nullif(continent, '') is  not null
order by location, date asc
;

-- 11. DeathRateCountry

create view DeathRateCountry as
select location, date, total_cases, total_deaths,  round(((total_deaths/total_cases)*100),2) as percent_population_died
from coviddeaths
where nullif(continent, '') is  not null
order by location, date asc
;

