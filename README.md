# Cross-Chain Rebase Dashboard

This project provides analytics for a Cross-Chain Rebase Token built with Chainlink CCIP. It combines SQL Server data modeling and Power BI visualizations to track user deposits, token rebasing yields, and cross-chain bridging activity.

---

## Table of Contents

- [Project Overview](#project-overview)  
- [Database Structure](#database-structure)  
- [Power BI Reports](#power-bi-reports)  

---

## Project Overview

The dashboard analyzes the behavior of a rebase token deployed across multiple blockchains. It uses SQL Server to store user data, deposits, rebases, and bridging events, while Power BI generates insightful visual reports to track token growth and cross-chain activity.

---

## Database Structure

The SQL Server database stores the following key tables:

- **Users:** Stores wallet addresses and metadata about token holders.  
- **Deposits:** Records each ETH deposit made by users along with timestamps.  
- **Rebases:** Tracks hourly token balances per user, reflecting the incremental rebasing yield.  
- **Bridges:** Logs tokens bridged between supported chains (e.g., Sepolia, Arbitrum, Polygon), including source/destination chains and amounts.

This structured data enables detailed historical analysis of user activity and token performance.

### Model Representation

Below is the entity-relationship model representation of the SQL database named `ccip_rebase_db`:

![Model Representation of the SQL Database called ccip_rebase_db](https://github.com/user-attachments/assets/10ac6302-8d1e-4dd1-847f-df8a35f20fbd)

---

## Power BI Reports

The Power BI project connects to the SQL Server database and provides multiple report pages with:

- **Total Deposits Over Time:** Visualizes ETH deposited by users across chains.  
- **User Token Balances & Rebase Growth:** Tracks individual user balances and their growth due to rebasing.  
- **Cross-Chain Bridge Flows:** Displays token movements between different blockchain networks.  
- **Summary Dashboards:** Key metrics and KPIs aggregated for quick insights.

### Example Visualization

Here is an example Power BI visual showing the sum of total deposits and count of users grouped by wallet address:

![Sum of TotalDeposited and Count of UserID by WalletAddress](https://github.com/user-attachments/assets/8ef4dbac-ac68-4d4c-8a64-a28c84e53a73)


Sum of TotalTokens by FromChain and ToChain: 
<img width="746" height="546" alt="image" src="https://github.com/user-attachments/assets/134542b5-6711-48dd-a5ed-ad0539ab25dd" />



