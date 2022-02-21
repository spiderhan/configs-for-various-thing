Open a DevTools of the DevTools
----------------------------------------------------------------
Press Ctrl+Shift+i to open a DevTools pane.

1) Open the menu on the upper-right of the pane, then click Dock side: undock into separate window
2) On the opened DevTools pane, press Ctrl+Shift+i again, now will open a DevTools of the DevTools.
3) Step 2. Export (backup existing snippets)
4) Paste and run this code in Console

let exportSnippets = InspectorFrontendHost.getPreferences(_ => {
  exportSnippets = JSON.parse(_.scriptSnippets) });

5) copy the code to the clipboard using

copy(exportSnippets)

Import the Snippets back
----------------------------------------------------------------
let importSnippets = [ /* paste snippets here */ ];
InspectorFrontendHost.setPreference("scriptSnippets", JSON.stringify(importSnippets));





