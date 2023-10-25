local Cooldown; Cooldown = hookfunction(wait, function(v)
    v = 0;
    return Cooldown(v);
end);