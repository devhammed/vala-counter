/*
* Copyright (c) 2020-Present Hammed Oyedele (https://github.com/devhammed)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Hammed Oyedele <itz.harmid@gmail.com>
*/

public class ValaCounter : Gtk.Application {
    private Gtk.Button button;
    private Gtk.Window window;
    private int click_counter = 0;

    public ValaCounter () {
        Object (
            application_id: "com.github.devhammed.vala_counter",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        this.window = new Gtk.ApplicationWindow (this) {
            default_height = 500,
            default_width = 500,
            title = "Vala Counter (by @devhammed)"
        };

        this.button = new Gtk.Button () {
          margin = 200,
          label = this.get_button_label()
        };

        this.render();
        this.add_event_listeners();
    }

    private void render () {
      this.window.add (this.button);
      this.window.show_all ();
    }

    private void add_event_listeners () {
      this.button.clicked.connect (this.handle_button_click);
    }

    private void handle_button_click () {
      this.click_counter++;
      this.button.label = this.get_button_label ();
    }

    private string get_button_label () {
      return "Click me (%d)".printf (this.click_counter);
    }

    public static int main (string[] args) {
        return new ValaCounter ().run (args);
    }
}
