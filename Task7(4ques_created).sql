select * from employee

select * from department

select * from project

--get emp whose age is over 40 and exp between 6 to 10 and their salary , department_name, manager_name

select e.first_name, e.age, e.experience, e.salary, d.department_name, d.manager_name from employee as e
inner join department as d
on d.department_id = e.department_id
where e.age > 40 AND e.experience between '6' and '10'

--get get emp count who work in particular project whose age under 30,
--proj_name, status of project is completed and budget 

select count(e.first_name) as "count_emp", e.age, p.project_name, p.status, p.budget as "proj_budget" from employee as e
inner join project as p 
on p.project_id = e.project_id
where e.age < 30 AND p.status = 'Completed'
group by e.age, p.project_name, p.status, p.budget


-- get avg age, avg experience, avg salary with 
--department_name, location only "newyork and sanfrancisco", department_manager and avg budget

select avg(e.age) as "avg_age", avg(e.experience) as "avg_experience", avg(e.salary) as "avg_salary", 
d.department_name, d.location, d.manager_name, avg(d.budget) as "avg_budget" from employee as e
inner join department as d
on d.department_id = e.department_id
where d.location IN ('New York' , 'San Francisco')  
group by d.department_name, d.location, d.manager_name

--I want emp, avg age, department_name & there exp is above 5years and there location is miami,
--project name is beta only, status is in progress

select e.first_name, avg(e.age) as "avg_age", e.experience, d.department_name, d.location, 
p.project_name, p.status from employee as e
inner join department as d
on d.department_id = e.department_id
inner join project as p
on p.project_id = e.project_id	
where e.experience > 5 AND d.location = 'Miami' AND p.status = 'In Progress'
group by e.first_name, e.experience, d.department_name, d.location, p.project_name, p.status
having p.project_name = 'Project Beta'









 