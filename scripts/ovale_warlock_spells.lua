local _, Ovale = ...
local OvaleScripts = Ovale.OvaleScripts

do
	local name = "ovale_warlock_spells"
	local desc = "[5.4.7] Ovale: Warlock spells"
	local code = [[
# Warlock spells and functions.

Define(agony 980)
	SpellAddTargetDebuff(agony agony_debuff=1)
Define(agony_debuff 980)
	SpellInfo(agony_debuff duration=24 haste=spell maxstacks=10 tick=2)
	SpellInfo(agony_debuff addduration=12 glyph=glyph_of_everlasting_affliction)
	SpellInfo(agony_debuff damage=AfflictionAgonyTickDamage mastery=affliction)
	SpellInfo(agony_debuff lastEstimatedDamage=AfflictionAgonyTickLastDamage mastery=affliction)
Define(aftermath 109784)
Define(archimondes_darkness_talent 16)
Define(backdraft 117896)
Define(backdraft_buff 117828)
	SpellInfo(backdraft_buff duration=15 maxstacks=3)
Define(burning_embers 108647)
# cancel_metamorphosis
Define(chaos_bolt 116858)
	SpellInfo(chaos_bolt burningembers=10)
	SpellAddBuff(chaos_bolt backdraft_buff=-3 if_spell=backdraft if_spell=pyroclasm)
Define(conflagrate 17962)
	SpellInfo(conflagrate burningembers=-1 if_spell=burning_embers)
	SpellInfo(conflagrate buff_burningembers=fire_and_brimstone_buff buff_burningembers_amount=11 if_spell=fire_and_brimstone)
Define(corruption 172)
	SpellAddTargetDebuff(corruption corruption_debuff=1)
Define(corruption_debuff 146739)
	SpellInfo(corruption_debuff duration=18 haste=spell tick=2)
	SpellInfo(corruption_debuff addduration=9 glyph=glyph_of_everlasting_affliction)
Define(curse_of_the_elements 1490)
	SpellInfo(curse_of_the_elements burningembers=0 if_spell=burning_embers)
	SpellInfo(curse_of_the_elements buff_burningembers=fire_and_brimstone_buff buff_burningembers_amount=10 if_spell=fire_and_brimstone)
Define(dark_bargain 110913)
	SpellInfo(dark_bargain cd=180)
Define(dark_bargain_talent 9)
Define(dark_regeneration 108359)
	SpellInfo(dark_regeneration cd=120)
Define(dark_regeneration_talent 1)
Define(dark_intent 109773)
Define(dark_soul_knowledge 113861)
	SpellInfo(dark_soul_knowledge cd=120 talent=!archimondes_darkness_talent)
	SpellAddBuff(dark_soul_knowledge dark_soul_knowledge_buff=1)
Define(dark_soul_knowledge_buff 113858)
	SpellInfo(dark_soul_knowledge_buff duration=20)
Define(dark_soul_instability 113858)
	SpellInfo(dark_soul_instability cd=120 talent=!archimondes_darkness_talent)
	SpellAddBuff(dark_soul_instability dark_soul_instability_buff=1)
Define(dark_soul_instability_buff 113858)
	SpellInfo(dark_soul_instability_buff duration=20)
Define(dark_soul_misery 113860)
	SpellInfo(dark_soul_misery cd=120 talent=!archimondes_darkness_talent)
	SpellAddBuffoul_misery dark_soul_misery_buff=1)
Define(dark_soul_misery_buff 113858)
	SpellInfo(dark_soul_misery_buff duration=20)
Define(demonic_circle_teleport 48020)
	SpellInfo(demonic_circle_teleport cd=30)
Define(demonic_fury 104315)
Define(doom 603)
	SpellInfo(doom demonicfury=60 stance=warlock_metamophosis)
	SpellAddTargetDebuff(doom doom_debuff=1)
Define(doom_debuff 603)
	SpellInfo(doom_debuff duration=60 haste=spell tick=15)
Define(drain_soul 1120)
	SpellInfo(drain_soul channel=6 haste=spell)
Define(fel_flame 77799)
	SpellInfo(fel_flame burningembers=-1 if_spell=burning_embers)
	SpellInfo(fel_flame demonicfury=-15 if_spell=demonic_fury)
Define(felguard_felstorm 89751)
	SpellInfo(felguard_felstorm cd=45)
	SpellAddBuff(felguard_felstorm felguard_felstorm_buff=1)
Define(felguard_felstorm_buff 89751)
	SpellInfo(felguard_felstorm_buff duration=6)
Define(fire_and_brimstone 108683)
	SpellInfo(fire_and_brimstone cd=1)
	SpellAddBuff(fire_and_brimstone fire_and_brimstone_buff=1)
Define(fire_and_brimstone_buff 108683)
Define(glyph_of_everlasting_affliction 118778)
Define(glyph_of_havoc 146962)
Define(grimoire_of_sacrifice 108503)
	SpellInfo(grimoire_of_sacrifice cd=30)
	SpellAddBuff(grimoire_of_sacrifice grimoire_of_sacrifice_buff=1)
Define(grimoire_of_sacrifice_buff 108503)
	SpellInfo(grimoire_of_sacrifice_buff duration=3600)
Define(grimoire_of_sacrifice_talent 15)
Define(grimoire_of_service_talent 14)
Define(grimoire_of_supremacy_talent 13)
Define(hand_of_guldan 105174)
	SpellAddTargetDebuff(hand_of_guldan shadowflame_debuff=1)
Define(haunt 48181)
	SpellInfo(haunt shards=1)
	SpellAddTargetDebuff(haunt haunt_debuff=1)
Define(haunt_debuff 48181)
	SpellInfo(haunt_debuff duration=8 haste=spell tick=2)
Define(havoc 80240)
	SpellInfo(havoc cd=25)
	SpellInfo(havoc addcd=35 glyph=glyph_of_havoc)
	SpellAddTargetDebuff(havoc havoc_debuff=3 glyph=!glyph_of_havoc)
	SpellAddTargetDebuff(havoc havoc_debuff=6 glyph=glyph_of_havoc)
Define(havoc_debuff 80240)
	SpellInfo(havoc_debuff duration=15)
	SpellInfo(havoc_debuff maxstacks=3 glyph=!glyph_of_havoc)
	SpellInfo(havoc_debuff maxstacks=6 glyph=glyph_of_havoc)
Define(hellfire 1949)
	SpellInfo(hellfire channel=14 demonicfury=-10 haste=spell)
Define(immolate 348)
	SpellInfo(immolate buff_burningembers=fire_and_brimstone_buff buff_burningembers_amount=10 if_spell=fire_and_brimstone)
	SpellAddTargetDebuff(immolate immolate_debuff=1)
Define(immolate_debuff 348)
	SpellInfo(immolate_debuff duration=15 haste=spell tick=3)
Define(immolation_aura 104025)
	SpellInfo(immolation_aura demonicfury=0 stance=warlock_metamorphosis)
	SpellAddBuff(immolation_aura immolation_aura_buff=1)
Define(immolation_aura_buff 104025)
	SpellInfo(immolation_aura duration=10 haste=spell tick=1)
Define(incinerate 29722)
	SpellInfo(incinerate burningembers=-1 if_spell=burning_embers)
	SpellInfo(incinerate buff_burningembers=fire_and_brimstone_buff buff_burningembers_amount=11 if_spell=fire_and_brimstone)
	SpellAddBuff(incinerate backdraft_buff=-1 if_spell=backdraft)
Define(life_tap 1454)
Define(malefic_grasp 103103)
#	SpellInfo(malefic_grasp channel=4 haste=spell)	# XXX Don't interrupt channeling Malefic Grasp.
Define(metamorphosis 103958)
	SpellInfo(metamorphosis demonicfury=0 cd=10)
	SpellAddBuff(metamorphosis metamorphosis_buff=1)
Define(metamorphosis_buff 103958)
Define(molten_core_buff 122355)
	SpellInfo(molten_core_buff duration=30)
Define(pandemic 131973)
Define(pyroclasm 123686)
Define(rain_of_fire 5740)
	SpellInfo(rain_of_fire channel=6 haste=spell)
Define(rain_of_fire_debuff 5740)
Define(rain_of_fire_aftermath 104232)
Define(rain_of_fire_aftermath_debuff 104232)
Define(sacrificial_pact 108416)
	SpellInfo(sacrificial_pact cd=60)
Define(sacrificial_pact_talent 8)
Define(seed_of_corruption 27243)
	SpellAddTargetDebuff(seed_of_corruption seed_of_corruption_debuff=1)
Define(seed_of_corruption_debuff 27243)
	SpellInfo(seed_of_corruption_debuff duration=18 haste=spell tick=3)
Define(service_felguard 111898)
	SpellInfo(service_felguard cd=120)
Define(service_felhunter 111897)
	SpellInfo(service_felhunter cd=120)
Define(service_pet 108501)
	SpellInfo(service_pet cd=120)
Define(shadow_bolt 686)
	SpellInfo(shadow_bolt demonicfury=-25 if_spell=demonic_fury)
Define(shadowburn 17877)
	SpellInfo(shadowburn burningembers=10 if_spell=burning_embers)
Define(shadowflame_debuff 47960)
	SpellInfo(shadowflame_debuff duration=6 haste=spell tick=1)
Define(shadowfury 30283)
	SpellInfo(shadowfury cd=30)
Define(shadowfury_talent 6)
Define(skull_banner_buff 114206)
	SpellInfo(skull_banner_buff duration=10)
Define(soul_fire 6353)
	SpellInfo(soul_fire demonicfury=30 if_spell=demonic_fury)
	SpellAddBuff(soul_fire molten_core_debuff=0)
Define(soul_swap 86121)
	SpellAddBuff(soul_swap soul_swap_buff=1)
Define(soul_swap_buff 86211)
	SpellInfo(soul_swap_buff duration=3)
Define(soul_swap_exhale 86213)
Define(soulburn 74434)
	SpellInfo(soulburn cd=1 shards=1)
	SpellAddBuff(soulburn soulburn_buff=1)
Define(soulburn_buff 74434)
	SpellInfo(soulburn_buff duration=30)
Define(soulburn_seed_of_corruption 114790)
	SpellAddTargetDebuff(soulburn_seed_of_corruption soulburn_seed_of_corruption_debuff=1)
Define(soulburn_seed_of_corruption_debuff 114790)
	SpellInfo(soulburn_seed_of_corruption_debuff duration=18 haste=spell tick=3)
Define(soulshatter 29858)
	SpellInfo(soulshatter cd=120)
Define(summon_doomguard 18540)
	SpellInfo(summon_doomguard cd=600)
Define(summon_infernal 1122)
	SpellInfo(summon_infernal cd=600)
Define(touch_of_chaos 103964)
	SpellInfo(touch_of_chaos demonicfury=40 stance=warlock_metamophosis)
Define(unbound_will 108482)
	SpellInfo(unbound_will cd=60)
Define(unbound_will_talent 12)
Define(unstable_affliction 30108)
	SpellAddTargetDebuff(unstable_affliction unstable_affliction_debuff=1)
Define(unstable_affliction_debuff 30108)
	SpellInfo(unstable_affliction_debuff duration=14 haste=spell tick=2)
	SpellInfo(unstable_affliction_debuff addduration=7 glyph=glyph_of_everlasting_affliction)
Define(void_ray 115422)
	SpellInfo(void_ray demonicfury=40 stance=warlock_metamophosis)
Define(wrathguard_wrathstorm 115831)
	SpellInfo(wrathguard_wrathstorm cd=45)
	SpellAddBuff(wrathguard_wrathstorm wrathguard_wrathstorm_buff=1)
Define(wrathguard_wrathstorm_buff 89751)
	SpellInfo(wrathguard_wrathstorm_buff duration=6)

AddFunction SummonPet
{
	if pet.Present(no) Texture(spell_nature_removecurse help=SummonPet)
}

AddFunction ServicePet
{
	if TalentPoints(grimoire_of_service_talent) and Spell(grimoire_of_service) Texture(spell_nature_removecurse help=ServicePet)
}

AddFunction AfflictionMasteryDamageMultiplier asValue=1 { 1 + MasteryEffect() / 100 }
AddFunction AfflictionAgonyTickDamage asValue=1
{
	{ 27 + 0.0255 * Spellpower() } * target.DamageMultiplier(agony_debuff) * AfflictionMasteryDamageMultiplier()
}
AddFunction AfflictionAgonyTickLastDamage asValue=1
{
	{ 27 + 0.0255 * target.DebuffSpellpower(agony_debuff) } * target.DebuffDamageMultiplier(agony_debuff) * { 1 + target.DebuffMasteryEffect(agony_debuff) / 100 }
}
]]

	OvaleScripts:RegisterScript("WARLOCK", name, desc, code, "include")
end
