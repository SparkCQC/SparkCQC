SELECT g1.src, g1.dst, g2.dst, g3.dst, c1.cnt, c2.cnt, c3.cnt, c4.cnt
FROM epinions g1, epinions g2, epinions g3,
(SELECT src, COUNT(*) AS cnt FROM epinions GROUP BY src) AS c1,
(SELECT src, COUNT(*) AS cnt FROM epinions GROUP BY src) AS c2,
(SELECT src, COUNT(*) AS cnt FROM epinions GROUP BY src) AS c3,
(SELECT dst, COUNT(*) AS cnt FROM epinions GROUP BY dst) AS c4
WHERE g1.dst = g2.src AND g2.dst = g3.src
AND g1.src = c1.src AND g3.dst = c2.src AND g3.dst = c4.dst AND g2.src = c3.src
AND c1.cnt + 1000 < c2.cnt AND c3.cnt < c4.cnt