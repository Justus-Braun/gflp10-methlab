Config = {
    Actions = {
        ["cooking"] = {
            Time = 50000,
            AnimDict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@",
            PlayerAnim = "chemical_pour_short_cooker",
            Postion = vector3(-1146.1376, -1283.8252, -1.1140),
            Offset = vector3(4.0114, 3.406, 0.4079),
            Rotation = vector3(0.0, 0.0, 19.3368 + 180.0),        
            DamageNoMask = true,
            DamageAmount = 1,
            ArmorFirst = false,
            ItemNeeds = nil,
            Distance = 2.0,
            ItemReward = {
                name = "meth_raw",
                amount = 3
            },
            CanCarryItem = true,
            objects = {
                ammonia = {
                    prop = 'bkr_prop_meth_ammonia',
                    anim = 'chemical_pour_short_ammonia'
                },
                clipboard = {
                    prop = 'bkr_prop_fakeid_clipboard_01a',
                    anim = 'chemical_pour_short_clipboard'
                },
                pencil = { 
                    prop = 'bkr_prop_fakeid_penclipboard',
                    anim = 'chemical_pour_short_pencil'
                },
                sacid = {
                    prop = 'bkr_prop_meth_sacid',
                    anim = 'chemical_pour_short_sacid'
                }
            },
            StaticObjects = {}
        },
        ["packing"] = {
            Time = 25000,
            AnimDict = "anim@amb@business@meth@meth_smash_weight_check@",
            PlayerAnim = "break_weigh_v3_char01",
            Postion = vector3(-1142.8081, -1289.4950, -1.6347),
            Offset = vector3(2.8705, -4.0803, 1.0076),
            Rotation = vector3(0.0, 0.0, 286.5742),
            Distance = 2.0,
            ItemNeeds = {
                name = "meth_raw",
                amount = 3
            },
            ItemReward = {
                name = "meth_packed",
                amount = 1
            },
            CanCarryItem = true,
            objects = {
                methbag3 = {
                    prop = "bkr_prop_meth_openbag_02",
                    anim = "break_weigh_v3_methbag01^2"
                },
                methbag4 = {
                    prop = "bkr_prop_meth_openbag_02",
                    anim = "break_weigh_v3_methbag01^3"
                },
                pen = {
                    prop = "bkr_prop_fakeid_penclipboard",
                    anim = "break_weigh_v3_pen"
                },
                scoop = {
                    prop = "bkr_prop_meth_scoop_01a",
                    anim = "break_weigh_v3_scoop"
                }
            },
            StaticObjects = {
                box1 = {
                    prop = "bkr_prop_meth_bigbag_04a",
                    coords = vector3(-1141.6266, -1290.0377, -1.8427),
                    rot = vector3(0, -0.1736482, 0.9848078)
                },
                box2 = {
                    prop = "bkr_prop_meth_bigbag_03a",
                    coords = vector3(-1142.1281, -1288.6642, -1.8224),
                    rot = 30.0
                },
                clipboard = {
                    prop = "bkr_prop_fakeid_clipboard_01a",
                    coords = vector3(-1142.1069, -1289.6508, -1.8498),
                    rot = 275.0
                },
                scale = {
                    prop = "bkr_prop_coke_scale_01",
                    coords = vector3(-1142.0569, -1289.3508, -1.8498),
                    rot = 287.0
                },
            }
        }
    },
    AllowedMasks = {
        ["gasmask"] = 175,
    },
    Locale = 'en',
    Framework = 'esx'
}