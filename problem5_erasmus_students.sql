SELECT 
    ep.host_country,
    COUNT(DISTINCT sp.student_id) AS student_count
FROM erasmus_programs ep
JOIN student_programs sp ON ep.program_id = sp.program_id
GROUP BY ep.host_country
HAVING COUNT(DISTINCT sp.student_id) >
       (SELECT AVG(cnt) FROM (
           SELECT COUNT(*) cnt
           FROM student_programs
           GROUP BY program_id
       ) sub);
