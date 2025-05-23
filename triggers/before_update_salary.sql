DELIMITER //
CREATE TRIGGER trg_before_update_salary
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_updates_log(emp_id, old_salary, new_salary, updated_at)
        VALUES (OLD.emp_id, OLD.salary, NEW.salary, NOW());
    END IF;
END;
//
DELIMITER ;
