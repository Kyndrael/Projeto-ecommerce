CREATE TABLE IF NOT EXISTS deleted_users_log (
    user_id INT,
    user_email VARCHAR(255),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_before_delete_user
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    INSERT INTO deleted_users_log (user_id, user_email)
    VALUES (OLD.user_id, OLD.email);
END;
//
DELIMITER ;
