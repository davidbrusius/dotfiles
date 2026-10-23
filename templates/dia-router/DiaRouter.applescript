-- Dia Router: a background app set as the macOS default browser.
-- Opens every link in a specific Dia profile, since Dia ignores
-- --profile-directory when launched by other apps.

property profileName : "Doximity"

on open location theURL
	try
		tell application "Dia"
			reopen -- creates a window if Dia has none (also launches it)
			activate
			repeat 50 times
				if (count of windows) > 0 then exit repeat
				delay 0.1
			end repeat
			set p to first profile of front window whose name is profileName
			set t to make new tab at end of tabs of p with properties {URL:theURL}
			focus t
		end tell
	on error
		-- Profile missing or Dia not scriptable: open in Dia normally.
		do shell script "open -a Dia " & quoted form of theURL
	end try
end open location

on open theFiles
	-- Local .html files: hand them to Dia directly.
	repeat with f in theFiles
		do shell script "open -a Dia " & quoted form of POSIX path of f
	end repeat
end open

on run
	-- Double-clicking the app does nothing; it only handles links.
	-- Built stay-open (osacompile -s) so it remains running between links.
end run
