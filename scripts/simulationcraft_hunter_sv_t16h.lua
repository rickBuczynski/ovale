local _, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "SimulationCraft: Hunter_SV_T16H"
	local desc = "[5.4] SimulationCraft: Hunter_SV_T16H" 
	local code = [[
# Based on SimulationCraft profile "Hunter_SV_T16H".
#	class=hunter
#	spec=survival
#	talents=http://us.battle.net/wow/en/tool/talent-calculator#Yb!...200

Include(ovale_items)
Include(ovale_racials)
Include(ovale_hunter_spells)

AddFunction SurvivalDefaultActions
{
	#virmens_bite_potion,if=target.time_to_die<=25|buff.stampede.up
	if target.TimeToDie() <= 25 or BuffPresent(stampede_buff) UsePotionAgility()
	#blood_fury
	Spell(blood_fury)
	#auto_shot
	#explosive_trap,if=active_enemies>1
	if Enemies() > 1 Spell(explosive_trap)
	#fervor,if=enabled&focus<=50
	if TalentPoints(fervor_talent) and Focus() <= 50 Spell(fervor)
	#a_murder_of_crows,if=enabled&!ticking
	if TalentPoints(a_murder_of_crows_talent) and not target.DebuffPresent(a_murder_of_crows_debuff) Spell(a_murder_of_crows)
	#lynx_rush,if=enabled&!dot.lynx_rush.ticking
	if TalentPoints(lynx_rush_talent) and not target.DebuffPresent(lynx_rush_debuff) Spell(lynx_rush)
	#explosive_shot,if=buff.lock_and_load.react
	if BuffPresent(lock_and_load_buff) Spell(explosive_shot)
	#glaive_toss,if=enabled
	if TalentPoints(glaive_toss_talent) Spell(glaive_toss)
	#powershot,if=enabled
	if TalentPoints(powershot_talent) Spell(powershot)
	#barrage,if=enabled
	if TalentPoints(barrage_talent) Spell(barrage)
	#serpent_sting,if=!ticking&target.time_to_die>=10
	if not target.DebuffPresent(serpent_sting_debuff) and target.TimeToDie() >= 10 Spell(serpent_sting)
	#explosive_shot,if=cooldown_react
	if Spell(explosive_shot) Spell(explosive_shot)
	#kill_shot
	Spell(kill_shot usable=1)
	#black_arrow,if=!ticking&target.time_to_die>=8
	if not target.DebuffPresent(black_arrow_debuff) and target.TimeToDie() >= 8 Spell(black_arrow)
	#multi_shot,if=active_enemies>3
	if Enemies() > 3 Spell(multi_shot)
	#multi_shot,if=buff.thrill_of_the_hunt.react&dot.serpent_sting.remains<2
	if BuffPresent(thrill_of_the_hunt_buff) and target.DebuffRemains(serpent_sting_debuff) < 2 Spell(multi_shot)
	#arcane_shot,if=buff.thrill_of_the_hunt.react
	if BuffPresent(thrill_of_the_hunt_buff) Spell(arcane_shot)
	#rapid_fire,if=!buff.rapid_fire.up
	if not BuffPresent(rapid_fire_buff) Spell(rapid_fire)
	#dire_beast,if=enabled
	if TalentPoints(dire_beast_talent) Spell(dire_beast)
	#stampede,if=trinket.stat.agility.up|target.time_to_die<=20|(trinket.stacking_stat.agility.stack>10&trinket.stat.agility.cooldown_remains<=3)
	if BuffPresent(trinket_stat_agility_buff) or target.TimeToDie() <= 20 or { BuffStacks(trinket_stacking_stat_agility_buff) > 10 and { ItemCooldown(Trinket0Slot) + ItemCooldown(Trinket1Slot) } <= 3 } Spell(stampede)
	#cobra_shot,if=dot.serpent_sting.remains<6
	if target.DebuffRemains(serpent_sting_debuff) < 6 Spell(cobra_shot)
	#arcane_shot,if=focus>=67&active_enemies<2
	if Focus() >= 67 and Enemies() < 2 Spell(arcane_shot)
	#multi_shot,if=focus>=67&active_enemies>1
	if Focus() >= 67 and Enemies() > 1 Spell(multi_shot)
	#cobra_shot
	Spell(cobra_shot)
}

AddFunction SurvivalPrecombatActions
{
	#flask,type=spring_blossoms
	#food,type=sea_mist_rice_noodles
	#aspect_of_the_hawk
	if not Stance(hunter_aspect_of_the_hawk) Spell(aspect_of_the_hawk)
	#hunters_mark,if=target.time_to_die>=21&!debuff.ranged_vulnerability.up
	if target.TimeToDie() >= 21 and not target.DebuffPresent(ranged_vulnerability any=1) Spell(hunters_mark)
	#summon_pet
	SummonPet()
	#snapshot_stats
	#virmens_bite_potion
	UsePotionAgility()
}

AddIcon mastery=survival help=main
{
	if InCombat(no) SurvivalPrecombatActions()
	SurvivalDefaultActions()
}

### Required symbols
# a_murder_of_crows
# a_murder_of_crows_debuff
# a_murder_of_crows_talent
# arcane_shot
# aspect_of_the_hawk
# barrage
# barrage_talent
# black_arrow
# black_arrow_debuff
# blood_fury
# cobra_shot
# dire_beast
# dire_beast_talent
# explosive_shot
# explosive_trap
# fervor
# fervor_talent
# glaive_toss
# glaive_toss_talent
# hunters_mark
# kill_shot
# lock_and_load_buff
# lynx_rush
# lynx_rush_debuff
# lynx_rush_talent
# multi_shot
# powershot
# powershot_talent
# rapid_fire
# rapid_fire_buff
# serpent_sting
# serpent_sting_debuff
# stampede
# stampede_buff
# summon_pet
# thrill_of_the_hunt_buff
# trinket_stacking_stat_agility_buff
# trinket_stat_agility_buff
# virmens_bite_potion
]]
	OvaleScripts:RegisterScript("HUNTER", name, desc, code, "reference")
end