# This command allows to refresh data in UI, e.g.:
# - files
# - file sizes
# - file date
# - file permissions
# - etc.

from ranger.api.commands import Command

class refresh_data_in_ui(Command):
    """:refresh_data_in_ui
    Refresh data in ui.
    """
    def execute(self):
        # TODO
        self.fm.ui.win.refresh()

