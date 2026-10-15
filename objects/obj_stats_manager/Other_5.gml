global.points = global.cobwebs_cleaned
              + global.temps_set
              + (global.player_put_in_place - global.player_took_out_of_place)
              - global.num_art_out_of_place
              - (3 - global.temps_set);

// factor in door locked

global.fired = global.num_art_out_of_place > 2;