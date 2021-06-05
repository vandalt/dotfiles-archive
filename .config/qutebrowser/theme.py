colors = {
    'colors0': '#1a1b26',
    'colors1': '#24283b',
    'colors2': '#292e42',
    'colors3': '#343b58',
    'colors4': '#c0caf5',
    'colors5': '#b4f9f8',
    'colors6': '#b4f9f8',
    'colors8': '#9ece6a',
    'colors10': '#565f89',
    'colors11': '#f7768e',
    'colors12': '#e0af68',
    'colors13': '#e0af68',
    'colors14': '#7aa2f7',
    'colors15': '#d5d6db',

    'colors7': '#8fbcbb',  # TODO: Use a tokyonight color

    'colors9': '#81a1c1',  # TODO: Use a tokyonight

}

## Background color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.bg = colors['colors0']

## Bottom border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.bottom = colors['colors0']

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.top = colors['colors0']

## Foreground color of completion widget category headers.
## Type: QtColor
c.colors.completion.category.fg = colors['colors5']

## Background color of the completion widget for even rows.
## Type: QssColor
c.colors.completion.even.bg = colors['colors1']

## Background color of the completion widget for odd rows.
## Type: QssColor
c.colors.completion.odd.bg = colors['colors1']

## Text color of the completion widget.
## Type: QtColor
c.colors.completion.fg = colors['colors4']

## Background color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.bg = colors['colors3']

## Bottom border color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.border.bottom = colors['colors3']

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.item.selected.border.top = colors['colors3']

## Foreground color of the selected completion item.
## Type: QtColor
c.colors.completion.item.selected.fg = colors['colors6']

## Foreground color of the matched text in the completion.
## Type: QssColor
c.colors.completion.match.fg = colors['colors13']

## Color of the scrollbar in completion view
## Type: QssColor
c.colors.completion.scrollbar.bg = colors['colors1']

## Color of the scrollbar handle in completion view.
## Type: QssColor
c.colors.completion.scrollbar.fg = colors['colors5']

## Background color for the download bar.
## Type: QssColor
c.colors.downloads.bar.bg = colors['colors0']

## Background color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.bg = colors['colors11']

## Foreground color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.fg = colors['colors5']

## Color gradient stop for download backgrounds.
## Type: QtColor
c.colors.downloads.stop.bg = colors['colors15']

## Color gradient interpolation system for download backgrounds.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
c.colors.downloads.system.bg = 'none'

## Background color for hints. Note that you can use a `rgba(...)` value
## for transparency.
## Type: QssColor
c.colors.hints.bg = colors['colors13']

## Font color for hints.
## Type: QssColor
c.colors.hints.fg = colors['colors0']

## Font color for the matched part of hints.
## Type: QssColor
c.colors.hints.match.fg = colors['colors10']

## Background color of the keyhint widget.
## Type: QssColor
c.colors.keyhint.bg = colors['colors1']

## Text color for the keyhint widget.
## Type: QssColor
c.colors.keyhint.fg = colors['colors5']

## Highlight color for keys to complete the current keychain.
## Type: QssColor
c.colors.keyhint.suffix.fg = colors['colors13']

## Background color of an error message.
## Type: QssColor
c.colors.messages.error.bg = colors['colors11']

## Border color of an error message.
## Type: QssColor
c.colors.messages.error.border = colors['colors11']

## Foreground color of an error message.
## Type: QssColor
c.colors.messages.error.fg = colors['colors1']

## Background color of an info message.
## Type: QssColor
c.colors.messages.info.bg = colors['colors8']

## Border color of an info message.
## Type: QssColor
c.colors.messages.info.border = colors['colors8']

## Foreground color an info message.
## Type: QssColor
c.colors.messages.info.fg = colors['colors1']

## Background color of a warning message.
## Type: QssColor
c.colors.messages.warning.bg = colors['colors12']

## Border color of a warning message.
## Type: QssColor
c.colors.messages.warning.border = colors['colors12']

## Foreground color a warning message.
## Type: QssColor
c.colors.messages.warning.fg = colors['colors1']

## Background color for prompts.
## Type: QssColor
c.colors.prompts.bg = colors['colors2']

# ## Border used around UI elements in prompts.
# ## Type: String
c.colors.prompts.border = '1px solid ' + colors['colors0']

## Foreground color for prompts.
## Type: QssColor
c.colors.prompts.fg = colors['colors5']

## Background color for the selected item in filename prompts.
## Type: QssColor
c.colors.prompts.selected.bg = colors['colors3']

## Background color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.bg = colors['colors15']

## Foreground color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.fg = colors['colors1']

## Background color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.bg = colors['colors15']

## Foreground color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.fg = colors['colors1']

## Background color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.bg = colors['colors2']

## Foreground color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.fg = colors['colors5']

## Background color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.bg = colors['colors2']

## Foreground color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.fg = colors['colors5']

## Background color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.bg = colors['colors14']

## Foreground color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.fg = colors['colors1']

## Background color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.bg = colors['colors0']

## Foreground color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.fg = colors['colors5']

## Background color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.bg = colors['colors10']

## Foreground color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.fg = colors['colors5']

## Background color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.bg = colors['colors3']

## Foreground color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.fg = colors['colors5']

## Background color of the progress bar.
## Type: QssColor
c.colors.statusbar.progress.bg = colors['colors5']

## Foreground color of the URL in the statusbar on error.
## Type: QssColor
c.colors.statusbar.url.error.fg = colors['colors11']

## Default foreground color of the URL in the statusbar.
## Type: QssColor
c.colors.statusbar.url.fg = colors['colors5']

## Foreground color of the URL in the statusbar for hovered links.
## Type: QssColor
c.colors.statusbar.url.hover.fg = colors['colors8']

## Foreground color of the URL in the statusbar on successful load
## (http).
## Type: QssColor
c.colors.statusbar.url.success.http.fg = colors['colors5']

## Foreground color of the URL in the statusbar on successful load
## (https).
## Type: QssColor
c.colors.statusbar.url.success.https.fg = colors['colors14']

## Foreground color of the URL in the statusbar when there's a warning.
## Type: QssColor
c.colors.statusbar.url.warn.fg = colors['colors12']

## Background color of the tab bar.
## Type: QtColor
c.colors.tabs.bar.bg = colors['colors3']

## Background color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.bg = colors['colors3']

## Foreground color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.fg = colors['colors5']

## Color for the tab indicator on errors.
## Type: QtColor
c.colors.tabs.indicator.error = colors['colors11']

## Color gradient start for the tab indicator.
## Type: QtColor
# c.colors.tabs.indicator.start = colors['violet']

## Color gradient end for the tab indicator.
## Type: QtColor
# c.colors.tabs.indicator.stop = colors['orange']

## Color gradient interpolation system for the tab indicator.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
c.colors.tabs.indicator.system = 'none'

## Background color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.bg = colors['colors3']

## Foreground color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.fg = colors['colors5']

# ## Background color of selected even tabs.
# ## Type: QtColor
c.colors.tabs.selected.even.bg = colors['colors0']

# ## Foreground color of selected even tabs.
# ## Type: QtColor
c.colors.tabs.selected.even.fg = colors['colors5']

# ## Background color of selected odd tabs.
# ## Type: QtColor
c.colors.tabs.selected.odd.bg = colors['colors0']

# ## Foreground color of selected odd tabs.
# ## Type: QtColor
c.colors.tabs.selected.odd.fg = colors['colors5']

## Background color for webpages if unset (or empty to use the theme's
## color)
## Type: QtColor
# c.colors.webpage.bg = 'white'
