DROP DATABASE IF EXISTS sqltrain;
CREATE DATABASE IF NOT EXISTS sqltrain;

USE sqltrain;

CREATE TABLE IF NOT EXISTS series (seq INTEGER NOT NULL PRIMARY KEY CHECK (seq > 0));

CREATE TABLE IF NOT EXISTS Digits (digit INTEGER NOT NULL PRIMARY KEY);

-- 0から9のテーブルを作成する
INSERT INTO Digits VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9); 

-- 数列を作る
INSERT INTO series(seq)
       SELECT (D3.digit * 1000 + D2.digit * 100 + D1.digit * 10 + D0.digit + 1) AS seq FROM Digits AS D0, Digits AS D1, Digits AS D2, Digits AS D3;

DROP DATABASE sqltrain;
