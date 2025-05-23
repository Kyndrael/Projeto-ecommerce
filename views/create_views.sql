-- View: Número de empregados por departamento e localidade
CREATE VIEW vw_empregados_departamento_localidade AS
SELECT d.dept_name, d.location, COUNT(e.emp_id) AS total_empregados
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name, d.location;

-- View: Departamentos e seus gerentes
CREATE VIEW vw_departamentos_gerentes AS
SELECT d.dept_name, e.emp_name AS gerente
FROM departments d
JOIN employees e ON d.manager_id = e.emp_id;

-- View: Projetos com maior número de empregados
CREATE VIEW vw_projetos_mais_empregados AS
SELECT p.project_name, COUNT(ep.emp_id) AS total_empregados
FROM projects p
JOIN employee_projects ep ON p.project_id = ep.project_id
GROUP BY p.project_name
ORDER BY total_empregados DESC;

-- View: Projetos, departamentos e gerentes
CREATE VIEW vw_projetos_departamentos_gerentes AS
SELECT p.project_name, d.dept_name, e.emp_name AS gerente
FROM projects p
JOIN departments d ON p.dept_id = d.dept_id
JOIN employees e ON d.manager_id = e.emp_id;

-- View: Empregados com dependentes e se são gerentes
CREATE VIEW vw_empregados_dependentes_gerentes AS
SELECT e.emp_name, 
       CASE WHEN d.dependent_id IS NOT NULL THEN 'Sim' ELSE 'Não' END AS possui_dependente,
       CASE WHEN e.emp_id IN (SELECT manager_id FROM departments) THEN 'Sim' ELSE 'Não' END AS eh_gerente
FROM employees e
LEFT JOIN dependents d ON e.emp_id = d.emp_id;
