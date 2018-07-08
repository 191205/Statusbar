global frontApp, frontAppName, windowTitle

set windowTitle to ""
tell application "System Events"
    try
        set frontApp to first application process whose frontmost is true
        set frontAppName to name of frontApp
        tell process frontAppName
            tell (1st window whose value of attribute "AXMain" is true)
                set windowTitle to value of attribute "AXTitle"
            end tell
        end tell
    on error
        set windowTitle to " "
        set frontAppName to " "
    end try
end tell

return {frontAppName, windowTitle}
