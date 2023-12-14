
SELECT *, CURRENT_TIMESTAMP AS loaded_timestamp

FROM read_json('/shared/json/rawDailySales_*.json', auto_detect=True, format='array')