/* 
Data Cleaning in SQL
*/

-- Select all records from the Housing_Data table
SELECT * FROM Housing_Data;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Standardize Date format to YYYY-MM-DD

-- Select SaleDate and convert it to the YYYY-MM-DD format
SELECT SaleDate, strftime('%Y-%m-%d', SaleDate) AS Date FROM Housing_Data;

-- Update SaleDate to the standardized format
UPDATE Housing_Data
SET SaleDate = strftime('%Y-%m-%d', SaleDate);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Checking if ParcelID equals Address

-- Check for NULL PropertyAddress values
SELECT PropertyAddress FROM Housing_Data 
WHERE PropertyAddress IS NULL;

-- Order the records by ParcelID and PropertyAddress
SELECT ParcelID, PropertyAddress FROM Housing_Data 
-- WHERE PropertyAddress IS NULL
ORDER BY ParcelID;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Counting distinct ParcelID values for each PropertyAddress

-- Count the number of distinct ParcelID values for each PropertyAddress
SELECT PropertyAddress, ParcelID, COUNT(DISTINCT ParcelID) as Count
FROM Housing_Data
-- Filter the groups to include only those where there are multiple distinct ParcelID values
GROUP BY PropertyAddress
HAVING COUNT(DISTINCT ParcelID) > 0;

-- Check if there are any distinct ParcelID values for each PropertyAddress
SELECT ParcelID, PropertyAddress, 
       COUNT(DISTINCT ParcelID) as CountDistinct,
       COUNT(ParcelID) as CountTotal
FROM Housing_Data
GROUP BY PropertyAddress
HAVING COUNT(DISTINCT ParcelID) > 0;

-- Manually check for distinct values by selecting three addresses
SELECT ParcelID, PropertyAddress
FROM Housing_Data
WHERE PropertyAddress = '0 ASHLAND CITY HWY, NASHVILLE'
OR  PropertyAddress = '0  CAHAL AVE, NASHVILLE'
OR  PropertyAddress = '0  BAKERS GROVE RD, HERMITAGE';

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Check if there are any distinct PropertyAddress values for each ParcelID

-- Count the number of distinct PropertyAddress values for each ParcelID
SELECT ParcelID, PropertyAddress, 
       COUNT(DISTINCT PropertyAddress) as CountDistinct,
       COUNT(PropertyAddress) as CountTotal
FROM Housing_Data
GROUP BY ParcelID
HAVING COUNT(DISTINCT PropertyAddress) > 0;

-- Manually check for distinct values by selecting three ParcelID values
SELECT ParcelID, PropertyAddress
FROM Housing_Data
WHERE ParcelID = '018 12 0A 019.00'
OR  ParcelID = '019 13 0 037.00'
OR  ParcelID = '025 08 0 006.00';

/* 
When we have the same ParcelID, it means we have the same address.
Therefore, we can fill in the null values for PropertyAddress by using ParcelID as a reference.
*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Populate Null PropertyAddress data

-- Join the table with itself to fill in NULL PropertyAddress values based on ParcelID
SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress
FROM Housing_Data a
JOIN Housing_Data b
    ON a.ParcelID = b.ParcelID
    AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress IS NULL;

-- Query fills in NULL PropertyAddress values by selecting non-null values for records with the same ParcelID but different UniqueID.
SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress,  coalesce(a.PropertyAddress, b.PropertyAddress) AS PropertyFilledAddress
FROM Housing_Data a
JOIN Housing_Data b
    ON a.ParcelID = b.ParcelID
    AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress IS NULL;

-- Update PropertyAddress with PropertyFilledAddress where UniqueID is not the same
UPDATE Housing_Data
SET PropertyAddress = PropertyFilledAddress
FROM (
    SELECT a.ParcelID, coalesce(a.PropertyAddress, b.PropertyAddress) AS PropertyFilledAddress
    FROM Housing_Data a
    JOIN Housing_Data b
        ON a.ParcelID = b.ParcelID
        AND a.[UniqueID ] <> b.[UniqueID ]
    WHERE a.PropertyAddress IS NULL
) AS Subquery
WHERE Housing_Data.ParcelID = Subquery.ParcelID;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)

-- Extract Address and City from PropertyAddress
SELECT 
SUBSTR(PropertyAddress, 1, INSTR(PropertyAddress, ',') -1) AS Address,
SUBSTR(PropertyAddress, INSTR(PropertyAddress, ',') +1) AS City
FROM Housing_Data;

-- Extract Address, City, and calculate character length of PropertyAddress
SELECT
  substr(PropertyAddress, 1, instr(PropertyAddress, ',') - 1) as Address1,
  substr(PropertyAddress, instr(PropertyAddress, ',') + 1) AS City, LENGTH(PropertyAddress) as CharLength
FROM Housing_Data;



-- Add two new columns to Housing_Data
ALTER TABLE Housing_Data
ADD PropertyAddress2 Nvarchar(255);

ALTER TABLE Housing_Data
ADD City Nvarchar(255);


-- Split PropertyAddress and add it into PropertyAddress2 and City columns
UPDATE Housing_Data
SET 
    PropertyAddress2 =  substr(PropertyAddress, 1, instr(PropertyAddress, ',') - 1),
    City =  substr(PropertyAddress, instr(PropertyAddress, ',') + 1);


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Select OwnerAddress and extracts and transforms address information to three diffrent columns
Select 
    substr(OwnerAddress, 1, instr(OwnerAddress, ',') - 1) AS OwnerAddress2, 
    replace(substr(OwnerAddress, instr(OwnerAddress, ',') + 1), ', TN', '') AS OwnerCity,
    substr(OwnerAddress, instr(OwnerAddress, '.') -2) AS OwnerState
From Housing_Data;


-- Add three new columns to Housing_Data
ALTER TABLE Housing_Data
ADD OwnerAddress2 Nvarchar(255);

ALTER TABLE Housing_Data
ADD OwnerCity Nvarchar(255);

ALTER TABLE Housing_Data
ADD OwnerState Nvarchar(255);


-- Populate the newly added columns with extracted data using substr and replace operations
UPDATE Housing_Data
SET
    OwnerAddress2 = substr(OwnerAddress, 1, instr(OwnerAddress, ',') - 1),
    OwnerCity = replace(substr(OwnerAddress, instr(OwnerAddress, ',') + 1), ', TN', ''),
    OwnerState = substr(OwnerAddress, instr(OwnerAddress, '.') - 2);
    
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Change Y and N to Yes and No in "Sold as Vacant" field

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant) AS Count
FROM Housing_Data
GROUP BY SoldAsVacant
ORDER BY 2;


SELECT SoldAsVacant,
    CASE 
        WHEN SoldAsVacant = 'Y' THEN 'Yes'
        WHEN SoldAsVacant = 'N' THEN 'No'
        ELSE SoldAsVacant
        END
FROM Housing_Data;
    

UPDATE Housing_Data
SET
SoldAsVacant = CASE 
                    WHEN SoldAsVacant = 'Y' THEN 'Yes'
                    WHEN SoldAsVacant = 'N' THEN 'No'
                    ELSE SoldAsVacant
                    END;
                    

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates
WITH RowNumCTE AS(

SELECT *, 
    ROW_NUMBER() OVER (
    PARTITION BY 
                ParcelID,
                PropertyAddress,
                SalePrice,
                SaleDate,
                LegalReference )
                row_num
FROM Housing_Data
ORDER BY ParcelID
)
SELECT *
FROM RowNumCTE
WHERE row_num > 1
ORDER BY PropertyAddress;


DELETE
FROM RowNumCTE
WHERE row_num > 1;

-- Create a temporary table to store the row numbers of duplicate rows
CREATE TEMP TABLE DuplicateRows AS
WITH RowNumCTE AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY 
                ParcelID,
                PropertyAddress,
                SalePrice,
                SaleDate,
                LegalReference
        ) AS row_num
    FROM Housing_Data
)
SELECT *
FROM RowNumCTE
WHERE row_num > 1;


SELECT * FROM DuplicateRows;

-- Delete the duplicate rows from the original table
DELETE FROM Housing_Data
WHERE rowid IN (SELECT rowid FROM DuplicateRows);

-- Check if rowid values in DuplicateRows have been deleted from Housing_Data
SELECT d.rowid AS DuplicateRowID, h.rowid AS OriginalRowID
FROM DuplicateRows d
LEFT JOIN Housing_Data h
ON d.rowid = h.rowid;


-- Drop the temporary table
DROP TABLE DuplicateRows;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove unnecessary columns from the dataset

SELECT * FROM Housing_Data;


ALTER TABLE Housing_Data
DROP COLUMN PropertyAddress;

ALTER TABLE Housing_Data
DROP COLUMN OwnerAddress;

ALTER TABLE Housing_Data
DROP COLUMN TaxDistrict;

ALTER TABLE Housing_Data
DROP COLUMN SaleDate;

SELECT PropertyAddress FROM Housing_Data;
