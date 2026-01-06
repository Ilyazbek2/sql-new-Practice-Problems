WITH txn_stats AS (
    SELECT
        account_id,
        transaction_date,
        amount,
        COUNT(*) OVER (
            PARTITION BY account_id,
            DATE_TRUNC('hour', transaction_date)
        ) AS hourly_txn_count,
        SUM(amount) OVER (
            PARTITION BY account_id,
            DATE(transaction_date)
        ) AS daily_total
    FROM transactions
)
SELECT *,
       CASE
           WHEN daily_total > 10000 OR hourly_txn_count >= 3
           THEN 'Suspicious'
           ELSE 'Normal'
       END AS status
FROM txn_stats;
