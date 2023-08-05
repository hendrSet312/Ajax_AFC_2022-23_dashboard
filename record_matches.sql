select games.date,
	games.season,
	club_games.game_id,
	competitions.name ,
	games.home_club_name,
	games.away_club_name,
	club_games.own_position,
	games.round,club_games.own_goals,
	club_games.opponent_goals,
	club_games.is_win,
	CASE WHEN club_games.opponent_goals = club_games.own_goals THEN 1 ELSE 0 END AS is_draw,
    CASE WHEN club_games.opponent_goals <> club_games.own_goals AND club_games.is_win = 0 THEN 1 ELSE 0 END AS is_lose,
	club_games.own_manager_name,
	club_games.hosting
	
from club_games
INNER join clubs on clubs.club_id = club_games.club_id
INNER join games on games.game_id = club_games.game_id
INNER join competitions on competitions.competition_id = games.competition_id
where clubs.name = "Ajax Amsterdam" and games.season >= 2014
order by games.date;