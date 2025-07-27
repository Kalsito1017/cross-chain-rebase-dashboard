-- View: Rebase Growth Per User
CREATE VIEW View_RebaseGrowthPerUser AS
SELECT 
    UserID,
    MIN(Timestamp) AS StartTime,
    MAX(Timestamp) AS EndTime,
    MIN(TokenBalance) AS StartingBalance,
    MAX(TokenBalance) AS EndingBalance,
    MAX(TokenBalance) - MIN(TokenBalance) AS NetGrowth
FROM Rebases
GROUP BY UserID;
GO

-- View: Total Bridged Tokens Per Chain
CREATE VIEW View_TotalBridgedTokensPerChain AS
SELECT 
    FromChain,
    ToChain,
    SUM(TokensBridged) AS TotalTokens
FROM Bridges
GROUP BY FromChain, ToChain;
GO

-- Procedure: Insert Deposit and Rebase
CREATE PROCEDURE sp_InsertDepositAndRebase
    @UserID INT,
    @Amount DECIMAL(18,8),
    @Timestamp DATETIME
AS
BEGIN
    DECLARE @NewDepositID INT = (SELECT ISNULL(MAX(DepositID), 100) + 1 FROM Deposits);
    DECLARE @NewRebaseID INT = (SELECT ISNULL(MAX(RebaseID), 200) + 1 FROM Rebases);

    INSERT INTO Deposits (DepositID, UserID, AmountETH, Timestamp)
    VALUES (@NewDepositID, @UserID, @Amount, @Timestamp);

    INSERT INTO Rebases (RebaseID, UserID, TokenBalance, Hour, Timestamp)
    VALUES (@NewRebaseID, @UserID, @Amount, 0, @Timestamp);
END;
GO
