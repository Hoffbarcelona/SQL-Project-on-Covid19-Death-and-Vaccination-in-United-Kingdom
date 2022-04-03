create database project;
use project;

select *
from coviddeaths
order by 3,4;

select *
from covidvaccinations
order by 3,4;

select location, total_cases, total_deaths, total_cases_per_million, total_deaths_per_million
from coviddeaths 
where total_cases > '10000'

select date, total_cases, total_deaths
from coviddeaths
where date >'2020-04-08' and hosp_patients < 20000
group by date;

select location, date, total_cases_per_million, total_deaths_per_million
from coviddeaths
where total_cases_per_million < 900000 or total_deaths_per_million > 1000
order by total_cases_per_million;

select location, total_deaths
from coviddeaths
where total_deaths between 8000 and 80000;

select location, date, new_cases
from coviddeaths
where new_cases = (select max(new_cases) from coviddeaths);

select location, date, new_cases
from coviddeaths
where new_cases = (select min(new_cases) from coviddeaths);

select location, date, total_cases, new_cases, total_deaths, population from coviddeaths
order by location, date;

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as percentage_of_death
from coviddeaths
order by location, date;

select location, date, total_cases, population, (total_cases/population)*100 as percentage_of_infected_population
from coviddeaths
order by location, date;

select location, max(total_cases) as highest_infection, population, max((total_cases/population))*100 as percentage_of_infected_population
from coviddeaths
order by percentage_of_infected_population;

select date, sum(new_cases) as total_new_cases, sum(new_deaths) as total_new_deaths, total_deaths, (total_deaths/total_cases)*100 as percentage_of_death
from coviddeaths
group by date
order by date, total_new_cases;

select * from coviddeaths 
inner join covidvaccinations
on coviddeaths.location = covidvaccinations.location
and coviddeaths.date = covidvaccinations.date;

select death.location, death.date, death.population, vaccine.new_vaccinations
from coviddeaths as death
inner join covidvaccinations as vaccine
on death.location = vaccine.location
and death.date = vaccine.date;

select *
from coviddeaths as death
left join covidvaccinations as vaccine
on death.location = vaccine.location;

select location, date, people_fully_vaccinated
from covidvaccinations
where people_fully_vaccinated = (select max(people_fully_vaccinated) from covidvaccinations);


