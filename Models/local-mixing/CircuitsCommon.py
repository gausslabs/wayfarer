
from enum import Enum


class Gates(Enum):
    F = 0,      # false,
    AND = 1,    # a & b,
    AND_NB = 2, # a & (!b),
    A = 3,      # a,
    AND_NA = 4, # (!a) & b,
    B = 5,      # b,
    XOR = 6,    # a ^ b,
    OR = 7,     # a | b,
    NOR = 8,    # !(a | b),
    EQUIV = 9,  # (a & b) | ((!a) & (!b)),
    NB = 10,    # !b,
    OR_NB = 11, # (!b) | a,
    NA = 12,    # !a,
    OR_NA = 13, # (!a) | b,
    NAND = 14,  # !(a & b),
    T = 15,     # true,

    @staticmethod
    def from_int(value: int):
        val = value & ((1<<4)- 1)

        match val:
            case 0:
                return Gates.F
            case 1:
                return Gates.AND
            case 2:
                return Gates.AND_NB
            case 3:
                return Gates.A
            case 4:
                return Gates.AND_NA
            case 5:
                return Gates.B
            case 6:
                return Gates.XOR
            case 7:
                return Gates.OR
            case 8:
                return Gates.NOR
            case 9:
                return Gates.EQUIV
            case 10:
                return Gates.NB
            case 11:
                return Gates.OR_NB
            case 12:
                return Gates.NA
            case 13:
                return Gates.OR_NA
            case 14:
                return Gates.NAND
            case 15:
                return Gates.T
            case _:
                raise Exception("Invalid integer value!")
            
    def evaluate(self, a: bool, b: bool) -> bool:
        match self:
            case self.F:
                return False
            case self.AND:
                return (a & b)
            case self.AND_NB:
                return a & (~b)
            case self.A:
                return a
            case self.AND_NA:
                return (~a) & b
            case self.B:
                return b
            case self.XOR:
                return (a ^ b)
            case self.OR:
                return (a | b)
            case self.NOR:
                return ~(a | b)
            case self.EQUIV:
                return (a & b) | ((~a) & (~b))
            case self.NB:
                return ~b
            case self.OR_NB:
                return a | (~b)
            case self.NA:
                return ~a
            case self.OR_NA:
                return (~a) | b
            case self.NAND:
                return ~(a & b)
            case self.T:
                return True