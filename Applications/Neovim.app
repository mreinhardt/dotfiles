on run {input, parameters}
	try
		set filename to POSIX path of input
	on error err
		set filename to "~"
	end try
	set cmd to "clear;cd `dirname " & filename & "`;/usr/local/bin/nvim " & filename

	tell application "iTerm"
		tell the current window
			create window with default profile
			tell the current session
				write text cmd
			end tell
		end tell
	end tell
end run
