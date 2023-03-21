import random


def generate_signal(width, error, data):
    return [
        obit
        for ibit in data
        for obit in generate_signal_bit(width, error, ibit)
    ]


def generate_signal_bit(width, error, bit):
    if random.random() < 0.5:
        sign = -1
    else:
        sign = 1

    delta = round(sign * error * random.random())

    noisy_width = width + delta

    return noisy_width * [bit]


def interpret_signal(width, data):
    output = []
    run = []
    for bit in data:
        if len(run) == 0 or run[0] == bit:
            run.append(bit)
        elif run[0] != bit:
            output += interpret_run(width, run)
            run = [bit]
    if len(run) > 0:
        output += interpret_run(width, run)

    return output


def interpret_run(width, run):
    count = round(len(run)/width)
    return count * [run[0]]
