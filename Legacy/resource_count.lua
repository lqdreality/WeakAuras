local local_class,english_class,class_num = UnitClass("player");
local spec_num = GetSpecialization();
if class_num == 1 then
	aura_env.class = "warrior"
elseif class_num == 2 then
    aura_env.class = "paladin"
elseif class_num == 3 then
    aura_env.class = "hunter"
elseif class_num == 4 then
    aura_env.class = "rogue"
elseif class_num == 5 then
    aura_env.class = "priest"
elseif class_num == 6 then
    aura_env.class = "deathknight"
elseif class_num == 7 then
    aura_env.class = "shaman"
elseif class_num == 8 then
    aura_env.class = "mage"
elseif class_num == 9 then
    aura_env.class = "warlock"
elseif class_num == 10 then
    aura_env.class = "monk"
elseif class_num == 11 then
    aura_env.class = "druid"
elseif class_num == 12 then
    aura_env.class = "demonhunter"
else
	aura_env.class = nil
end
aura_env.spec_num = spec_num