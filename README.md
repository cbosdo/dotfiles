Setup the configuration files for the tools I use.

# Excalidraw SVG setup

In order to properly add Excalidraw generated SVG files in LibreOffice, install the Virgil font:

```
curl -LO https://virgil.excalidraw.com/Virgil.woff2
woff2_decompress Virgil.woff2
mv Virgil.ttf ~/.local/share/fonts/
```

Create `~/.config/fontconfig/conf.d/10-excalidraw.conf` file with the following content.
Note that `SourceCodePro` can be replaced with whatever Source code font family you prefer.

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <alias>
    <family>Cascadia</family>
    <prefer>
      <family>SourceCodePro</family>
    </prefer>
  </alias>

  <alias>
    <family>Virgil</family>
    <prefer>
        <family>Virgil 3 YOFF</family>
    </prefer>
  </alias>
</fontconfig>
```

**Each generated SVG file needs to be passed to the `excalidraw-colors` script in order to fix the colors for dark theme**
