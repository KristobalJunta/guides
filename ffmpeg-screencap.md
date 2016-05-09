# ffmpeg для записи экрана

```
ffmpeg -f x11grab -r <framerate|25> -s <resolution> -i :0.0 -sameq <output file>
```
