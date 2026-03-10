# SQL Practice Questions using MySQL "world" Database

The **world database** comes with MySQL Community Edition and contains the following main tables:

- `city`
- `country`
- `countrylanguage`

These exercises cover:

- SELECT queries
- WHERE clause
- Aggregate functions
- GROUP BY
- HAVING
- Subqueries
- All types of JOINs

---

# 1. Basic SELECT Queries

1. Retrieve all columns from the `country` table.
select * from city;

2. Retrieve the names and population of all countries.
select name, population from city;

3. List all cities from the `city` table.
select name from city;

4. Display the names of all countries in alphabetical order.
select name from country order by name asc;

5. Retrieve the first 10 cities from the `city` table.
select name from country limit 10;

6. Display the name and life expectancy of all countries.
select name, LifeExpectancy from country;

7. Retrieve all distinct continents.
select distinct continent from country;

---

# 2. WHERE Clause Questions

8. Retrieve all countries located in **Asia**.
select  Name from country where Continent = 'Asia'

9. List countries with a population greater than **50 million**.
select  Name from country where Population > 50000000

10. Find cities with a population greater than **1 million**.
select name from country where population > 10000000

11. Retrieve countries where life expectancy is greater than **70**.
select name from country where lifeexpectancy > 70

12. Display cities located in **India**.

13. Find countries whose population is between **10 million and 100 million**.

14. List countries whose name starts with **A**.

15. Retrieve countries whose name ends with **land**.

16. Find cities with population less than **50000**.

---

# 3. ORDER BY Questions

17. List all countries ordered by population in descending order.

18. Retrieve cities ordered by population from highest to lowest.

19. Display countries ordered by life expectancy.

20. List cities ordered alphabetically.

---

# 4. Aggregate Functions

21. Find the **total population of all countries**.

22. Find the **average life expectancy** of all countries.

23. Find the **maximum population among all cities**.

24. Find the **minimum population among cities**.

25. Count the total number of countries.

26. Count the number of cities in the database.

---

# 5. GROUP BY Questions

27. Find the **total population of each continent**.

28. Find the **number of countries in each continent**.

29. Find the **average life expectancy per continent**.

30. Find the **total population of cities for each country**.

31. Count how many cities exist in each country.

32. Find the number of languages spoken in each country.

---

# 6. HAVING Clause

33. Find continents with total population greater than **500 million**.

34. Find countries with more than **10 cities**.

35. Find continents where the average life expectancy is greater than **70**.

36. Find countries where total city population exceeds **5 million**.

---

# 7. INNER JOIN Questions

37. List cities along with their country names.

38. Display city name, country name, and population.

39. List countries and their official languages.

40. Display all cities along with their continent.

41. Show country name and the number of cities in that country.

---

# 8. LEFT JOIN Questions

42. List all countries and their cities (including countries without cities).

43. Display countries and languages spoken (including countries with no language entry).

44. Show country names and city names where city may not exist.

---

# 9. RIGHT JOIN Questions

45. List all cities and the country they belong to (including unmatched cities).

46. Display all languages and the country they belong to.

---

# 10. SELF JOIN Questions

47. Find pairs of countries located in the same continent.

48. Find cities in the same country.

---

# 11. CROSS JOIN Questions

49. Display all possible combinations of countries and languages.

50. Generate combinations of continents and languages.

---

# 12. Subquery Questions

51. Find the country with the **highest population**.

52. Find cities with population greater than the **average city population**.

53. Find countries whose population is greater than the **average population of all countries**.

54. Find the country with the **largest number of cities**.

55. Find the continent with the **maximum total population**.

---

# 13. Correlated Subqueries

56. Find cities whose population is greater than the **average population of cities in the same country**.

57. Find countries whose population is greater than the **average population of countries in the same continent**.

---

# 14. Complex Join + Group By

58. Find the **top 5 countries with the highest number of cities**.

59. Find the **continent with the largest total city population**.

60. Find the **country with the highest number of languages**.

61. Find the **most populated city in each country**.

---

# 15. Analytical Questions

62. Find the **top 10 most populated cities in the world**.

63. Find the **largest country in each continent by population**.

64. Find countries where **city population exceeds country population average**.

65. Find the **continent with the highest average life expectancy**.

---

# 16. Advanced Practice

66. Find countries that speak **more than one language**.

67. Find cities whose population is greater than **all cities in the same country**.

68. Find countries with **no cities recorded**.

69. Find countries that have **no official language**.

70. Find the **country with the highest number of languages spoken**.

---

# 17. Real-World Case Study Questions

### Global Population Analysis

71. Find total population per continent.

72. Find top 5 countries contributing the most population in each continent.

73. Find percentage population of each country relative to its continent.

74. Find average city population per country.

75. Find cities contributing more than **50% of their country's population**.

---

# Conclusion

These questions cover:

- SELECT
- WHERE
- GROUP BY
- HAVING
- Aggregate Functions
- Subqueries
- Correlated Subqueries
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- SELF JOIN
- CROSS JOIN

Practicing these queries on the **MySQL world database** helps build strong SQL fundamentals for:

- Interviews
- Data analysis
- Backend development
- Database design

---