### Alghorytms and data structures to grokk
- [x] Bloom filter
- [x] Fourier transform
- [x] Hyperlog
- [x] Huffman trees
- [ ] Count–min sketch
- [ ] Reservoir sampling
- [ ] Linear programming и Simplex algorithm
- [ ] Diffie-Hellman

### terminal control keys
**move around:**
```
ctrl+a ctrl+e
alt+b alt+f
```
**delete:**
word: `ctrl+w ctrl+d`  
line back and forth: `ctrl+u ctrl+k`  

`git log --all --grep='<pattern>' | ack '^commit\s+'`  

### curl
with headers:  
`curl -i https://example.com`  
follow redirect:  
`curl -I -L https://example.com/redirected`  
post file:  
`curl -d @file https://example.com receiver -o saved`  
`ls -l | curl -d @- https://example.com/receiver -o saved`  
verbose:  
`curl -v https://example.com -o /dev/null`  
resolve sert locally:  
`curl https://example.com/ --resolve example.com:443:172.0.0.1`  
http version:  
`curl --http1.0 https://example.com`  
`curl --http2 https://example.com`  
save and use cookies:  
`curl -c cookiejar.txt https://example.com`  
`curl -b cookiejar.txt https://example.com`  

`curl -u 73ea6362d09a90a6db650f3e9aedf6ae90626a7e5630f2eb49d582ba: -H "Content-Type: application/json" -X POST -d '{"format": "csv", "type": "leads", "send_done_email": false }' https://close.io/api/v1/export/lead/`  
`curl -XPOST -H "Content-Type: application/json" -d '{"contact":{"Email":"hi.bye@some.thing"}}' https://api2.autopilothq.com/v1/contac`  
`curl -v -H 'Content-Type: application/json' -- 'https://example.com/?asdf=asdf' | jq '.results[] | {id: .id, title: .title}'`  

`telnet -4 www.redhat.com 80`  
`netcat: nc -w3 -4 -v www.redhat.com 80`  

`netstat -s | grep 'Tcp:' -A 10 # outbound`  
`netstat -ntp | grep SERVICE_PORT # inbound`  

`free -m`  

`dmesg -l err`  

`ss -an | awk '{print $2}' | sort | uniq -c | sort -rn`  

`nload`  

`traceroute www.google.com`  

`socat -d -d - TCP4:www.example.com:80`  
`socat -d -d - TCP:www.example.com:80,retry=5`  
`socat -d -d - TCP4-LISTEN:www.example.com:80,fork`  
`socat -u STDIN STDOUT`  
`socat -d -d READLINE\!\!OPEN:file.txt,creat,trunc SYSTEM:'read stdin; echo $stdin'`  

`nmap  google.com`  

`openssl enc -aes-256-cbc -pbkdf2 -in un_encrypted.data -out encrypted.data`  
`openssl enc -d -aes-256-cbc -pbkdf2 -in encrypted.data -out un_encrypted.data`  

`docker rm -f $(docker ps -aq)`  
`docker rmi -f $(docker images -q)`  
`docker system prune`  

`sudo chown -R $USER:$GROUP ~/some-file`  

`gpg --list-keys`  
`gpg -e -u "Sender User Name" -r "Receiver User Name" somefile`  
`gpg -d mydata.tar.gpg`  

`grep -R "regex" some/folder`  
`grep -R "RequestStore" ./*/**/spec`  
`grep "t\.string.*index:\strue" apps/api/db/migrate/*`  
`zgrep "sign_up" beeline_kz_production_rosing_api_2020_01_05.log.gz`  

to see kernel version  
`uname -a`  

`go fmt ./...`
`gofmt -w ./`

`du -hs .`  
`du -hs /* | sort -rh | head`  
`du -hsx * | sort -rh | head -10`  
`ncdu .` — beautiful `du` alternative  

`hexdump -C /dev/urandom`

`:%!xxd # hex edit vim`

`pngquant **.png --ext .png --force`

`LC_CTYPE="C.UTF-8"`

port forwarding  
`ssh -R 2001:localhost:143  remote.host.net`  
`ssh -L 2001:remote.net:143 remote.net`  
`ssh -L <local_host>:<local_port>:<remote_host>:<remove_port> <via>`  
`ssh -L localhost:3001:example.com:4001 root@160.25.100.100`  
`ssh -D 3000 <remote_host>`  

`find . -name "*.ext"`

rename  
`find . -name "*.ua.yml" -exec rename -v 's/\.ua\.yml$/\.uk\.yml/i' {} \;`  
`find . -name '*.txt' -print0 | xargs -0 sed -i "" "s/oldword/newword/g"`  
`find dir -name '*.rb' -type f -exec sed -i -e 's/regex/replacement/g' -- {} +`  
`find . -type d -name src`  
`find . -type f -name src`  
`find . -type l -name src`  
`find . -type d -name '*.md' -not -path 'node_modules/*'`  
Search files bigger than 100KB but smaller than 1MB:  
`find . -type f -size +100k -size -1M`  
Search files edited more than 3 days ago:  
`find . -type f -mtime +3`  
Search files edited in the last 24 hours:  
`find . -type f -mtime -1`  
You can delete all the files matching a search by adding the -delete option. This deletes all the files edited in the last 24 hours:  
`find . -type f -mtime -1 -delete`  
You can execute a command on each result of the search. In this example we run cat to print the file content:  
`find . -type f -exec cat {} ;`  

`tar -zcvf archive.tar.gz directory/`

Trace DNS lookup  
`dig @8.8.8.8 +trace github.com`

Constant       O(1)  
Logarithmic    O(log N)  
Linear         O(N)  
Linearithmic   O(N log N)  
Polynomial     O(N ^ 2)  
Exponential    O(2 ^ N)  
Factorial      O(N!)  

SQL
a quick HTML report of your databases  
`psql -c "\l+" -H -q postgres > out.html`

See how much space your tables (and indexes!) are taking up space  
SELECT  
relname AS table_name,  
pg_size_pretty(pg_total_relation_size(relid)) AS total,  
pg_size_pretty(pg_relation_size(relid)) AS internal,  
pg_size_pretty(pg_table_size(relid) - pg_relation_size(relid)) AS external,  
pg_size_pretty(pg_indexes_size(relid)) AS indexes  
FROM pg_catalog.pg_statio_user_tables ORDER BY pg_total_relation_size(relid) DESC;  
