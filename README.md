# Screen to gif

Record a window from command line by clicking on it :

```
$ screen-to-gif.sh

Welcome to screen to gif

Click a window to start recording
Start recording 0x2200006

CTRL-C to stop recording
...
```

## Requirements:

_(in order of appearance)_

* xwininfo
* recordmydesktop
* ffmpeg

## Notes:

* Launch `screen-to-gif.sh --help` for usage.
* Recording audio is not supported
* no dynamic params for compression, etc.
