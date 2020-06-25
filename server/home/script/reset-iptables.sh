iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT



from django.core.mail import send_mail
send_mail('suberferfer', 'new sub', None, ['contact@germainremi.fr'])