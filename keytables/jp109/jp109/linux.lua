return {
  KEY_MAP = {
    ["1!"] = Key.DIGIT_1,
    ["2\""] = Key.DIGIT_2,
    ["3#"] = Key.DIGIT_3,
    ["4$"] = Key.DIGIT_4,
    ["5%"] = Key.DIGIT_5,
    ["6&"] = Key.DIGIT_6,
    ["7'"] = Key.DIGIT_7,
    ["8("] = Key.DIGIT_8,
    ["9)"] = Key.DIGIT_9,
    ["0"] = Key.DIGIT_0,
    ["-="] = Key.MINUS,
    ["^~"] = Key.EQUAL,
    ["\\|"] = Key.YEN,

    ["Q"] = Key.Q,
    ["W"] = Key.W,
    ["E"] = Key.E,
    ["R"] = Key.R,
    ["T"] = Key.T,
    ["Y"] = Key.Y,
    ["U"] = Key.U,
    ["I"] = Key.I,
    ["O"] = Key.O,
    ["P"] = Key.P,
    ["@`"] = Key.LEFTBRACE,
    ["[{"] = Key.RIGHTBRACE,

    ["A"] = Key.A,
    ["S"] = Key.S,
    ["D"] = Key.D,
    ["F"] = Key.F,
    ["G"] = Key.G,
    ["H"] = Key.H,
    ["J"] = Key.J,
    ["K"] = Key.K,
    ["L"] = Key.L,
    [";+"] = Key.SEMICOLON,
    [":*"] = Key.APOSTROPHE,
    ["]}"] = Key.BACKSLASH,

    ["Z"] = Key.Z,
    ["X"] = Key.X,
    ["C"] = Key.C,
    ["V"] = Key.V,
    ["B"] = Key.B,
    ["N"] = Key.N,
    ["M"] = Key.M,
    [",<"] = Key.COMMA,
    [".>"] = Key.DOT,
    ["/?"] = Key.SLASH,
    ["\\_"] = Key.RO,

    ["Escape"] = Key.ESC,
    ["F1"] = Key.F1,
    ["F2"] = Key.F2,
    ["F3"] = Key.F3,
    ["F4"] = Key.F4,
    ["F5"] = Key.F5,
    ["F6"] = Key.F6,
    ["F7"] = Key.F7,
    ["F8"] = Key.F8,
    ["F9"] = Key.F9,
    ["F10"] = Key.F10,
    ["F11"] = Key.F11,
    ["F12"] = Key.F12,
    ["F13"] = Key.F13,
    ["F14"] = Key.F14,
    ["F15"] = Key.F15,
    ["F16"] = Key.F16,
    ["F17"] = Key.F17,
    ["F18"] = Key.F18,
    ["F19"] = Key.F19,
    ["F20"] = Key.F20,
    ["F21"] = Key.F21,
    ["F22"] = Key.F22,
    ["F23"] = Key.F23,
    ["F24"] = Key.F24,

    ["HankakuZenkaku"] = Key.GRAVE,
    ["Backspace"] = Key.BACKSPACE,
    ["Tab"] = Key.TAB,
    ["Enter"] = Key.ENTER,
    ["CapsLock"] = Key.CAPSLOCK,
    ["NonConvert"] = Key.MUHENKAN,
    ["Space"] = Key.SPACE,
    ["Convert"] = Key.HENKAN,
    ["KatakanaHiragana"] = Key.KATAKANAHIRAGANA,
    ["ContextMenu"] = Key.COMPOSE,

    ["PrintScreen"] = Key.SYSRQ,
    ["ScrollLock"] = Key.SCROLLLOCK,
    ["Pause"] = Key.PAUSE,
    ["Insert"] = Key.INSERT,
    ["Home"] = Key.HOME,
    ["PageUp"] = Key.PAGEUP,
    ["Delete"] = Key.DELETE,
    ["End"] = Key.END,
    ["PageDown"] = Key.PAGEDOWN,
    ["Up"] = Key.UP,
    ["Down"] = Key.DOWN,
    ["Left"] = Key.LEFT,
    ["Right"] = Key.RIGHT,

    ["NumLock"] = Key.NUMLOCK,
    ["Numpad0"] = Key.KP0,
    ["Numpad1"] = Key.KP1,
    ["Numpad2"] = Key.KP2,
    ["Numpad3"] = Key.KP3,
    ["Numpad4"] = Key.KP4,
    ["Numpad5"] = Key.KP5,
    ["Numpad6"] = Key.KP6,
    ["Numpad7"] = Key.KP7,
    ["Numpad8"] = Key.KP8,
    ["Numpad9"] = Key.KP9,
    ["NumpadDecimal"] = Key.KPDOT,
    ["NumpadAdd"] = Key.KPPLUS,
    ["NumpadSubtract"] = Key.KPMINUS,
    ["NumpadMultiply"] = Key.KPASTERISK,
    ["NumpadDivide"] = Key.KPSLASH,
    ["NumpadEnter"] = Key.KPENTER,

    ["ShiftLeft"] = Key.LEFTSHIFT,
    ["ControlLeft"] = Key.LEFTCTRL,
    ["AltLeft"] = Key.LEFTALT,
    ["OSLeft"] = Key.LEFTMETA,
    ["ShiftRight"] = Key.RIGHTSHIFT,
    ["ControlRight"] = Key.RIGHTCTRL,
    ["AltRight"] = Key.RIGHTALT,
    ["OSRight"] = Key.RIGHTMETA,

    ["半角/全角"] = Key.GRAVE,
    ["無変換"] = Key.MUHENKAN,
    ["変換"] = Key.HENKAN,
    ["カタカナ/ひらがな"] = Key.KATAKANAHIRAGANA,
  },
  ALPHANUMERIC_KEY_NAMES = {
    "1!", "2\"", "3#", "4$", "5%", "6&", "7'", "8(", "9)", "0", "-=", "^~", "\\|",
    "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "@`", "[{",
    "A", "S", "D", "F", "G", "H", "J", "K", "L", ";+", ":*", "]}",
    "Z", "X", "C", "V", "B", "N", "M", ",<", ".>", "/?", "\\_",
  },
  NON_ALPHANUMERIC_KEY_NAMES = {
    "Escape", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12", "F13", "F14", "F15", "F16", "F17", "F18", "F19", "F20", "F21", "F22", "F23", "F24",
    "HankakuZenkaku", "Backspace", "Tab", "Enter", "CapsLock", "NonConvert", "Space", "Convert", "KatakanaHiragana", "ContextMenu",
    "PrintScreen", "ScrollLock", "Pause", "Insert", "Home", "PageUp", "Delete", "End", "PageDown", "Up", "Down", "Left", "Right",
    "NumLock", "Numpad0", "Numpad1", "Numpad2", "Numpad3", "Numpad4", "Numpad5", "Numpad6", "Numpad7", "Numpad8", "Numpad9", "NumpadDecimal", "NumpadAdd", "NumpadSubtract", "NumpadMultiply", "NumpadDivide", "NumpadEnter",
  },
  MODIFIER_KEY_NAMES = {
    "ShiftLeft", "ShiftRight",
    "ControlLeft", "ControlRight",
    "AltLeft", "AltRight",
    "OSLeft", "OSRight",
  },
  ALPHANUMERIC_KEYS = {
    Key.DIGIT_1, Key.DIGIT_2, Key.DIGIT_3, Key.DIGIT_4, Key.DIGIT_5, Key.DIGIT_6, Key.DIGIT_7, Key.DIGIT_8, Key.DIGIT_9, Key.DIGIT_0, Key.MINUS, Key.EQUAL, Key.YEN,
    Key.Q, Key.W, Key.E, Key.R, Key.T, Key.Y, Key.U, Key.I, Key.O, Key.P, Key.LEFTBRACE, Key.RIGHTBRACE,
    Key.A, Key.S, Key.D, Key.F, Key.G, Key.H, Key.J, Key.K, Key.L, Key.SEMICOLON, Key.APOSTROPHE, Key.BACKSLASH,
    Key.Z, Key.X, Key.C, Key.V, Key.B, Key.N, Key.M, Key.COMMA, Key.DOT, Key.SLASH, Key.RO,
  },
  NON_ALPHANUMERIC_KEYS = {
    Key.ESC, Key.F1, Key.F2, Key.F3, Key.F4, Key.F5, Key.F6, Key.F7, Key.F8, Key.F9, Key.F10, Key.F11, Key.F12, Key.F13, Key.F14, Key.F15, Key.F16, Key.F17, Key.F18, Key.F19, Key.F20, Key.F21, Key.F22, Key.F23, Key.F24,
    Key.GRAVE, Key.BACKSPACE, Key.TAB, Key.ENTER, Key.CAPSLOCK, Key.MUHENKAN, Key.SPACE, Key.HENKAN, Key.KATAKANAHIRAGANA, Key.COMPOSE,
    Key.SYSRQ, Key.SCROLLLOCK, Key.PAUSE, Key.INSERT, Key.HOME, Key.PAGEUP, Key.DELETE, Key.END, Key.PAGEDOWN, Key.UP, Key.DOWN, Key.LEFT, Key.RIGHT,
    Key.NUMLOCK, Key.KP0, Key.KP1, Key.KP2, Key.KP3, Key.KP4, Key.KP5, Key.KP6, Key.KP7, Key.KP8, Key.KP9, Key.KPDOT, Key.KPPLUS, Key.KPMINUS, Key.KPASTERISK, Key.KPSLASH, Key.KPENTER,
  },
  MODIFIER_KEYS = {
    Key.LEFTSHIFT, Key.RIGHTSHIFT,
    Key.LEFTCTRL, Key.RIGHTCTRL,
    Key.LEFTALT, Key.RIGHTALT,
    Key.LEFTMETA, Key.RIGHTMETA,
  },
}
