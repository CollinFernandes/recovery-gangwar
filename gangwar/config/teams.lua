Teams = {
    ['bloods'] = {
        name = 'bloods',
        label = 'Bloods',
        icon = 'images/factions/bloods.png',
        colors = {
            blip = 1,
            hex = {
                firstcolor = '#FF0000',
                secondcolor = '#2B0000'
            },
            rgb = {
                r = 255,
                g = 0,
                b = 0
            }
        },
        players = {
            max = 30,
            current = 0,
        },
        defaultClothes = {
            { -- T Shirt
                componentId = 8,
                drawableId = 15,
                textureId = 0,

            },
            { -- Torso
                componentId = 11,
                drawableId = 305,
                textureId = 0,

            },
            { -- Hose
                componentId = 4,
                drawableId = 5,
                textureId = 5,

            },
            { -- Schuhe
                componentId = 6,
                drawableId = 34,
                textureId = 0,

            },
            { -- Mask
                componentId = 1,
                drawableId = 118,
                textureId = 9,

            },
            { -- Weste
                componentId = 9,
                drawableId = 16,
                textureId = 2,

            },
        },
        positions = {
            spawn = vector3(-64.15639, -1449.646, 32.52497),
            clothing = vector3(-61.13043, -1450.227, 32.12366),
            garage = {
                pos = vector3(-59.41166, -1460.058, 31.97334),
                spawns = {
                    vector4(-57.5259, -1465.733, 32.15617, 108.8589)
                }
            },
        },
        clothes = {
            ['mask'] = {
                {
                    label = 'T-Shirt Maske',
                    drawable = 118,
                    texture = 9,
                },
                {
                    label = 'Rote Maske',
                    drawable = 111,
                    texture = 5,
                }
            },
            ['pants'] = {
                {
                    label = 'Jogger',
                    drawable = 5,
                    texture = 5
                },
                {
                    label = 'Karro Shorts',
                    drawable = 16,
                    texture = 1
                },
                {
                    label = 'Bademantel',
                    drawable = 56,
                    texture = 3
                },
                {
                    label = 'Versace Bademantel',
                    drawable = 119,
                    texture = 1
                },
                {
                    label = 'Herzen Unterhose',
                    drawable = 61,
                    texture = 6
                },
            },
            ['shirt'] = {
                {
                    label = 'Weisser Pullover',
                    drawable = 305,
                    texture = 0
                },
                {
                    label = 'Schwarzer Pullover',
                    drawable = 305,
                    texture = 1
                },
                {
                    label = 'Schwarzer Rollkrage',
                    drawable = 111,
                    texture = 3
                },
            },
            ['shoes'] = {
                {
                    label = 'Weisse Sneaker',
                    drawable = 7,
                    texture = 0
                },
                {
                    label = 'Keine Schuhe',
                    drawable = 34,
                    texture = 0
                },
                {
                    label = 'Sandalen',
                    drawable = 6,
                    texture = 0
                },
                {
                    label = 'Schwarze Crocs',
                    drawable = 112,
                    texture = 0
                },
                {
                    label = 'Weisse Crocs',
                    drawable = 112,
                    texture = 3
                },
                {
                    label = 'Rote Crocs',
                    drawable = 112,
                    texture = 8
                },
                {
                    label = 'Schwarze MSCHF',
                    drawable = 118,
                    texture = 0
                },
            },
            ['hat'] = {
                {
                    label = 'Kopfhörer',
                    drawable = 15,
                    texture = 6
                },
                {
                    label = 'Hut',
                    drawable = 29,
                    texture = 2
                },

                {
                    label = 'Durag',
                    drawable = 83,
                    texture = 0
                },
            },
            ['glasses'] = {
                {
                    label = 'Weiße Sonnenbrille',
                    drawable = 16,
                    texture = 5
                },
                {
                    label = 'Fliegerbrille',
                    drawable = 24,
                    texture = 0
                },
                {
                    label = 'Schwarz/Graue Ski Brille',
                    drawable = 25,
                    texture = 4
                },
                {
                    label = 'Weiße Brille',
                    drawable = 29,
                    texture = 2
                },
            },
            ['earrings'] = {
                {
                    label = 'Würfel',
                    drawable = 39,
                    texture = 5
                },
            },
            ['chain'] = {
                {
                    label = 'Silberkette',
                    drawable = 17,
                    texture = 0
                },
                {
                    label = 'Goldkette',
                    drawable = 17,
                    texture = 1
                },
                {
                    label = 'Kopfhörer',
                    drawable = 114,
                    texture = 0
                },
                {
                    label = 'Felgenkette',
                    drawable = 120,
                    texture = 0
                },
            },
        }
    },
    ['vagos'] = {
        name = 'vagos',
        label = 'Vagos',
        icon = 'images/factions/vagos.png',
        colors = {
            blip = 5,
            hex = {
                firstcolor = '#FFF500',
                secondcolor = '#000000'
            },
            rgb = {
                r = 255,
                g = 255,
                b = 51
            },
        },
        players = {
            max = 25,
            current = 0,
        },
        defaultClothes = {
            { -- T Shirt
                componentId = 8,
                drawableId = 15,
                textureId = 0,

            },
            { -- Torso
                componentId = 11,
                drawableId = 96,
                textureId = 0,

            },
            { -- Hose
                componentId = 4,
                drawableId = 16,
                textureId = 2,

            },
            { -- Schuhe
                componentId = 6,
                drawableId = 34,
                textureId = 0,

            },
            { -- Mask
                componentId = 1,
                drawableId = 0,
                textureId = 0,

            },
            { -- Weste
                componentId = 9,
                drawableId = 16,
                textureId = 2,

            },
        },
        positions = {
            spawn = vector3(-1128.811, -1605.771, 4.398428),
            clothing = vector3(-1119.984, -1624.447, 4.398428),
            garage = {
                pos = vector3(-1121.494, -1614.488, 5.398431),
                spawns = {
                    vector4(-1119.959, -1602.771, 4.398426, 32.65443)
                }
            },
        },
        clothes = {
            ['mask'] = {
                {
                    label = 'Bandana Maske',
                    drawable = 16,
                    texture = 2
                },
                {
                    label = 'Clown Maske',
                    drawable = 95,
                    texture = 0
                },
                {
                    label = 'Sturmhaube',
                    drawable = 57,
                    texture = 0
                },
            },
            ['pants'] = {
                {
                    label = 'Gelbe Shorts',
                    drawable = 16,
                    texture = 2
                },
                {
                    label = 'Gelber Jogger',
                    drawable = 16,
                    texture = 8
                },
                {
                    label = 'Gelbe Unterhose',
                    drawable = 18,
                    texture = 0
                },
                {
                    label = 'Leoparden Unterhose',
                    drawable = 18,
                    texture = 10
                },
                {
                    label = 'Bademantel',
                    drawable = 119,
                    texture = 3
                },
            },
            ['shirt'] = {
                {
                    label = 'Blauer Bravo Pulli',
                    drawable = 96,
                    texture = 0
                },
                {
                    label = 'Schwarzer Rollkragen',
                    drawable = 111,
                    texture = 3
                },
                {
                    label = 'Roter Bravo Pulli',
                    drawable = 134,
                    texture = 1
                },
                {
                    label = 'Weisses T-Shirt',
                    drawable = 273,
                    texture = 0
                },
                {
                    label = 'Schwarzer Kapuzenpullover',
                    drawable = 134,
                    texture = 0
                },
                {
                    label = 'Unterhemd',
                    drawable = 237,
                    texture = 0
                },
            },
            ['shoes'] = {
                {
                    label = 'Weisse Sneaker',
                    drawable = 7,
                    texture = 0
                },
                {
                    label = 'Keine Schuhe',
                    drawable = 34,
                    texture = 0
                },
                {
                    label = 'Sandalen',
                    drawable = 6,
                    texture = 0
                },
                {
                    label = 'Yacht Schuhe',
                    drawable = 92,
                    texture = 4
                },
                {
                    label = 'Yacht Schuhe mit Muster',
                    drawable = 95,
                    texture = 0
                },
                {
                    label = 'Schwarze Crocs',
                    drawable = 112,
                    texture = 0
                },
                {
                    label = 'Weisse Crocs',
                    drawable = 112,
                    texture = 3
                },
                {
                    label = 'Gelbe Crocs',
                    drawable = 112,
                    texture = 10
                },
                {
                    label = 'Schwarze MSCHF',
                    drawable = 118,
                    texture = 0
                },
            },
            ['hat'] = {
                {
                    label = 'Kopfhörer',
                    drawable = 15,
                    texture = 6
                },
                {
                    label = 'Hut',
                    drawable = 29,
                    texture = 2
                },

                {
                    label = 'Durag',
                    drawable = 83,
                    texture = 0
                },
            },
            ['glasses'] = {
                {
                    label = 'Weiße Sonnenbrille',
                    drawable = 16,
                    texture = 5
                },
                {
                    label = 'Fliegerbrille',
                    drawable = 24,
                    texture = 0
                },
                {
                    label = 'Schwarz/Graue Ski Brille',
                    drawable = 25,
                    texture = 4
                },
                {
                    label = 'Weiße Brille',
                    drawable = 29,
                    texture = 2
                },
            },
            ['earrings'] = {
                {
                    label = 'Würfel',
                    drawable = 39,
                    texture = 5
                },
            },
            ['chain'] = {
                {
                    label = 'Silberkette',
                    drawable = 17,
                    texture = 0
                },
                {
                    label = 'Goldkette',
                    drawable = 17,
                    texture = 1
                },
                {
                    label = 'Kopfhörer',
                    drawable = 114,
                    texture = 0
                },
                {
                    label = 'Felgenkette',
                    drawable = 120,
                    texture = 0
                },
            },
        }
    },
}
