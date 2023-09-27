import time
import ProgressBar

for i in progressbar.progressbar(range(100)):
    time.sleep(0.5)
    bar.update(i)