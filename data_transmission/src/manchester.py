def encode(data):
    return [
        obit
        for ibit in data
        for obit in manchester_bit(ibit)
    ]


def encode_bit(bit):
    if bit == 0:
        return [1, 0]
    elif bit == 1:
        return [0, 1]


def decode(data):
    return [
        decode_bit(data[2*i]. data[2*i+1])
        for i in range(0, round(len(data)/2))
    ]


def decode_bit(bit1, bit2):
    if bit1 == 0 and bit2 == 1:
        return 1
    elif bit1 == 1 and bit2 == 0:
        return 0
