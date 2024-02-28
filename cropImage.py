import os
from PIL import Image

set_path = r'C:\Study\2_Curve_Boundary\Figure10'
os.chdir(set_path)

for i in range(10,12,2):
    name = "FlowerTotal0"+str(i)+"s.png"
    im = Image.open(name)
    im.size  # (364, 471)
    im.getbbox()  # (64, 89, 278, 267)
    im2 = im.crop(im.getbbox())
    im2.size  # (214, 178)
    im2.save(name)