from PIL import Image, ImageDraw, ImageFont #dynamic import


for x in range(100, 121):
    try:
        gif=f'frame_{x}_delay-0.07s.gif'
        img = Image.open(gif)
        img.save(f"frame{x}"+".png",'png', optimize=True, quality=70)
    except Exception:
        pass