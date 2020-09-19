/*
Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT  COALESCE(salary, NULL) as getNthHighestSalary
      FROM (
          SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) as ranking
          FROM employee
      ) a
      WHERE ranking = n 
      LIMIT 1
  );
END