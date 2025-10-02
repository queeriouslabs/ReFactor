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


RELEASE_CYLINDER_POSITION_COUNT = 20

def advance_release_cylinder():
  multistep(count = 50, direction = 'ccw')
  multistep(count = 50, direction = 'cw')

def release_current_heddle():
  multistep(count = 30, direction = 'cw')
  multistep(count = 30, direction = 'ccw')

def reset_heddles():
  for _ in range(200):
    step(direction = 'cw')

def set_heddles(bits):
  for _, bit in enumerate(bits):
    advance_release_cylinder()
    if bit == 0:
      release_current_heddle()

def test_release_cylinder_full_cycle():
  for _ in range(RELEASE_CYLINDER_POSITION_COUNT):
    advance_release_cylinder()

def test_heddle_sequence():
  for _ in range(2):
    set_heddles([1,0,1,0,1] + 15*[1])
    reset_heddles()
    set_heddles([0,1,0,1,0] + 15*[1])
    reset_heddles()
