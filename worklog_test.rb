
def check_login
  login_cnt = `uptime | grep -E -o "[0-9]+ users" | awk '{print $1}'`
  return false if login_cnt.eql? "0\n" 
  
  sleep_state = `/usr/sbin/ioreg -n IODisplayWrangler | grep -o \\"CurrentPowerState\\"=4`
  puts sleep_state
  return false if sleep_state.empty?

  return true
end

if __FILE__ == $0
  unless check_login
    puts "Not login"
  end
end
