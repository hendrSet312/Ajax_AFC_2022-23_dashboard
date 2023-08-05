select players.image_url,appearances.game_id,players.current_club_name,games.season, players.name,players.position,competitions.name,players.sub_position,players.country_of_citizenship,
appearances.goals, appearances.assists, appearances.minutes_played,players.market_value_in_eur,appearances.yellow_cards,appearances.red_cards
from players
INNER join appearances on players.player_id = appearances.player_id
INNER join competitions on competitions.competition_id = appearances.competition_id
INNER join games on games.game_id = appearances.game_id
where players.current_club_name = "Ajax Amsterdam" and competitions.name IN (select distinct ajax_competition_record.name
from ajax_competition_record) 
;



