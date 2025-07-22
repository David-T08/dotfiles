#!/usr/bin/env python3
import subprocess
import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gdk

def get_cursor_position():
    result = subprocess.run(["hyprctl", "cursorpos"], capture_output=True, text=True)
    if result.returncode != 0:
        return 100, 100  # Fallback
    x, y = result.stdout.strip().split(",")
    return int(x), int(y)

class VolumePopup(Gtk.Window):
    def __init__(self):
        super().__init__(title="Volume")
        self.set_decorated(False)
        self.set_type_hint(Gdk.WindowTypeHint.POPUP_MENU)
        self.set_border_width(10)
        self.set_resizable(False)

        # Slider
        self.slider = Gtk.Scale.new_with_range(Gtk.Orientation.HORIZONTAL, 0, 100, 1)
        self.slider.set_value(self.get_current_volume())
        self.slider.connect("value-changed", self.on_value_changed)
        self.slider.set_size_request(200, -1)

        self.add(self.slider)
        self.show_all()

        # Position at cursor
        x, y = get_cursor_position()
        self.move(x - 100, y + 20)  # Offset so it doesn't block cursor

    def get_current_volume(self):
        try:
            vol = subprocess.check_output(["pamixer", "--get-volume"]).decode().strip()
            return int(vol)
        except:
            return 50

    def on_value_changed(self, slider):
        volume = int(slider.get_value())
        subprocess.run(["pamixer", "--set-volume", str(volume)])

win = VolumePopup()
win.connect("destroy", Gtk.main_quit)
Gtk.main()

