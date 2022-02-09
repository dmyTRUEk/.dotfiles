# dmyTRUEk's Ranger Colorscheme (ala gruvbox)

from __future__ import (absolute_import, division, print_function)

from ranger.colorschemes.default import Default
from ranger.gui.color import red, blue, yellow



class Scheme(Default):
    progress_bar_color = yellow

    def use(self, context):
        fg, bg, attr = Default.use(self, context)

        if context.directory and not context.marked and not context.link \
                and not context.inactive_pane:
            fg = self.progress_bar_color

        if context.in_titlebar and context.hostname:
            fg = red if context.bad else blue

        return fg, bg, attr

