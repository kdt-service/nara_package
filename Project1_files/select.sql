SELECT Champions, COUNT(Champions) AS 'Pick', 
	Case
		When round((Sum(`Kill`) + sum(Assist))/ sum(Death),2) is null then round(Sum(`Kill`) + sum(Assist)*1.2,2)
		else round((Sum(`Kill`) + sum(Assist))/ sum(Death),2)
	END as KDA,
round(count(case when `W/L`='Win' then 1 end)/ COUNT(Champions),2) AS 'Winrate'
FROM `drx beryl`
where Gameinfo Like '%Spring%' 
where Gameinfo Like '%Summer%' 
where Gameinfo Like '%Worlds%' or Gameinfo Like '%Regional%'
group by Champions
HAVING COUNT(Champions) > 0
Order by pick desc