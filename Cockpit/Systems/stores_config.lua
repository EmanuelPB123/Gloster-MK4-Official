dofile(LockOn_Options.common_script_path.."../../../Database/wsTypes.lua")

------------------------------------------------
----------------  CONSTANTS  -------------------
------------------------------------------------
cbu_mult = 5
dispenser_data =
{
    --use shapename,         bomblet,          bomblet_count
    ["{CBU-1/A}"]           = { bomblet = BLU_4B, bomblet_count = math.floor(509/cbu_mult), number_of_tubes = 19, tubes_per_pulse = 2, variant = "CBU-1/A" },
    ["{CBU-2/A}"]           = { bomblet = BLU_3B, bomblet_count = math.floor(360/cbu_mult), number_of_tubes = 17, tubes_per_pulse = 1, variant = "CBU-2/A" },
    ["{CBU-2B/A}"]          = { bomblet = BLU_3B, bomblet_count = math.floor(409/cbu_mult), number_of_tubes = 19, tubes_per_pulse = 2, variant = "CBU-2B/A" },
    ["{CBU-1/A_TER_2_L}"]   = { bomblet = BLU_4B, bomblet_count = math.floor(509/cbu_mult), number_of_tubes = 19, tubes_per_pulse = 2, variant = "CBU-1/A" },
    ["{CBU-2/A_TER_2_L}"]   = { bomblet = BLU_3B, bomblet_count = math.floor(360/cbu_mult), number_of_tubes = 17, tubes_per_pulse = 1, variant = "CBU-2/A" },
    ["{CBU-2B/A_TER_2_L}"]  = { bomblet = BLU_3B, bomblet_count = math.floor(409/cbu_mult), number_of_tubes = 19, tubes_per_pulse = 2, variant = "CBU-2B/A" },
    ["{CBU-1/A_TER_2_R}"]   = { bomblet = BLU_4B, bomblet_count = math.floor(509/cbu_mult), number_of_tubes = 19, tubes_per_pulse = 2, variant = "CBU-1/A" },
    ["{CBU-2/A_TER_2_R}"]   = { bomblet = BLU_3B, bomblet_count = math.floor(360/cbu_mult), number_of_tubes = 17, tubes_per_pulse = 1, variant = "CBU-2/A" },
    ["{CBU-2B/A_TER_2_R}"]  = { bomblet = BLU_3B, bomblet_count = math.floor(409/cbu_mult), number_of_tubes = 19, tubes_per_pulse = 2, variant = "CBU-2B/A" },
}

--CLSID to loadout name table for kneeboard
loadout_names = {

    --EMPTY--
    ["<CLEAN>"]                                 = "-CLEAN-",
    [""]                                        = "-NO PYLON-",

    --FUEL TANKS--
    ["{DFT-400gal}"]                            = "FUEL TANK - 400 GAL.",
    ["{DFT-400gal_EMPTY}"]                      = "FUEL TANK - 400 GAL. - EMPTY",
    ["{DFT-300gal}"]                            = "FUEL TANK - 300 GAL.",
    ["{DFT-300gal_LR}"]                         = "FUEL TANK - 300 GAL.",
    ["{DFT-300gal_EMPTY}"]                      = "FUEL TANK - 300 GAL. - EMPTY",
    ["{DFT-300gal_LR_EMPTY}"]                   = "FUEL TANK - 300 GAL. - EMPTY",
    ["{DFT-150gal}"]                            = "FUEL TANK - 150 GAL.",
    ["{DFT-150gal_EMPTY}"]                      = "FUEL TANK - 150 GAL. - EMPTY",

    --AIR AIR--
    ["{GAR-8}"]                                 = "MISSILE - AIM-9B",
    ["{AIM-9P-ON-ADAPTER}"]                     = "MISSILE - AIM-9P",
    ["{AIM-9P5-ON-ADAPTER}"]                    = "MISSILE - AIM-9P5",

    --ROCKETS--
    ["{F3EFE0AB-E91A-42D8-9CA2-B63C91ED570A}"]  = "ROCKETS - LAU-10 - ZUNI",
    ["{LAU-10 ZUNI_TER_2_C}"]                   = "ROCKETS - LAU-10 *2 - ZUNI - TER",
    ["{LAU-10 ZUNI_TER_2_L}"]                   = "ROCKETS - LAU-10 *2 - ZUNI - TER",
    ["{LAU-10 ZUNI_TER_2_R}"]                   = "ROCKETS - LAU-10 *2 - ZUNI - TER",
    ["{LAU-10 ZUNI_TER_3_C}"]                   = "ROCKETS - LAU-10 *3 - ZUNI - TER",

    ["{LAU3_FFAR_WP156}"]                       = "ROCKETS - LAU-3 - FFAR WP156 - TER",
    ["{LAU-3 FFAR WP156_TER_2_C}"]              = "ROCKETS - LAU-3 * 2 - FFAR WP156 - TER",
    ["{LAU-3 FFAR WP156_TER_2_L}"]              = "ROCKETS - LAU-3 * 2 - FFAR WP156 - TER",
    ["{LAU-3 FFAR WP156_TER_2_R}"]              = "ROCKETS - LAU-3 * 2 - FFAR WP156 - TER",
    ["{LAU-3 FFAR WP156_TER_3_C}"]              = "ROCKETS - LAU-3 * 3 - FFAR WP156 - TER",

    ["{LAU3_FFAR_MK1HE}"]                       = "ROCKETS - LAU-3 - FFAR MK1 HE",
    ["{LAU-3 FFAR Mk1 HE_TER_2_C}"]             = "ROCKETS - LAU-3 * 2 - FFAR MK1 HE - TER",
    ["{LAU-3 FFAR Mk1 HE_TER_2_L}"]             = "ROCKETS - LAU-3 * 2 - FFAR MK1 HE - TER",
    ["{LAU-3 FFAR Mk1 HE_TER_2_R}"]             = "ROCKETS - LAU-3 * 2 - FFAR MK1 HE - TER",
    ["{LAU-3 FFAR Mk1 HE_TER_3_C}"]             = "ROCKETS - LAU-3 * 3 - FFAR MK1 HE - TER",

    ["{LAU3_FFAR_MK5HEAT}"]                     = "ROCKETS - LAU-3 - FFAR MK5 HEAT",
    ["{LAU-3 FFAR Mk5 HEAT_TER_2_C}"]           = "ROCKETS - LAU-3 * 2 - FFAR MK5 HEAT - TER",
    ["{LAU-3 FFAR Mk5 HEAT_TER_2_L}"]           = "ROCKETS - LAU-3 * 2 - FFAR MK5 HEAT - TER",
    ["{LAU-3 FFAR Mk5 HEAT_TER_2_R}"]           = "ROCKETS - LAU-3 * 2 - FFAR MK5 HEAT - TER",
    ["{LAU-3 FFAR Mk5 HEAT_TER_3_C}"]           = "ROCKETS - LAU-3 * 3 - FFAR MK5 HEAT - TER",

    ["{LAU68_FFAR_WP156}"]                      = "ROCKETS - LAU-68 - FFAR WP156",
    ["{LAU-68 FFAR WP156_TER_2_C}"]             = "ROCKETS - LAU-68 * 2 - FFAR WP156 - TER",
    ["{LAU-68 FFAR WP156_TER_2_L}"]             = "ROCKETS - LAU-68 * 2 - FFAR WP156 - TER",
    ["{LAU-68 FFAR WP156_TER_2_R}"]             = "ROCKETS - LAU-68 * 2 - FFAR WP156 - TER",
    ["{LAU-68 FFAR WP156_TER_3_C}"]             = "ROCKETS - LAU-68 * 3 - FFAR WP156 - TER",

    ["{LAU68_FFAR_MK1HE}"]                      = "ROCKETS - LAU-68 - FFAR MK1 HE",
    ["{LAU-68 FFAR Mk1 HE_TER_2_C}"]            = "ROCKETS - LAU-68 * 2 - FFAR MK1 HE - TER",
    ["{LAU-68 FFAR Mk1 HE_TER_2_L}"]            = "ROCKETS - LAU-68 * 2 - FFAR MK1 HE - TER",
    ["{LAU-68 FFAR Mk1 HE_TER_2_R}"]            = "ROCKETS - LAU-68 * 2 - FFAR MK1 HE - TER",
    ["{LAU-68 FFAR Mk1 HE_TER_3_C}"]            = "ROCKETS - LAU-68 * 3 - FFAR MK1 HE - TER",

    ["{LAU68_FFAR_MK5HEAT}"]                    = "ROCKETS - LAU-68 - FFAR MK5 HEAT",
    ["{LAU-68 FFAR Mk5 HEAT_TER_2_C}"]          = "ROCKETS - LAU-68 * 2 - FFAR MK5 HEAT - TER",
    ["{LAU-68 FFAR Mk5 HEAT_TER_2_L}"]          = "ROCKETS - LAU-68 * 2 - FFAR MK5 HEAT - TER",
    ["{LAU-68 FFAR Mk5 HEAT_TER_2_R}"]          = "ROCKETS - LAU-68 * 2 - FFAR MK5 HEAT - TER",
    ["{LAU-68 FFAR Mk5 HEAT_TER_3_C}"]          = "ROCKETS - LAU-68 * 3 - FFAR MK5 HEAT - TER",

    --MISSILES--
    ["{AGM_45A}"]                               = "MISSILE - AGM-45A SHRIKE ARM",

    --BOMBS--
    ["{AN_M30A1}"]                              = "BOMB - AN-M30A1 - 100 LB. GP HE 57 LB. TNT",
    ["{AN_M57}"]                                = "BOMB - AN-M57A1 - 250 LB. GP HE 129 LB. TNT",
    ["{AN-M64}"]                                = "BOMB - AN-M64 - 500 LB. GP HE 274 LB. COMP.B",
    ["{AN_M65}"]                                = "BOMB - AN-M65A1 - 1000 LB. GP HE 595 LB. COMP.B",
    ["{AN-M66A2}"]                              = "BOMB - AN-M66A2 - 2000 LB. GP HE 1142 LB. COMP.B",
    ["{AN-M81}"]                                = "BOMB - AN-M81 - 260 LB. FRAG. 34.1 LB. COMP.B",
    ["{AN-M88}"]                                = "BOMB - AN-M88 - 216 LB. FRAG. 47 LB. COMP.B",
    ["{00F5DAC4-0466-4122-998F-B1A298E34113}"]  = "BOMB - M117 - 750 LB. GP LD",
    ["{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}"]  = "BOMB - MK-20 ROCKEYE - 490 LB. CBU",
    ["{90321C8E-7ED1-47D4-A160-E074D5ABD902}"]  = "BOMB - MK-81 - 250 LB. GP LD",
    ["{MK-81SE}"]                               = "BOMB - MK-81 SNAKEYE - 250 LB. GP HD",
    ["{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"]  = "BOMB - MK-82 - 500 LB. GP LD",
    ["{Mk82SNAKEYE}"]                           = "BOMB - MK-82 SNAKEYE - 500 LB. GP HD",
    ["{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}"]  = "BOMB - MK-83 - 1000 LB. LD",
    ["{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}"]  = "BOMB - MK-84 - 2000 LB. LD",
    ["{mk77mod0}"]                              = "BOMB - MK-77 MOD0 - 750 LB. PETROLEUM",
    ["{mk77mod1}"]                              = "BOMB - MK-77 MOD1 - 500 LB. PETROLEUM",
    
    --CLUSTER MUNITIONS--
    ["{CBU-1/A}"]                               = "CBU-1/A ANTI-PERS - 26 BLU-4/B PER TUBE",
    ["{CBU-1/A_TER_2_L}"]                       = "CBU-1/A * 2 ANTI-PERS - 26 BLU-4/B PER TUBE - TER",
    ["{CBU-1/A_TER_2_R}"]                       = "CBU-1/A * 2 ANTI-PERS - 26 BLU-4/B PER TUBE - TER",
    ["{CBU-2/A}"]                               = "CBU-2/A - 12 BLU-3/B PER TUBE",
    ["{CBU-2/A_TER_2_L}"]                       = "CBU-2/A * 2 - 12 BLU-3/B PER TUBE - TER",
    ["{CBU-2/A_TER_2_R}"]                       = "CBU-2/A * 2 - 12 BLU-3/B PER TUBE - TER",
    ["{CBU-2B/A}"]                              = "CBU-2B/A - 22 BLU-3/B PER TUBE",
    ["{CBU-2B/A_TER_2_L}"]                      = "CBU-2B/A * 2 - 22 BLU-3/B PER TUBE - TER",
    ["{CBU-2B/A_TER_2_R}"]                      = "CBU-2B/A * 2 - 22 BLU-3/B PER TUBE - TER",

    --BOMB RACKS--
    ["{Mk-20_TER_2_C}"]                         = "BOMBS - MK-20 ROCKEYE - 490 LB. CBU - TER",
    ["{Mk-20_TER_2_L}"]                         = "BOMBS - MK-20 ROCKEYE - 490 LB. CBU - TER",
    ["{Mk-20_TER_2_R}"]                         = "BOMBS - MK-20 ROCKEYE - 490 LB. CBU - TER",
    ["{Mk-20_TER_3_C}"]                         = "BOMBS - MK-20 ROCKEYE - 490 LB. CBU - TER",
    ["{Mk-77 mod 1_TER_2_C}"]                   = "BOMBS - MK-77 MOD 1 - 500 LB. PETROLEUM - TER",
    ["{Mk-81_MER_6_C}"]                         = "BOMBS - MK-81 - 250 LB. GP LD - MER",
    ["{Mk-81_MER_5_L}"]                         = "BOMBS - MK-81 - 250 LB. GP LD - MER",
    ["{Mk-81_MER_5_R}"]                         = "BOMBS - MK-81 - 250 LB. GP LD - MER",
    ["{Mk-81SE_MER_6_C}"]                       = "BOMBS - MK-81 SNAKEYE - 250 LB. GP HD - MER",
    ["{Mk-81SE_MER_5_L}"]                       = "BOMBS - MK-81 SNAKEYE - 250 LB. GP HD - MER",
    ["{Mk-81SE_MER_5_R}"]                       = "BOMBS - MK-81 SNAKEYE - 250 LB. GP HD - MER",
    ["{Mk-82_TER_2_L}"]                         = "BOMBS - MK-82 - 500 LB. GP LD - TER",
    ["{Mk-82_TER_2_R}"]                         = "BOMBS - MK-82 - 500 LB. GP LD - TER",
    ["{Mk-82_TER_3_C}"]                         = "BOMBS - MK-82 - 500 LB. GP LD - TER",
    ["{Mk-82_MER_4_C}"]                         = "BOMBS - MK-82 - 500 LB. GP LD - MER",
    ["{Mk-82_MER_6_C}"]                         = "BOMBS - MK-82 - 500 LB. GP LD - MER",
    ["{Mk-82 Snakeye_TER_2_L}"]                 = "BOMBS - MK-82 SNAKEYE - 500 LB. GP HD - TER",
    ["{Mk-82 Snakeye_TER_2_R}"]                 = "BOMBS - MK-82 SNAKEYE - 500 LB. GP HD - TER",
    ["{Mk-82 Snakeye_TER_3_C}"]                 = "BOMBS - MK-82 SNAKEYE - 500 LB. GP HD - TER",
    ["{Mk-82 Snakeye_MER_4_C}"]                 = "BOMBS - MK-82 SNAKEYE - 500 LB. GP HD - MER",
    ["{Mk-82 Snakeye_MER_6_C}"]                 = "BOMBS - MK-82 SNAKEYE - 500 LB. GP HD - MER",
    ["{Mk-83_TER_3_C}"]                         = "BOMBS - MK-83 - 1000 LB. LD - TER",
    ["{AN-M57_MER_5_L}"]                        = "BOMBS - AN-M57A1 - 250 LB. GP HE 129 LB. TNT - MER",
    ["{AN-M57_MER_5_R}"]                        = "BOMBS - AN-M57A1 - 250 LB. GP HE 129 LB. TNT - MER",
    ["{AN-M57_TER_2_L}"]                        = "BOMBS - AN-M57A1 - 250 LB. GP HE 129 LB. TNT - MER",
    ["{AN-M57_TER_2_R}"]                        = "BOMBS - AN-M57A1 - 250 LB. GP HE 129 LB. TNT - TER",
    ["{AN-M57_TER_3_C}"]                        = "BOMBS - AN-M57A1 - 250 LB. GP HE 129 LB. TNT - TER",
    ["{AN-M57_MER_6_C}"]                        = "BOMBS - AN-M57A1 - 250 LB. GP HE 129 LB. TNT - MER",
    ["{AN-M81_MER_6_C}"]                        = "BOMBS - AN-M81 - 216 LB. FRAG. 34.1 LB. COMP.B - MER",
    ["{AN-M81_MER_5_L}"]                        = "BOMBS - AN-M81 - 260 LB. FRAG. 34.1 LB. COMP.B - MER",
    ["{AN-M81_MER_5_R}"]                        = "BOMBS - AN-M81 - 260 LB. FRAG. 34.1 LB. COMP.B - MER",
    ["{AN-M88_MER_6_C}"]                        = "BOMBS - AN-M88 - 216 LB. FRAG. 47 LB. COMP.B - MER",
    ["{AN-M88_MER_5_L}"]                        = "BOMBS - AN-M88 - 216 LB. FRAG. 47 LB. COMP.B - MER",
    ["{AN-M88_MER_5_R}"]                        = "BOMBS - AN-M88 - 216 LB. FRAG. 47 LB. COMP.B - MER",
    ["{BDU-33_MER_6_C}"]                        = "BOMBS - BDU-33 - 25 LB. PRACTICE ORDNANCE - MER",
    ["{BDU-33_MER_5_L}"]                        = "BOMBS - BDU-33 - 25 LB. PRACTICE ORDNANCE - MER",
    ["{BDU-33_MER_5_R}"]                        = "BOMBS - BDU-33 - 25 LB. PRACTICE ORDNANCE - MER",

    -- GUN PODS--
    ["{Mk4 HIPEG}"]                             = "GUN POD - MK4 MOD 0 HIPEG - 20*110 MM ROUNDS",

    --SPECIAL--
    ["{647C5F26-BDD1-41e6-A371-8DE1E4CC0E94}"]  = "M257 PARACHUTE FLARES",

    --SMOKE PODS--
    ["{A4BCC903-06C8-47bb-9937-A30FEDB4E741}"]  = "SMOKE POD - RED",
    ["{A4BCC903-06C8-47bb-9937-A30FEDB4E746}"]  = "SMOKE POD - ORANGE",
    ["{A4BCC903-06C8-47bb-9937-A30FEDB4E745}"]  = "SMOKE POD - YELLOW",
    ["{A4BCC903-06C8-47bb-9937-A30FEDB4E742}"]  = "SMOKE POD - GREEN",
    ["{A4BCC903-06C8-47bb-9937-A30FEDB4E743}"]  = "SMOKE POD - BLUE",
    ["{A4BCC903-06C8-47bb-9937-A30FEDB4E744}"]  = "SMOKE POD - WHITE",

    --ILLUMINATION POD--
    ["{CAE48299-A294-4bad-8EE6-89EFC5DCDF00}"]  = "SUU-25 - LUU-2 TARGET MARKER FLARES",

}

------------------------------------------------
--------------  END CONSTANTS  -----------------
------------------------------------------------




------------------------------------------------
-----------  AIRCRAFT DEFINITION  --------------
------------------------------------------------
num_stations = 5

------------------------------------------------
---------  END AIRCRAFT DEFINITION  ------------
------------------------------------------------