--CREATE DATABASE ccip_rebase_db;
--USE ccip_rebase_db;
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    WalletAddress VARCHAR(42),
    JoinedAt DATETIME
);

CREATE TABLE Deposits (
    DepositID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    AmountETH DECIMAL(18, 8),
    Timestamp DATETIME
);

CREATE TABLE Rebases (
    RebaseID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    TokenBalance DECIMAL(18, 8),
    Hour INT,
    Timestamp DATETIME
);

CREATE TABLE Bridges (
    BridgeID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    FromChain VARCHAR(50),
    ToChain VARCHAR(50),
    TokensBridged DECIMAL(18, 8),
    Timestamp DATETIME
);
CREATE VIEW TotalDepositsPerUser AS
SELECT UserID, SUM(AmountETH) AS TotalDeposited
FROM Deposits
GROUP BY UserID;

INSERT INTO Users (UserID, WalletAddress, JoinedAt) VALUES
(1, '0xA1B2C3D4E5F601234567890abcdef1234567890A', '2024-07-01 14:00:00'),
(2, '0xB1B2C3D4E5F601234567890abcdef1234567890B', '2024-07-03 09:15:00'),
(3, '0xC1B2C3D4E5F601234567890abcdef1234567890C', '2024-07-05 18:20:00');
INSERT INTO Deposits (DepositID, UserID, AmountETH, Timestamp) VALUES
(101, 1, 0.5, '2024-07-01 14:05:00'),
(102, 2, 1.2, '2024-07-03 09:17:00'),
(103, 1, 0.8, '2024-07-04 12:40:00'),
(104, 3, 0.3, '2024-07-06 08:00:00'),
(105, 2, 0.7, '2024-07-07 10:15:00');
INSERT INTO Rebases (RebaseID, UserID, TokenBalance, Hour, Timestamp) VALUES
(201, 1, 0.500, 0, '2024-07-01 14:05:00'),
(202, 1, 0.505, 1, '2024-07-01 15:05:00'),
(203, 1, 0.510, 2, '2024-07-01 16:05:00'),
(204, 2, 1.200, 0, '2024-07-03 09:17:00'),
(205, 2, 1.210, 1, '2024-07-03 10:17:00'),
(206, 3, 0.300, 0, '2024-07-06 08:00:00'),
(207, 3, 0.303, 1, '2024-07-06 09:00:00');
INSERT INTO Bridges (BridgeID, UserID, FromChain, ToChain, TokensBridged, Timestamp) VALUES
(301, 1, 'Sepolia', 'Arbitrum', 0.300, '2024-07-06 12:00:00'),
(302, 2, 'Arbitrum', 'Sepolia', 0.500, '2024-07-07 10:30:00'),
(303, 3, 'Sepolia', 'Arbitrum', 0.100, '2024-07-08 11:00:00');


