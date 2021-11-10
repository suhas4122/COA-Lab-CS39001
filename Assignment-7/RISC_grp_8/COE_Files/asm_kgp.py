import sys
import regex as re
import argparse
import os
from encoding import *

# Global variables
LTABLE = {"abc": 10}  # Label table (key: label, value: address)
LABEL_RE = re.compile(r'^\s*\.?(?P<label>\w+):\s*$')  # Label regex
PC = 0  # program counter


def parse_labels(source_file):
    """
        Parses the source file to find all labels and stores them in LTABLE
    """
    global PC
    with open(source_file, 'r') as f:
        for line in f:
            m = LABEL_RE.match(line)
            if m:
                label = m.group('label')
                if label in LTABLE:
                    raise Exception('Error: Label {} already defined at Line: {}'.format(
                        label, LTABLE[label]))
                else:
                    LTABLE[label] = PC + 4
            PC = PC + 4
    PC = 0


def main(source_file, output_file):
    global PC
    instructs = []
    with open(source_file, 'r') as f:
        for lno, line in enumerate(f.readlines()):
            line = line.strip()
            if line == '' or line[0] == ';':
                continue
            elif LABEL_RE.match(line):
                label = LABEL_RE.match(line).group('label')
                if label not in LTABLE:
                    raise Exception('Error: Label {} not defined at Line: {}'.format(label, lno))
            else:
                args = re.split(r'[\s,\(\)]+', line)

                op = args[0]
                if op in RFORMATS:  # r-format instructions
                    opcode = OPCODE[op]
                    funct = FUNCODE[op]
                    rs, rt = args[1], args[2]
                    shamt = 0
                    if rs[0] != "$":
                        raise Exception('Invalid register {}'.format(rs))
                    rs = int(rs[1:])
                    if rt[0] != "$":
                        shamt = int(rt) & 0b11111  # shamt is 5 bits
                        rt = 0  # can be kept garbage also
                    else:
                        rt = int(rt[1:])
                    instr = opcode << 26 | rs << 21 | rt << 16 | shamt << 11 | funct 
                    instr = format(instr, '032b')

                    instructs.append(instr)

                elif op == "lw" or op == "sw":  # lw and sw instructions
                    opcode = OPCODE[op]
                    rs, imm, rt = args[1], args[2], args[3]
                    if rs[0] != "$":
                        raise Exception('Invalid register {}'.format(rs))
                    rs = int(rs[1:])
                    if rt[0] != "$":
                        raise Exception('Invalid register {}'.format(rt))
                    rt = int(rt[1:])

                    imm = int(imm)
                    imm = bin(imm & 0xFFFF)  # 16 bit (2's complement)
                    imm = int(imm, 2)
                    instr = opcode << 26 | rs << 21 | rt << 16 | imm
                    instr = format(instr, '032b')

                    instructs.append(instr)

                elif op == "addi" or op == "compi":
                    opcode = OPCODE[op]
                    rs, imm = args[1], args[2]
                    if rs[0] != "$":
                        raise Exception('Invalid register {}'.format(rs))
                    rs = int(rs[1:])
                    rt = 0

                    imm = int(imm)
                    imm = bin(imm & 0xFFFF)  # 16 bit (2's complement)
                    imm = int(imm, 2)
                    instr = opcode << 26 | rs << 21 | rt << 16 | imm
                    instr = format(instr, '032b')

                    instructs.append(instr)

                elif op in ["b", "bcy", "bncy", "bl"]:
                    opcode = OPCODE[op]
                    label = args[1]
                    if label in LTABLE:
                        # pseudo-direct addressing
                        prfx = bin((PC+4) & 0xF0000000)
                        addr = LTABLE[label] - int(prfx, 2)
                        addr = format(addr, '032b')
                        instr = opcode << 26 | rs << 21 | int(addr[4:-2])
                        instr = format(instr, '032b')

                        instructs.append(instr)
                    else:
                        raise Exception(
                            "Error: Label {} not defined at Line: {}".format(label, lno))
                        
                elif op == "br":
                    opcode = OPCODE[op]
                    rs = args[1]
                    if rs[0] != "$":
                        raise Exception('Invalid register {}'.format(rs))
                    rs = int(rs[1:])
                    imm = 0

                    instr = opcode << 26 | rs << 21 | imm
                    instr = format(instr, '032b')

                    instructs.append(instr)

                elif op in ["bltz", "bz", "bnz"]:
                    opcode = OPCODE[op]
                    rs, label = args[1], args[2]
                    if rs[0] != "$":
                        raise Exception('Invalid register {}'.format(rs))
                    rs = int(rs[1:])

                    if label in LTABLE:
                        addr = LTABLE[label] - PC - 4
                        addr = (addr >> 2) & 0xFFFF
                        instr = opcode << 26 | rs << 21 | addr

                        instr = format(instr, '032b')
                        instructs.append(instr)

                    else:
                        raise Exception(
                            "Error: Label {} not defined at Line: {}".format(label, lno))

            PC = PC + 4

    with open(output_file, 'w') as f:
        for instr in instructs:
            f.write(instr + '\n')


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='KGP-RISC assembler')
    parser.add_argument('-s', '--source', help='source file',
                        required=True, type=str)
    parser.add_argument('-o', '--output', help='output file',
                        default='a.out', type=str)
    args = parser.parse_args()

    # Check if source file exists
    if not os.path.isfile(args.source):
        print('Error: source file does not exist')
        sys.exit(1)

    parse_labels(args.source)
    main(args.source, args.output)
