CREATE TRIGGER trc_User AFTER INSERT ON User FOR EACH ROW
BEGIN
  INSERT INTO XpLog (RowId, TableName, Crud, Created) VALUES
    (NEW.Id, 'User', 'C', CURRENT_TIMESTAMP);
END;