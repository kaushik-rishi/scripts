import pyautogui as pa
from time import sleep
import os

print("about to start")
sleep(5)
cnt = 2000
while cnt > 0:
    pa.click(1734, 1045)
    pa.press('right', presses=1)
    count = os.popen('ls -l ~/Telegram\ Desktop | wc -l').read()
    os.system(f'notify-send --icon=brave-brower -t 1000 {count}')
    sleep(0.5)
    cnt -= 1
