echo "8.8.8.8" > resolvers.txt 
echo "4.2.2.4" >> resolvers.txt


echo "Subfinder start ..... " 
subfinder -d $1 -all -silent > subfinder-$1.txt 

echo "W8 for abuseDBIP ...."
curl -s https://www.abuseipdb.com/whois/dell.com | grep "<li>\w.*</li>" | sed -E 's/<\/?li>//g' | sed "s/\$/.\$1/g" >> subfinder-$1.txt 


echo "Rappiddns Finder .... " 
curl "https://rapiddns.io/s/$1?full=1&down=1#result" -s | grep "<td>.*\..*\..*</td>" | sed -E "s/<\/?td>//g" | sed -E "s/\d{1,3}\.\d{1,3}\.\d{1,3}//g" >> subfinder-$1.txt



massdns -q -r resolvers.txt -t A -o S -w $1-dnsresolver.txt subfinder-$1.txt
cat subfinder-$1.txt | dnsgen - | massdns -o S -q -r resolvers.txt > $1-subdomain-resolver-dnsgen.txt 

cat $1-subdomain-resolver-dnsgen.txt $1-dnsresolver.txt | cut -d " " -f1  | sed "s/\.$//g" > all-resolve.txt 
