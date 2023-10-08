-- Showing 5 diffrent columns in Table CovidDeaths
SELECT Location, date, total_cases, new_cases, total_deaths, population 
FROM CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2;



-- Looking at Total cases vs Total deaths
SELECT Location, date, total_cases, new_cases, total_deaths, population,
ROUND((total_deaths/total_cases) * 100,2) AS DeathPercentage
FROM CovidDeaths
WHERE location LIKE "Sweden"
ORDER BY 1,2;


-- Showing what precentage of poulation got Covid in Sweden?
SELECT Location, date, total_cases, population,
ROUND((total_cases/population) * 100,2) AS Covid_cases_Percentage
FROM CovidDeaths
WHERE location LIKE "Sweden"
ORDER BY 1,2;


-- Looking at Countries with Highest Infection Rate compared to Population.

SELECT Location, MAX(total_cases) as HighestInfectionCount, population,
round(Max((total_cases/population)) * 100,2) AS PercentagePoulationInfected
FROM CovidDeaths
GROUP BY Location, Population
ORDER BY PercentagePoulationInfected DESC;


-- Showing Countries with Highest Death Count per Population
SELECT Location, Max(cast(Total_deaths AS int)) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY Location
ORDER BY TotalDeathCount DESC;


--Showing the content with Highest Death per population
SELECT continent, Max(Total_deaths) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC;

--Showing the content with Highest Death per population %
SELECT continent, round(Max(Total_deaths)/population *100, 2) AS Percentage_Death_per_Population
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY Percentage_Death_per_Population DESC;



--CTE
-- Looking at TOtal Population vs Vaccination
WITH PopvsVac (Continent, Location, Date, Population, New_vaccinations, RollingPeopleVaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations 
, SUM(CAST(vac.new_vaccinations AS int)) OVER (PARTITION BY dea.Location ORDER BY dea.location, dea.Date)
AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3)
SELECT *, round((RollingPeopleVaccinated/Population),5)*100 as Portion_vacc_pop FROM PopvsVac;



-- TEMP TABLE
DROP TABLE IF EXISTS PercentPopulationVaccinated;
    CREATE TABLE PercentPopulationVaccinated (
        Continent nvarchar(255),
        Location nvarchar(255),
        Date datetime,
        Population numeric,
        New_vaccination numeric,
        RollingPeopleVaccinated numeric);
        
    
    Insert into PercentPopulationVaccinated
        SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations 
        , SUM(CAST(vac.new_vaccinations AS int)) OVER (PARTITION BY  dea.Location ORDER BY dea.location, dea.Date)
        AS RollingPeopleVaccinated
        FROM CovidDeaths dea
        JOIN CovidVaccinations vac
            On dea.location = vac.location
            and dea.date = vac.date
        WHERE dea.continent is not null;




-- Creating views to store data for later visualizations

Create view PercentPopulationVaccinatedView as
    SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations 
    , SUM(CAST(vac.new_vaccinations AS int)) OVER (PARTITION BY dea.Location ORDER BY dea.location, dea.Date)
    AS RollingPeopleVaccinated
    FROM CovidDeaths dea
    JOIN CovidVaccinations vac
        On dea.location = vac.location
        and dea.date = vac.date
    WHERE dea.continent is not null;
