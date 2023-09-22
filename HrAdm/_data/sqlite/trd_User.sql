CREATE TRIGGER trd_User AFTER DELETE ON User FOR EACH ROW
BEGIN
  INSERT INTO XpLog (RowId, TableName, Crud, Created) VALUES
    (OLD.Id, 'User', 'D', CURRENT_TIMESTAMP);
END;