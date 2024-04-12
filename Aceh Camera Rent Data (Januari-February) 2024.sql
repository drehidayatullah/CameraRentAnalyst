
-- CHOSE SCHEMAS
USE acamaset;

-- LOOK DATA

-- Rented Item
SELECT *
FROM acamitem;

-- Customer Information
SELECT *
FROM acamcustomer;

-- ALL DATA
SELECT *
FROM acamitem item
	JOIN acamcustomer cust
    ON item.row_id = cust.row_id;
    
-- EXPLORE DATA

-- Total item rent
SELECT item_name, COUNT(item_name) AS totalRent
FROM acamitem
GROUP BY item_name
ORDER BY 2 DESC;

-- Total item rent (Primari Item Only)
SELECT item_name, COUNT(item_name) AS totalRent, SUM(item_price) AS totalIncome
FROM acamitem
WHERE item_cat IN ("camera", "lens", "gimbal")
GROUP BY item_name
ORDER BY 2 DESC;


-- Customer spending on renting camera
-- PH Spend base on customer
SELECT  cust.cus_firstname, cust.cus_lastname, SUM(item.item_price) AS totalSpend
FROM acamitem item
	JOIN acamcustomer cust
    ON item.row_id = cust.row_id
WHERE cust.cus_type = "PH"
GROUP BY  cust.cus_firstname, cust.cus_lastname
ORDER BY 3 DESC;

-- Public Spend base on customer
SELECT cust.cus_firstname, cust.cus_lastname, SUM(item.item_price) AS totalSpend
FROM acamitem item
	JOIN acamcustomer cust
    ON item.row_id = cust.row_id
WHERE cust.cus_type = "Publik"
GROUP BY  cust.cus_firstname, cust.cus_lastname
ORDER BY 3 DESC;


-- Best Rent Item
SELECT  item.item_name,item.item_cat,  SUM(item.item_price) AS totalIncome, SUM(item.rent_dur) AS totalRentDur, COUNT(item.item_name) AS rent_count
FROM acamitem item
	JOIN acamcustomer cust
    ON item.row_id = cust.row_id
GROUP BY item.item_name,item.item_cat
ORDER BY 3 DESC; -- Logest rent item = Sony A7ii, Item that giving more gain = Sony A7ii

-- Best Rent Base on cutomer Type
SELECT  item.item_name,item.item_cat,cust.cus_type,  SUM(item.item_price) AS totalGain, SUM(item.rent_dur) AS totalRentDur
FROM acamitem item
	JOIN acamcustomer cust
    ON item.row_id = cust.row_id
GROUP BY item.item_name,item.item_cat, cust.cus_type
ORDER BY 3,4 DESC;

-- ITEM RENT DATA
-- CAMERA DATA
-- Camera that having bigest rent
SELECT item.item_name, item.item_cat, SUM(item.item_price) AS ItemIncome, SUM(item.rent_dur) AS TotalRentDuration
FROM acamitem item
WHERE item.item_cat = "camera"
GROUP BY item.item_name, item.item_cat
ORDER BY 3 DESC;

-- CAMERA RENT FREQUENCIES
SELECT item.item_name, COUNT(item.item_name) AS totalRent
FROM acamitem item
WHERE item.item_cat = "camera"
GROUP BY item.item_name
ORDER BY 2 DESC;


-- LENS DATA
-- Lens that having bigest rent
SELECT item.item_name, item.item_cat, SUM(item.item_price) AS ItemIncome, SUM(item.rent_dur) AS TotalRentDuration
FROM acamitem item
WHERE item.item_cat = "Lens"
GROUP BY item.item_name, item.item_cat
ORDER BY 3 DESC;

-- LENS RENT FREQUEN
SELECT item.item_name, COUNT(item.item_name) AS totalRent
FROM acamitem item
WHERE item.item_cat = "lens"
GROUP BY item.item_name
ORDER BY 2 DESC;


-- Lens that having bigest rent base on lens type
SELECT item.item_type, SUM(item.item_price) AS ItemIncome, SUM(item.rent_dur) AS TotalRentDuration
FROM acamitem item
WHERE item.item_cat = "Lens" 
GROUP BY item.item_type
ORDER BY 3 DESC; -- higest rent lens are Wide and Tele lens


-- Wide lens having highest rent price
SELECT item.item_name, item.item_cat, SUM(item.item_price) AS ItemIncome, SUM(item.rent_dur) AS TotalRentDuration
FROM acamitem item
WHERE item.item_cat = "Lens" AND item.item_type = "wide"
GROUP BY item.item_name, item.item_cat
ORDER BY 3 DESC; -- sigma sony 24-70 having highest income, but sigma 35mm canon got the highest rent duration

-- WIDE LENS RENT FREQUENT 
SELECT item.item_name, COUNT(item.item_name) AS totalRent
FROM acamitem item
WHERE item.item_cat = "lens" AND item.item_type = 'wide'
GROUP BY item.item_name
ORDER BY 2 DESC;


-- Prime lens having highest rent price
SELECT item.item_name, item.item_cat, SUM(item.item_price) AS ItemIncome, SUM(item.rent_dur) AS TotalRentDuration
FROM acamitem item
WHERE item.item_cat = "Lens" AND item.item_type = "prime"
GROUP BY item.item_name, item.item_cat
ORDER BY 3 DESC; -- sigma sony 56mm got the highest income, and sony 50mm FE got the highest rent duration (180H)

-- PRIME LENS RENT FREQUEN
SELECT item.item_name, COUNT(item.item_name) AS totalRent
FROM acamitem item
WHERE item.item_cat = "lens" AND item.item_type= 'prime'
GROUP BY item.item_name
ORDER BY 2 DESC;


-- lens having highest rent price base on brand
SELECT item.item_brand, SUM(item.item_price) AS Income, SUM(item.rent_dur) AS TotalRentDuration
FROM acamitem item
WHERE item.item_cat = "Lens"
GROUP BY item.item_brand
ORDER BY 3 DESC; -- sony & sigma having the higest Rent duration, they get 2886H & 2838H

-- LENS RENT FREQUENT BASE ON BRAND
SELECT item.item_brand, COUNT(item.item_brand) AS totalRent
FROM acamitem item
WHERE item.item_cat = "camera"
GROUP BY item.item_brand
ORDER BY 2 DESC;


-- ACCESSORIES DATA
-- Is audio and lighting still worth it?
SELECT item.item_name, SUM(item.item_price) AS Income, SUM(item.rent_dur) AS TotalRentDuration
FROM acamitem item
WHERE item.item_cat = "audio"
GROUP BY item.item_name
ORDER BY 2 DESC; 

SELECT item.item_name, SUM(item.item_price) AS Income, SUM(item.rent_dur) AS TotalRentDuration
FROM acamitem item
WHERE item.item_cat = "lighting"
GROUP BY item.item_name
ORDER BY 2 DESC; 

SELECT item.item_name, SUM(item.item_price) AS Income, SUM(item.rent_dur) AS TotalRentDuration
FROM acamitem item
WHERE item.item_cat = "gimbal"
GROUP BY item.item_name
ORDER BY 2 DESC; 

