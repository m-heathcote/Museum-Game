if (!in_use) exit;
    
in_use = false;
player.frozen = false;

// re-enable interactions after a delay
alarm[0] = 5;