
def check_login
	login_cnt = `uptime | awk '{print $5}'`
	return false if login_cnt.eql? "0\n" 

	return true
end

if __FILE__ == $0
	if check_login
		puts `osascript ~/workspace/worklog/worklog.osa`
	end
end
