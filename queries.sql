-- ============================================
-- Uniswap V3 Trading Activity Analysis
-- Author: Bobby Pakenham | February 2026
-- Data source: Dune Analytics (dex.trades)
-- Live dashboard: https://dune.com/bobbypakenham/uniswap-v3-trading-activity-analysis
-- ============================================


-- Query 1: Daily Trading Volume (USD)
SELECT
    DATE_TRUNC('day', block_time) AS day,
    SUM(amount_usd) AS daily_volume_usd
FROM dex.trades
WHERE project = 'uniswap'
  AND version = '3'
  AND block_time >= NOW() - INTERVAL '90' DAY
GROUP BY 1
ORDER BY 1;


-- Query 2: Top 10 Most Active Pools
SELECT
    token_bought_symbol || '/' || token_sold_symbol AS pool,
    blockchain,
    COUNT(*) AS swap_count,
    SUM(amount_usd) AS total_volume_usd
FROM dex.trades
WHERE project = 'uniswap'
  AND version = '3'
  AND block_time >= NOW() - INTERVAL '90' DAY
GROUP BY 1, 2
ORDER BY total_volume_usd DESC
LIMIT 10;


-- Query 3: Top 20 Traders by Volume
SELECT
    taker AS wallet,
    COUNT(*) AS swap_count,
    SUM(amount_usd) AS total_volume_usd
FROM dex.trades
WHERE project = 'uniswap'
  AND version = '3'
  AND block_time >= NOW() - INTERVAL '90' DAY
GROUP BY 1
ORDER BY total_volume_usd DESC
LIMIT 20;


-- Query 4: Trader Behaviour by Chain
SELECT
    blockchain,
    COUNT(DISTINCT taker) AS unique_traders,
    SUM(amount_usd) / COUNT(*) AS avg_swap_size_usd,
    SUM(amount_usd) AS total_volume_usd
FROM dex.trades
WHERE project = 'uniswap'
  AND version = '3'
  AND block_time >= NOW() - INTERVAL '90' DAY
GROUP BY 1
ORDER BY total_volume_usd DESC;


-- Query 5: Uniswap V3 Market Share vs Other DEXs
SELECT
    project,
    SUM(amount_usd) AS total_volume_usd,
    COUNT(*) AS swap_count,
    ROUND(100.0 * SUM(amount_usd) / SUM(SUM(amount_usd)) OVER (), 2) AS market_share_pct
FROM dex.trades
WHERE block_time >= NOW() - INTERVAL '90' DAY
  AND project IN ('uniswap', 'curve', 'balancer', 'sushiswap', '1inch')
GROUP BY 1
ORDER BY total_volume_usd DESC;
