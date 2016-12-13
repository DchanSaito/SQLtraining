DROP DATABASE IF EXISTS sqltrain;
CREATE DATABASE IF NOT EXISTS sqltrain CHARSET utf8;

USE sqltrain;


CREATE TABLE IF NOT EXISTS district(
    id INTEGER PRIMARY KEY UNIQUE AUTO_INCREMENT CHECK (id > 0),
    pref_name TEXT NOT NULL,
    population INTEGER NOT NULL,
    INDEX(population)
);

INSERT INTO district(pref_name, population) VALUES ('徳島', 100), ('東京', 500), ('神奈川', 300), ('さが', 100);

SELECT CASE pref_name
       WHEN '徳島' THEN '四国'
       WHEN '東京' THEN '関東'
       WHEN '神奈川' THEN '関東'
       ELSE 'その他' END AS tiho, SUM(population)
FROM district
GROUP BY CASE pref_name
      WHEN '徳島' THEN '四国'
      WHEN '東京' THEN '関東'
      WHEN '神奈川' THEN '関東'
      ELSE 'その他' END;

DROP DATABASE sqltrain;
