### TABLE VIEW ###
SELECT *
FROM `Telecom`.`t_churn`;

### NULL VALUE CHECK ###
/*lets find out the number of cells containing null values */
SELECT 
    sum(case when `Customer ID` is null then 1 else 0 end) as `Customer ID`, 
    sum(case when Gender is null then 1 else 0 end) as Gender, 
    sum(case when Married is null then 1 else 0 end) as Married,
    sum(case when Contract is null then 1 else 0 end) as Contract, 
    sum(case when City is null then 1 else 0 end) as City,
    sum(case when `Tenure in Months` is null then 1 else 0 end) as `Tenure in Months`, 
    sum(case when Offer is null then 1 else 0 end) as Offer,
    sum(case when `Phone Service` is null then 1 else 0 end) as `Phone Service`, 
    sum(case when `Avg Monthly Long Distance Charges` is null then 1 else 0 end) as `Avg Monthly Long Distance Charges`,
    sum(case when `Internet Service` is null then 1 else 0 end) as `Internet Service`, 
    sum(case when `Total Revenue` is null then 1 else 0 end) as `Total Revenue`,
    sum(case when `Customer Status` is null then 1 else 0 end) as `Customer Status`, 
    sum(case when `Churn Category` is null then 1 else 0 end) as `Churn Category`,
    sum(case when `Churn Reason` is null then 1 else 0 end) as `Churn Reason`
FROM `Telecom`.`t_churn`; 


### CHURN CATEGORY ###
/*lets find out the number of churn categories available while replacing cells containing null values */
SELECT DISTINCT `Churn Category`,
COUNT(`Churn Category`)AS Count,
CASE
    WHEN `Churn Category`='Competitor' THEN 'Competitor'
    WHEN `Churn Category`='Dissatisfaction' THEN 'Dissatisfaction'
    WHEN `Churn Category`='Attitude' THEN 'Attitude'
    WHEN `Churn Category`='Other' THEN 'Undisclosed'
	WHEN `Churn Category`='Price' THEN 'Price'
    WHEN `Churn Category`='Attitude' THEN 'Attitude'
    WHEN `Churn Category`='' THEN 'Null' 
END AS `Churn  Category`
	FROM `Telecom`.`t_churn`
	GROUP BY `Churn Category`
	ORDER BY Count DESC;


 ### CHURN REASON ###
SELECT  `Churn Reason`,
	COUNT(`Churn Reason`)AS Count,
CASE
	WHEN `Churn Reason`='Competitor had better devices' THEN 'Competitor had better devices'
    WHEN `Churn Reason`='Competitor made better offer' THEN 'Competitor made better offer'
    WHEN `Churn Reason`='Attitude of support person' THEN 'Attitude of support person'
    WHEN `Churn Reason`='Don''t know' THEN 'Don''t know'
    WHEN `Churn Reason`='Competitor offered more data' THEN 'Competitor offered more data'
    WHEN `Churn Reason`='Competitor offered higher download speeds' THEN 'Competitor offered higher download speeds'
    WHEN `Churn Reason`='Attitude of service provider' THEN 'Attitude of service provider'
    WHEN `Churn Reason`='Product dissatisfaction' THEN 'Product dissatisfaction'
    WHEN `Churn Reason`='Network reliability' THEN 'Network reliability'
    WHEN `Churn Reason`='Price too high' THEN 'Price too high'
    WHEN `Churn Reason`='Service dissatisfaction' THEN 'Service dissatisfaction'
    WHEN `Churn Reason`='Moved' THEN 'Moved'
    WHEN `Churn Reason`='Extra data charges' THEN 'Extra data charges'
    WHEN `Churn Reason`='Long distance charges' THEN 'Long distance charges'
    WHEN `Churn Reason`='Limited range of services' THEN 'Limited range of services'
    WHEN `Churn Reason`='Lack of affordable download/upload speed' THEN 'Lack of affordable download/upload speed'
    WHEN `Churn Reason`='Poor expertise of online support' THEN 'Poor expertise of online support'
    WHEN `Churn Reason`='Lack of self-service on Website' THEN 'Lack of self-service on Website'
    WHEN `Churn Reason`='Poor expertise of phone support' THEN 'Poor expertise of phone support'
    WHEN `Churn Reason`='Deceased' THEN 'Deceased'
    WHEN `Churn Reason`='' THEN 'Null'
End AS `Churn Reason`    
FROM `Telecom`.`t_churn`
GROUP BY `Churn Reason`
ORDER BY Count DESC;


### CUSTOMER STATUS ###
SELECT DISTINCT `Customer Status`,
COUNT(`Customer Status`)AS Count,
CASE
    WHEN `Customer Status`='Stayed' THEN 'The Customer is using the service'
    WHEN `Customer Status`='Churned' THEN 'The Customer is not using the service'
    WHEN `Customer Status`='' Then '' Else 'Null'
END AS `Customer Status`
	FROM `Telecom`.`t_churn`
	GROUP BY `Customer Status`
	ORDER BY Count DESC;


### GENDER ###
SELECT DISTINCT Gender,
	COUNT(Gender) AS Count
FROM `Telecom`.`t_churn`
GROUP BY Gender;
    
    
### UNIQUENESS OF CUSTOMER ID ###
SELECT DISTINCT `Customer ID`
FROM `Telecom`.`t_churn`;


### CITY ###
  SELECT DISTINCT City,
  COUNT(City)AS Frequency
  FROM `Telecom`.`t_churn`
  GROUP BY City
  ORDER BY Frequency DESC;
  
  
### CUSTOMER STATUS, CHURN CATEGORY, CUSTOMER REASON ###
SELECT `Customer ID`, Gender, Age, City, `Tenure in Months`,  Offer, `Phone Service`, `Avg Monthly Long Distance Charges`,
`Internet Service`, Contract, `Total Revenue`, 
CASE
    WHEN `Customer Status`='Stayed' THEN 'Stayed'
    WHEN `Customer Status`='Churned' THEN 'Churned'
    WHEN `Customer Status`='Joined' THEN 'Joined'
    WHEN `Customer Status`='' Then '' Else 'Null'
END AS `Customer Status`,
CASE
    WHEN `Churn Category`='Competitor' THEN 'Competitor'
    WHEN `Churn Category`='Dissatisfaction' THEN 'Dissatisfaction'
    WHEN `Churn Category`='Attitude' THEN 'Attitude'
    WHEN `Churn Category`='Other' THEN 'Undisclosed'
	WHEN `Churn Category`='Price' THEN 'Price'
    WHEN `Churn Category`='Attitude' THEN 'Attitude'
    WHEN `Churn Category`='' THEN 'Null' 
END AS `Churn  Category`,
CASE
	WHEN `Churn Reason`='Competitor had better devices' THEN 'Competitor had better devices'
    WHEN `Churn Reason`='Competitor made better offer' THEN 'Competitor made better offer'
    WHEN `Churn Reason`='Attitude of support person' THEN 'Attitude of support person'
    WHEN `Churn Reason`='Don''t know' THEN 'Don''t know'
    WHEN `Churn Reason`='Competitor offered more data' THEN 'Competitor offered more data'
    WHEN `Churn Reason`='Competitor offered higher download speeds' THEN 'Competitor offered higher download speeds'
    WHEN `Churn Reason`='Attitude of service provider' THEN 'Attitude of service provider'
    WHEN `Churn Reason`='Product dissatisfaction' THEN 'Product dissatisfaction'
    WHEN `Churn Reason`='Network reliability' THEN 'Network reliability'
    WHEN `Churn Reason`='Price too high' THEN 'Price too high'
    WHEN `Churn Reason`='Service dissatisfaction' THEN 'Service dissatisfaction'
    WHEN `Churn Reason`='Moved' THEN 'Moved'
    WHEN `Churn Reason`='Extra data charges' THEN 'Extra data charges'
    WHEN `Churn Reason`='Long distance charges' THEN 'Long distance charges'
    WHEN `Churn Reason`='Limited range of services' THEN 'Limited range of services'
    WHEN `Churn Reason`='Lack of affordable download/upload speed' THEN 'Lack of affordable download/upload speed'
    WHEN `Churn Reason`='Poor expertise of online support' THEN 'Poor expertise of online support'
    WHEN `Churn Reason`='Lack of self-service on Website' THEN 'Lack of self-service on Website'
    WHEN `Churn Reason`='Poor expertise of phone support' THEN 'Poor expertise of phone support'
    WHEN `Churn Reason`='Deceased' THEN 'Deceased'
    WHEN `Churn Reason`='' THEN 'Null'
End AS `Churn Reason`    
FROM `Telecom`.`t_churn`
ORDER BY `Tenure in Months`;


### TENURE IN MONTHS ###
SELECT `Tenure in Months`,
COUNT(`Customer Status`)AS Count,
CASE
    WHEN `Customer Status`='Stayed' THEN 'Stayed'
    WHEN `Customer Status`='Churned' THEN 'Churned'
	WHEN `Customer Status`='Joined' THEN 'Joined'
    WHEN `Customer Status`='' Then '' Else 'Null'
END AS `Customer Status`
FROM `Telecom`.`t_churn`
WHERE `Tenure in Months`<'5'
GROUP BY `Customer Status`, `Tenure in Months`
ORDER BY `Tenure in Months` DESC;


## PHONE SERVICE ##
SELECT DISTINCT `Phone Service`,  `Customer ID`,
CASE
	WHEN `Phone Service`='Yes' THEN 'YES' ELSE 'NO'
END AS `Phone Service`
FROM `Telecom`.`t_churn`
GROUP BY `Customer ID`, `Phone Service`;


## MULTIPLE LINES ##
SELECT DISTINCT `Multiple Lines`,
	COUNT(`Multiple Lines`) AS Count
FROM `Telecom`.`t_churn`
GROUP BY `Multiple Lines`;

## INTERNET SERVICES ##
SELECT DISTINCT `Internet Service`,
	COUNT(`Internet Service`) AS Count
FROM `Telecom`.`t_churn`
GROUP BY `Internet Service`;
