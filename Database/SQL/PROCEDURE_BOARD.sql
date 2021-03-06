USE Taskboard;

GO
CREATE OR ALTER PROCEDURE [Board.Create]
	@userId INT,
	@title NVARCHAR(64),
	@projectId INT,
	@teamId INT
AS
BEGIN
	IF NOT EXISTS (SELECT TOP 1 id FROM [USER_TOKEN] WHERE userId = @userId)
	BEGIN
		PRINT 'TOKEN EXPIRED';
		RETURN;
	END;

	IF NOT EXISTS (SELECT TOP 1 id FROM PROJECT WHERE id = @projectId)
	BEGIN
		PRINT 'PROJECT NOT EXISTS';
		RETURN;
	END;

	IF (SELECT TOP 1 "role" FROM [TEAM_USER] WHERE userId = @userId AND teamId = @teamId) != 'CREATOR'
	BEGIN
		PRINT 'ACCESS DENIED OR SUCH USER NOT EXISTS';
		RETURN;
	END;

	BEGIN TRY
		INSERT INTO BOARD(title, projectId)
			VALUES(@title, @projectId);
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END;

GO
CREATE OR ALTER PROCEDURE [Board.Delete]
	@userId INT,
	@boardId INT,
	@teamId INT
AS
BEGIN
	DECLARE taskCursor CURSOR FOR
		SELECT id FROM TASKS
			WHERE boardId = @boardId;
	DECLARE @taskToDelete INT;

	IF NOT EXISTS (SELECT TOP 1 id FROM [USER_TOKEN] WHERE userId = @userId)
	BEGIN
		PRINT 'TOKEN EXPIRED';
		RETURN;
	END;

	IF NOT EXISTS (SELECT TOP 1 id FROM BOARD WHERE id = @boardId)
	BEGIN
		PRINT 'BOARD NOT EXISTS';
		RETURN;
	END;

	IF (SELECT TOP 1 "role" FROM [TEAM_USER] WHERE userId = @userId AND teamId = @teamId) != 'CREATOR'
	BEGIN
		PRINT 'ACCESS DENIED OR SUCH USER NOT EXISTS';
		RETURN;
	END;

	BEGIN TRY
		DELETE TASKS WHERE boardId = @boardId;
		DELETE BOARD WHERE id = @boardId;
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END;
GO 
CREATE OR ALTER PROCEDURE [Board.Alter]
	@userId INT,
	@boardId INT,
	@title NVARCHAR(64),
	@teamId INT
AS
BEGIN
	IF NOT EXISTS (SELECT TOP 1 id FROM [USER_TOKEN] WHERE userId = @userId)
	BEGIN
		PRINT 'TOKEN EXPIRED';
		RETURN;
	END;

	IF NOT EXISTS (SELECT TOP 1 id FROM BOARD WHERE id = @boardId)
	BEGIN
		PRINT 'BOARD NOT EXISTS';
		RETURN;
	END;

	IF (SELECT TOP 1 "role" FROM [TEAM_USER] WHERE userId = @userId AND teamId = @teamId) != 'CREATOR'
	BEGIN
		PRINT 'ACCESS DENIED OR SUCH USER NOT EXISTS';
		RETURN;
	END;

	BEGIN TRY
		UPDATE BOARD SET title = @title;
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END;
GO
CREATE OR ALTER PROCEDURE [Board.Get]
	@userId INT,
	@teamId INT,
	@projectId INT,
	@skip INT,
	@take INT
AS
BEGIN
	IF NOT EXISTS (SELECT TOP 1 id FROM [USER_TOKEN] WHERE userId = @userId)
	BEGIN
		PRINT 'TOKEN EXPIRED';
		RETURN;
	END;

	IF NOT EXISTS (SELECT TOP 1 id FROM TEAM WHERE id = @teamId)
	BEGIN
		PRINT 'TEAM NOT EXISTS';
		RETURN;
	END;

	IF NOT EXISTS (SELECT TOP 1 id FROM PROJECT WHERE id = @projectId)
	BEGIN
		PRINT 'BOARD NOT EXISTS';
		RETURN;
	END;

	IF NOT EXISTS (SELECT TOP 1 id FROM [TEAM_USER] WHERE userId = @userId AND teamId = @teamId)
	BEGIN
		PRINT 'ACCESS DENIED OR SUCH USER NOT EXISTS';
		RETURN;
	END;

	BEGIN TRY
		SELECT id, title FROM BOARD
			WHERE projectId = @projectId
			ORDER BY id
			OFFSET @skip ROWS
			FETCH NEXT @take ROWS ONLY;;
	END TRY

	BEGIN CATCH
		SELECT
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END;