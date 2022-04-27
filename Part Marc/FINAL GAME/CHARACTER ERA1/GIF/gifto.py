from PIL import Image, ImageDraw, ImageFont #dynamic import


for x in range(0, 8):
    gif=f'frame_{x}_delay-0.1s.gif'
    img = Image.open(gif)
    img.save(f"frame{x}"+".png",'png', optimize=True, quality=70)