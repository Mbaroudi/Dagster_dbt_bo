
SELECT *, CURRENT_TIMESTAMP AS loaded_timestamp

FROM read_csv('/shared/csv/DailySales_*.csv', auto_detect=True)