return {
  ACTIONS_MAP = {
    ["1"] = {{Key.DIGIT_1}},
    ["2"] = {{Key.DIGIT_2}},
    ["3"] = {{Key.DIGIT_3}},
    ["4"] = {{Key.DIGIT_4}},
    ["5"] = {{Key.DIGIT_5}},
    ["6"] = {{Key.DIGIT_6}},
    ["7"] = {{Key.DIGIT_7}},
    ["8"] = {{Key.DIGIT_8}},
    ["9"] = {{Key.DIGIT_9}},
    ["0"] = {{Key.DIGIT_0}},
    ["-"] = {{Key.MINUS}},
    ["^"] = {{Key.EQUAL}},
    ["\\|"] = {{Key.YEN}},

    ["q"] = {{Key.Q}},
    ["w"] = {{Key.W}},
    ["e"] = {{Key.E}},
    ["r"] = {{Key.R}},
    ["t"] = {{Key.T}},
    ["y"] = {{Key.Y}},
    ["u"] = {{Key.U}},
    ["i"] = {{Key.I}},
    ["o"] = {{Key.O}},
    ["p"] = {{Key.P}},
    ["@"] = {{Key.LEFTBRACE}},
    ["["] = {{Key.RIGHTBRACE}},

    ["a"] = {{Key.A}},
    ["s"] = {{Key.S}},
    ["d"] = {{Key.D}},
    ["f"] = {{Key.F}},
    ["g"] = {{Key.G}},
    ["h"] = {{Key.H}},
    ["j"] = {{Key.J}},
    ["k"] = {{Key.K}},
    ["l"] = {{Key.L}},
    [";"] = {{Key.SEMICOLON}},
    [":"] = {{Key.APOSTROPHE}},
    ["]"] = {{Key.BACKSLASH}},

    ["z"] = {{Key.Z}},
    ["x"] = {{Key.X}},
    ["c"] = {{Key.C}},
    ["v"] = {{Key.V}},
    ["b"] = {{Key.B}},
    ["n"] = {{Key.N}},
    ["m"] = {{Key.M}},
    [","] = {{Key.COMMA}},
    ["."] = {{Key.DOT}},
    ["/"] = {{Key.SLASH}},
    ["\\_"] = {{Key.RO}},

    ["!"] = {{Key.DIGIT_1, Mod.SHIFT}},
    ["\""] = {{Key.DIGIT_2, Mod.SHIFT}},
    ["#"] = {{Key.DIGIT_3, Mod.SHIFT}},
    ["$"] = {{Key.DIGIT_4, Mod.SHIFT}},
    ["%"] = {{Key.DIGIT_5, Mod.SHIFT}},
    ["&"] = {{Key.DIGIT_6, Mod.SHIFT}},
    ["'"] = {{Key.DIGIT_7, Mod.SHIFT}},
    ["("] = {{Key.DIGIT_8, Mod.SHIFT}},
    [")"] = {{Key.DIGIT_9, Mod.SHIFT}},
    ["="] = {{Key.MINUS, Mod.SHIFT}},
    ["~"] = {{Key.EQUAL, Mod.SHIFT}},
    ["|"] = {{Key.YEN, Mod.SHIFT}},

    ["Q"] = {{Key.Q, Mod.SHIFT}},
    ["W"] = {{Key.W, Mod.SHIFT}},
    ["E"] = {{Key.E, Mod.SHIFT}},
    ["R"] = {{Key.R, Mod.SHIFT}},
    ["T"] = {{Key.T, Mod.SHIFT}},
    ["Y"] = {{Key.Y, Mod.SHIFT}},
    ["U"] = {{Key.U, Mod.SHIFT}},
    ["I"] = {{Key.I, Mod.SHIFT}},
    ["O"] = {{Key.O, Mod.SHIFT}},
    ["P"] = {{Key.P, Mod.SHIFT}},
    ["`"] = {{Key.LEFTBRACE, Mod.SHIFT}},
    ["{"] = {{Key.RIGHTBRACE, Mod.SHIFT}},

    ["A"] = {{Key.A, Mod.SHIFT}},
    ["S"] = {{Key.S, Mod.SHIFT}},
    ["D"] = {{Key.D, Mod.SHIFT}},
    ["F"] = {{Key.F, Mod.SHIFT}},
    ["G"] = {{Key.G, Mod.SHIFT}},
    ["H"] = {{Key.H, Mod.SHIFT}},
    ["J"] = {{Key.J, Mod.SHIFT}},
    ["K"] = {{Key.K, Mod.SHIFT}},
    ["L"] = {{Key.L, Mod.SHIFT}},
    ["+"] = {{Key.SEMICOLON, Mod.SHIFT}},
    ["*"] = {{Key.APOSTROPHE, Mod.SHIFT}},
    ["}"] = {{Key.BACKSLASH, Mod.SHIFT}},

    ["Z"] = {{Key.Z, Mod.SHIFT}},
    ["X"] = {{Key.X, Mod.SHIFT}},
    ["C"] = {{Key.C, Mod.SHIFT}},
    ["V"] = {{Key.V, Mod.SHIFT}},
    ["B"] = {{Key.B, Mod.SHIFT}},
    ["N"] = {{Key.N, Mod.SHIFT}},
    ["M"] = {{Key.M, Mod.SHIFT}},
    ["<"] = {{Key.COMMA, Mod.SHIFT}},
    [">"] = {{Key.DOT, Mod.SHIFT}},
    ["?"] = {{Key.SLASH, Mod.SHIFT}},
    ["_"] = {{Key.RO, Mod.SHIFT}},

    ["\\"] = {{Key.YEN}},
    ["Shift+0"] = {{Key.DIGIT_0, Mod.SHIFT}},

    ["Escape"] = {{Key.ESC}},
    ["F1"] = {{Key.F1}},
    ["F2"] = {{Key.F2}},
    ["F3"] = {{Key.F3}},
    ["F4"] = {{Key.F4}},
    ["F5"] = {{Key.F5}},
    ["F6"] = {{Key.F6}},
    ["F7"] = {{Key.F7}},
    ["F8"] = {{Key.F8}},
    ["F9"] = {{Key.F9}},
    ["F10"] = {{Key.F10}},
    ["F11"] = {{Key.F11}},
    ["F12"] = {{Key.F12}},
    ["F13"] = {{Key.F13}},
    ["F14"] = {{Key.F14}},
    ["F15"] = {{Key.F15}},
    ["F16"] = {{Key.F16}},
    ["F17"] = {{Key.F17}},
    ["F18"] = {{Key.F18}},
    ["F19"] = {{Key.F19}},
    ["F20"] = {{Key.F20}},
    ["F21"] = {{Key.F21}},
    ["F22"] = {{Key.F22}},
    ["F23"] = {{Key.F23}},
    ["F24"] = {{Key.F24}},

    ["HankakuZenkaku"] = {{Key.GRAVE}},
    ["Backspace"] = {{Key.BACKSPACE}},
    ["Tab"] = {{Key.TAB}},
    ["Enter"] = {{Key.ENTER}},
    ["CapsLock"] = {{Key.CAPSLOCK}},
    ["NonConvert"] = {{Key.MUHENKAN}},
    ["Space"] = {{Key.SPACE}},
    ["Convert"] = {{Key.HENKAN}},
    ["KatakanaHiragana"] = {{Key.KATAKANAHIRAGANA}},
    ["ContextMenu"] = {{Key.COMPOSE}},

    ["PrintScreen"] = {{Key.SYSRQ}},
    ["ScrollLock"] = {{Key.SCROLLLOCK}},
    ["Pause"] = {{Key.PAUSE}},
    ["Insert"] = {{Key.INSERT}},
    ["Home"] = {{Key.HOME}},
    ["PageUp"] = {{Key.PAGEUP}},
    ["Delete"] = {{Key.DELETE}},
    ["End"] = {{Key.END}},
    ["PageDown"] = {{Key.PAGEDOWN}},

    ["Up"] = {{Key.UP}},
    ["Left"] = {{Key.LEFT}},
    ["Down"] = {{Key.DOWN}},
    ["Right"] = {{Key.RIGHT}},

    ["NumLock"] = {{Key.NUMLOCK}},
    ["Numpad0"] = {{Key.KP0}},
    ["Numpad1"] = {{Key.KP1}},
    ["Numpad2"] = {{Key.KP2}},
    ["Numpad3"] = {{Key.KP3}},
    ["Numpad4"] = {{Key.KP4}},
    ["Numpad5"] = {{Key.KP5}},
    ["Numpad6"] = {{Key.KP6}},
    ["Numpad7"] = {{Key.KP7}},
    ["Numpad8"] = {{Key.KP8}},
    ["Numpad9"] = {{Key.KP9}},
    ["NumpadDecimal"] = {{Key.KPDOT}},
    ["NumpadAdd"] = {{Key.KPPLUS}},
    ["NumpadSubtract"] = {{Key.KPMINUS}},
    ["NumpadMultiply"] = {{Key.KPASTERRISK}},
    ["NumpadDivide"] = {{Key.KPSLASH}},
    ["NumpadEnter"] = {{Key.KPENTER}},

    ["ShiftLeft"] = {{0, Mod.SHIFT_LEFT}},
    ["ControlLeft"] = {{0, Mod.CONTROL_LEFT}},
    ["AltLeft"] = {{0, Mod.ALT_LEFT}},
    ["OSLeft"] = {{0, Key.OS_LEFT}},
    ["ShiftRight"] = {{0, Mod.SHIFT_RIGHT}},
    ["ControlRight"] = {{0, Mod.CONTROL_RIGHT}},
    ["AltRight"] = {{0, Mod.ALT_RIGHT}},
    ["OSRight"] = {{0, Mod.OS_RIGHT}},

    ["全角/半角"] = {{Key.GRAVE}},
    ["無変換"] = {{Key.MUHENKAN}},
    ["変換"] = {{Key.HENKAN}},
    ["カタカナ/ひらがな"] = {{Key.KATAKAKAHIRAGANA}},

    -- ひらがな
    ["あ"] = {{Key.A}},
    ["い"] = {{Key.I}},
    ["う"] = {{Key.U}},
    ["え"] = {{Key.E}},
    ["お"] = {{Key.O}},
    ["か"] = {{Key.K}, {Key.A}},
    ["き"] = {{Key.K}, {Key.I}},
    ["く"] = {{Key.K}, {Key.U}},
    ["け"] = {{Key.K}, {Key.E}},
    ["こ"] = {{Key.K}, {Key.O}},
    ["さ"] = {{Key.S}, {Key.A}},
    ["し"] = {{Key.S}, {Key.I}},
    ["す"] = {{Key.S}, {Key.U}},
    ["せ"] = {{Key.S}, {Key.E}},
    ["そ"] = {{Key.S}, {Key.O}},
    ["た"] = {{Key.T}, {Key.A}},
    ["ち"] = {{Key.T}, {Key.I}},
    ["つ"] = {{Key.T}, {Key.U}},
    ["て"] = {{Key.T}, {Key.E}},
    ["と"] = {{Key.T}, {Key.O}},
    ["な"] = {{Key.N}, {Key.A}},
    ["に"] = {{Key.N}, {Key.I}},
    ["ぬ"] = {{Key.N}, {Key.U}},
    ["ね"] = {{Key.N}, {Key.E}},
    ["の"] = {{Key.N}, {Key.O}},
    ["は"] = {{Key.H}, {Key.A}},
    ["ひ"] = {{Key.H}, {Key.I}},
    ["ふ"] = {{Key.H}, {Key.U}},
    ["へ"] = {{Key.H}, {Key.E}},
    ["ほ"] = {{Key.H}, {Key.O}},
    ["ま"] = {{Key.M}, {Key.A}},
    ["み"] = {{Key.M}, {Key.I}},
    ["む"] = {{Key.M}, {Key.U}},
    ["め"] = {{Key.M}, {Key.E}},
    ["も"] = {{Key.M}, {Key.O}},
    ["や"] = {{Key.Y}, {Key.A}},
    ["ゆ"] = {{Key.Y}, {Key.U}},
    ["よ"] = {{Key.Y}, {Key.O}},
    ["ら"] = {{Key.R}, {Key.A}},
    ["り"] = {{Key.R}, {Key.I}},
    ["る"] = {{Key.R}, {Key.U}},
    ["れ"] = {{Key.R}, {Key.E}},
    ["ろ"] = {{Key.R}, {Key.O}},
    ["わ"] = {{Key.W}, {Key.A}},
    ["ゐ"] = {{Key.W}, {Key.Y}, {Key.I}},
    ["ゑ"] = {{Key.W}, {Key.Y}, {Key.E}},
    ["を"] = {{Key.W}, {Key.O}},
    ["ん"] = {{Key.N}},
    ["が"] = {{Key.G}, {Key.A}},
    ["ぎ"] = {{Key.G}, {Key.I}},
    ["ぐ"] = {{Key.G}, {Key.U}},
    ["げ"] = {{Key.G}, {Key.E}},
    ["ご"] = {{Key.G}, {Key.O}},
    ["ざ"] = {{Key.Z}, {Key.A}},
    ["じ"] = {{Key.Z}, {Key.I}},
    ["ず"] = {{Key.Z}, {Key.U}},
    ["ぜ"] = {{Key.Z}, {Key.E}},
    ["ぞ"] = {{Key.Z}, {Key.O}},
    ["だ"] = {{Key.D}, {Key.A}},
    ["ぢ"] = {{Key.D}, {Key.I}},
    ["づ"] = {{Key.D}, {Key.U}},
    ["で"] = {{Key.D}, {Key.E}},
    ["ど"] = {{Key.D}, {Key.O}},
    ["ば"] = {{Key.B}, {Key.A}},
    ["び"] = {{Key.B}, {Key.I}},
    ["ぶ"] = {{Key.B}, {Key.U}},
    ["べ"] = {{Key.B}, {Key.E}},
    ["ぼ"] = {{Key.B}, {Key.O}},
    ["ぱ"] = {{Key.P}, {Key.A}},
    ["ぴ"] = {{Key.P}, {Key.I}},
    ["ぷ"] = {{Key.P}, {Key.U}},
    ["ぺ"] = {{Key.P}, {Key.E}},
    ["ぽ"] = {{Key.P}, {Key.O}},
    ["きゃ"] = {{Key.K}, {Key.Y}, {Key.A}},
    ["きゅ"] = {{Key.K}, {Key.Y}, {Key.U}},
    ["きょ"] = {{Key.K}, {Key.Y}, {Key.O}},
    ["しゃ"] = {{Key.S}, {Key.Y}, {Key.A}},
    ["しゅ"] = {{Key.S}, {Key.Y}, {Key.U}},
    ["しょ"] = {{Key.S}, {Key.Y}, {Key.O}},
    ["ちゃ"] = {{Key.T}, {Key.Y}, {Key.A}},
    ["ちゅ"] = {{Key.T}, {Key.Y}, {Key.U}},
    ["ちょ"] = {{Key.T}, {Key.Y}, {Key.O}},
    ["にゃ"] = {{Key.N}, {Key.Y}, {Key.A}},
    ["にゅ"] = {{Key.N}, {Key.Y}, {Key.U}},
    ["にょ"] = {{Key.N}, {Key.Y}, {Key.O}},
    ["ひゃ"] = {{Key.H}, {Key.Y}, {Key.A}},
    ["ひゅ"] = {{Key.H}, {Key.Y}, {Key.U}},
    ["ひょ"] = {{Key.H}, {Key.Y}, {Key.O}},
    ["みゃ"] = {{Key.M}, {Key.Y}, {Key.A}},
    ["みゅ"] = {{Key.M}, {Key.Y}, {Key.U}},
    ["みょ"] = {{Key.M}, {Key.Y}, {Key.O}},
    ["りゃ"] = {{Key.R}, {Key.Y}, {Key.A}},
    ["りゅ"] = {{Key.R}, {Key.Y}, {Key.U}},
    ["りょ"] = {{Key.R}, {Key.Y}, {Key.O}},
    ["ぎゃ"] = {{Key.G}, {Key.Y}, {Key.A}},
    ["ぎゅ"] = {{Key.G}, {Key.Y}, {Key.U}},
    ["ぎょ"] = {{Key.G}, {Key.Y}, {Key.O}},
    ["じゃ"] = {{Key.J}, {Key.A}},
    ["じゅ"] = {{Key.J}, {Key.U}},
    ["じょ"] = {{Key.J}, {Key.O}},
    ["ぢゃ"] = {{Key.D}, {Key.Y}, {Key.A}},
    ["ぢゅ"] = {{Key.D}, {Key.Y}, {Key.U}},
    ["ぢょ"] = {{Key.D}, {Key.Y}, {Key.O}},
    ["びゃ"] = {{Key.B}, {Key.Y}, {Key.A}},
    ["びゅ"] = {{Key.B}, {Key.Y}, {Key.U}},
    ["びょ"] = {{Key.B}, {Key.Y}, {Key.O}},
    ["ぴゃ"] = {{Key.P}, {Key.Y}, {Key.A}},
    ["ぴゅ"] = {{Key.P}, {Key.Y}, {Key.U}},
    ["ぴょ"] = {{Key.P}, {Key.Y}, {Key.O}},
    ["しぇ"] = {{Key.S}, {Key.Y}, {Key.E}},
    ["ちぇ"] = {{Key.T}, {Key.Y}, {Key.E}},
    ["じぇ"] = {{Key.J}, {Key.E}},
    ["ぢぇ"] = {{Key.D}, {Key.Y}, {Key.E}},
    ["つぁ"] = {{Key.T}, {Key.S}, {Key.A}},
    ["つぇ"] = {{Key.T}, {Key.S}, {Key.E}},
    ["つぉ"] = {{Key.T}, {Key.S}, {Key.O}},
    ["てぃ"] = {{Key.T}, {Key.H}, {Key.I}},
    ["でぃ"] = {{Key.D}, {Key.H}, {Key.I}},
    ["でゅ"] = {{Key.D}, {Key.H}, {Key.U}},
    ["ふぁ"] = {{Key.F}, {Key.A}},
    ["ふぃ"] = {{Key.F}, {Key.I}},
    ["ふぇ"] = {{Key.F}, {Key.E}},
    ["ふぉ"] = {{Key.F}, {Key.O}},
    ["ぁ"] = {{Key.X}, {Key.A}},
    ["ぃ"] = {{Key.X}, {Key.I}},
    ["ぅ"] = {{Key.X}, {Key.U}},
    ["ぇ"] = {{Key.X}, {Key.E}},
    ["ぉ"] = {{Key.X}, {Key.O}},
    ["ヵ"] = {{Key.X}, {Key.K}, {Key.A}},
    ["ヶ"] = {{Key.X}, {Key.K}, {Key.E}},
    ["っ"] = {{Key.X}, {Key.T}, {Key.U}},
    ["ゃ"] = {{Key.X}, {Key.K}, {Key.A}},
    ["ゅ"] = {{Key.X}, {Key.K}, {Key.U}},
    ["ょ"] = {{Key.X}, {Key.K}, {Key.O}},
    ["ゎ"] = {{Key.X}, {Key.W}, {Key.A}},
    ["ー"] = {{Key.OEM_MINUS}},
    ["いぇ"] = {{Key.Y}, {Key.E}},
    ["うぃ"] = {{Key.W}, {Key.I}},
    ["うぇ"] = {{Key.W}, {Key.E}},
    ["うぉ"] = {{Key.W}, {Key.H}, {Key.O}},
    ["くぁ"] = {{Key.Q}, {Key.A}},
    ["くぃ"] = {{Key.Q}, {Key.I}},
    ["くぇ"] = {{Key.Q}, {Key.E}},
    ["くぉ"] = {{Key.Q}, {Key.O}},
    ["つぃ"] = {{Key.T}, {Key.S}, {Key.I}},
    ["てゅ"] = {{Key.T}, {Key.H}, {Key.U}},
    ["とぅ"] = {{Key.T}, {Key.W}, {Key.U}},
    ["ふゅ"] = {{Key.F}, {Key.Y}, {Key.U}},
    ["ヴぁ"] = {{Key.V}, {Key.A}},
    ["ヴぃ"] = {{Key.V}, {Key.I}},
    ["ヴ"] = {{Key.V}, {Key.U}},
    ["ヴぇ"] = {{Key.V}, {Key.E}},
    ["ヴぉ"] = {{Key.V}, {Key.O}},
    ["ヴゅ"] = {{Key.V}, {Key.Y}, {Key.U}},
    ["ぐぁ"] = {{Key.G}, {Key.W}, {Key.A}},
    ["どぅ"] = {{Key.D}, {Key.W}, {Key.U}},
  }
}
