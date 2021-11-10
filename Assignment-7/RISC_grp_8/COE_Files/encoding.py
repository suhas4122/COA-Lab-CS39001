OPCODE = {
    "add": 0, "comp": 0,
    "and": 0, "xor": 0,
    "shll": 0, "shrl": 0,
    "shllv": 0, "shrlv": 0,
    "shra": 0, "shrav": 0,
    "addi": 3, "compi": 4,
    "lw": 1, "sw": 2,
    "b": 9, "br": 5,
    "bltz": 6, "bz": 7,
    "bnz": 8, "bl": 10,
    "bcy": 11, "bncy": 12,
}


RFORMATS = {
    "add", "comp",
    "and", "xor",
    "shll", "shrl",
    "shllv", "shrlv",
    "shra", "shrav"}


FUNCODE = {
    "add": 0, "comp": 1,
    "and": 2, "xor": 3,
    "shll": 4, "shrl": 5,
    "shllv": 6, "shrlv": 7,
    "shra": 8, "shrav": 9,
}
