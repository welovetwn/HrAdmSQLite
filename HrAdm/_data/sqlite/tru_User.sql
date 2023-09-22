CREATE TRIGGER tru_User AFTER UPDATE ON User FOR EACH ROW
BEGIN
  INSERT INTO XpLog (RowId, TableName, ColName, OldValue, NewValue, Crud, Created) VALUES
    (OLD.Id, 'User', 'Id', OLD.Id, NEW.Id, 'U', CURRENT_TIMESTAMP);
  IF OLD.Name <> NEW.Name THEN
    INSERT INTO XpLog (RowId, TableName, ColName, OldValue, NewValue, Crud, Created) VALUES
      (OLD.Id, 'User', 'Name', OLD.Name, NEW.Name, 'U', CURRENT_TIMESTAMP);
  END IF;
  IF OLD.Account <> NEW.Account THEN
    INSERT INTO XpLog (RowId, TableName, ColName, OldValue, NewValue, Crud, Created) VALUES
      (OLD.Id, 'User', 'Account', OLD.Account, NEW.Account, 'U', CURRENT_TIMESTAMP);
  END IF;
  IF OLD.Pwd <> NEW.Pwd THEN
    INSERT INTO XpLog (RowId, TableName, ColName, OldValue, NewValue, Crud, Created) VALUES
      (OLD.Id, 'User', 'Pwd', OLD.Pwd, NEW.Pwd, 'U', CURRENT_TIMESTAMP);
  END IF;
  IF OLD.DeptId <> NEW.DeptId THEN
    INSERT INTO XpLog (RowId, TableName, ColName, OldValue, NewValue, Crud, Created) VALUES
      (OLD.Id, 'User', 'DeptId', OLD.DeptId, NEW.DeptId, 'U', CURRENT_TIMESTAMP);
  END IF;
  IF OLD.PhotoFile <> NEW.PhotoFile THEN
    INSERT INTO XpLog (RowId, TableName, ColName, OldValue, NewValue, Crud, Created) VALUES
      (OLD.Id, 'User', 'PhotoFile', OLD.PhotoFile, NEW.PhotoFile, 'U', CURRENT_TIMESTAMP);
  END IF;
  IF OLD.Status <> NEW.Status THEN
    INSERT INTO XpLog (RowId, TableName, ColName, OldValue, NewValue, Crud, Created) VALUES
      (OLD.Id, 'User', 'Status', OLD.Status, NEW.Status, 'U', CURRENT_TIMESTAMP);
  END IF;
END;
