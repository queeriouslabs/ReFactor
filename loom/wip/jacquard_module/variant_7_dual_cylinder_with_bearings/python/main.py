import time
# DIR -> D8 (IO15)
DIR = machine.Pin(15, machine.Pin.OUT)
# STEP -> D7 (IO13)
STEP = machine.Pin(13, machine.Pin.OUT)

def step(direction):
  if direction == 'cw':
    DIR.off()
  elif direction == 'ccw':
    DIR.on()
  else:
    DIR.off()
  
  STEP.on()
  time.sleep_ms(1)
  STEP.off()
  time.sleep_ms(1)

def multistep(count, direction):
  for _ in range(count):
    step(direction)


RELEASE_CYLINDER_POSITION_COUNT = 21
TOTAL_STEPS = 200
ADVANCE_FRAC = 1/4
ADVANCE_DELTA = 4

def advance_release_cylinder():
  release_steps = ADVANCE_FRAC * TOTAL_STEPS
  multistep(count = release_steps+ADVANCE_DELTA, direction = 'ccw')
  multistep(count = release_steps, direction = 'cw')

def release_current_heddle():
  multistep(count = 30, direction = 'cw')
  multistep(count = 30, direction = 'ccw')

def reset_heddles(delta = 0):
  multistep(count = TOTAL_STEPS + delta, direction = 'cw')

def set_heddles(bits):
  for _, bit in enumerate(bits):
    if bit == 0:
      release_current_heddle()
    advance_release_cylinder() # move to next heddle

  # advance_release_cylinder() # move to reset position

def test_release_cylinder_full_cycle():
  for _ in range(RELEASE_CYLINDER_POSITION_COUNT):
    advance_release_cylinder()

def test_heddle_sequence():
  while True:
    pattern = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0]
    set_heddles(pattern)
    input()
    # reset_heddles()
    set_heddles([ 1-b for b in pattern ])
    input()
    # reset_heddles()
