# Uniswap V3 - Trading Activity Analysis

On-chain analysis of Uniswap V3 trading activity across 10+ blockchains 
over the last 90 days, built using SQL on Dune Analytics.

## 🔗 Live Dashboard
[View on Dune Analytics](https://dune.com/bobbypakenham/uniswap-v3-trading-activity-analysis)

## 📊 What This Analyses
- Daily trading volume trends over 90 days
- Top 10 most active liquidity pools by volume
- Top 20 traders by total USD volume
- Cross-chain trader behaviour (unique traders, avg swap size, total volume)
- Uniswap V3 market share vs Curve, Balancer, and SushiSwap

## 💡 Key Findings
- Uniswap V3 commands **90.18% DEX market share** over the period
- Over **$280bn in total volume** processed across 10+ chains
- Ethereum leads by average swap size ($4,137 avg per swap)
- BNB chain leads by unique trader count
- USDC/WETH and WETH/USDC are the dominant pools on Arbitrum and Ethereum
- Volume spiked sharply in late January 2026

## 🛠 Tools & Methods
- **Dune Analytics** — on-chain data platform
- **SQL** — all queries written using the `dex.trades` spellbook table
- **Chains covered** — Ethereum, Arbitrum, Base, BNB, Polygon, Optimism, 
  Gnosis, Celo, Monad and more

## 📁 Files
- `queries.sql` — all 5 SQL queries used in the dashboard

## Author
Bobby Pakenham · IE Business School — Economics & Data Science · February 2026
