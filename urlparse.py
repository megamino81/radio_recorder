import commands

#status, output = commands.getstatusoutput("curl -s 'https://onair.kbs.co.kr/index.html?sname=onair&stype=live&ch_code=25&ch_type=radioList'")

status, output = commands.getstatusoutput("curl -s 'http://serpent0.duckdns.org:8088/kbs2fm.pls'")

#print status
#print output
output = output.splitlines()
#print output
lines = []
for l in output:
    if "https" in l:
        #i = l.find("service_url")
        lines.append(l)
#print lines
v = lines[0]
start = v.find("https")
url = v[start:]
print (url)
