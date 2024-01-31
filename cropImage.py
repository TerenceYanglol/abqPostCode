from PIL import Image

for i in range(11,42,10):
    name = "temperature_no_image"+str(i)+".png"
    im = Image.open(name)
    im.size  # (364, 471)
    im.getbbox()  # (64, 89, 278, 267)
    im2 = im.crop(im.getbbox())
    im2.size  # (214, 178)
    im2.save(name)