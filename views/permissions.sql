-- Criar usuários
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senha123';
CREATE USER 'employee'@'localhost' IDENTIFIED BY 'senha123';

-- Conceder permissões ao gerente
GRANT SELECT ON vw_empregados_departamento_localidade TO 'gerente'@'localhost';
GRANT SELECT ON vw_departamentos_gerentes TO 'gerente'@'localhost';
GRANT SELECT ON vw_projetos_departamentos_gerentes TO 'gerente'@'localhost';
GRANT SELECT ON employees TO 'gerente'@'localhost';
GRANT SELECT ON departments TO 'gerente'@'localhost';

-- Conceder permissões ao employee (restrito)
GRANT SELECT ON vw_projetos_mais_empregados TO 'employee'@'localhost';
GRANT SELECT ON vw_empregados_dependentes_gerentes TO 'employee'@'localhost';
