> 24.2.4. Отказ от программирования
> Программирование дорого и непредсказуемо по сравнению со многими другими видами деятельности, и полученная программа часто не на 100% надежна. Программирование трудоемко, и — по многим причинам — многие серьезные проекты задерживаются из-за неготовности кода. Так почему бы программирование как род деятельности совсем не устранить из процесса? Бьерн Страуструп, Язык программирования С++ (Третье издание)

### Best books
* High performance browser networking. Ilya Gorelik
* Computer systems from programmers perspective
* Grokking algorythms
* Concurrency in go. Katherina Buduray Cox
* The Imposter's Handbook. Rob conery
* Linux programming interface
* Writing An Interpreter In Go. Thorsten Ball
* Business model generation Osterwalder & Pigneur

### Great articles
* https://tenderlovemaking.com/2016/02/05/i-am-a-puts-debuggerer.html
* https://csswizardry.com/2017/05/little-things-i-like-to-do-with-git/
* http://postgres-data-types.pvh.ca/#1
* https://erthalion.info/2019/12/06/postgresql-stay-curious/
* https://sipb.mit.edu/doc/safe-shell/
* https://serverfault.com/questions/885403/linux-tracking-the-source-of-netstat-s-failed-connection-attempts
* https://sanctum.geek.nz/arabesque/series/unix-as-ide/

### Alghorytms to grokk
- [x] Bloom filter
- [x] Fourier transform
- [x] Hyperlog
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

> First: The term monad is a bit vacuous if you are not a mathematician. An alternative term is computation builder which is a bit more descriptive of what they are actually useful for.
> https://stackoverflow.com/a/194207/4651545

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

`openssl enc -aes-256-cbc -pbkdf2 -in un_encrypted.data -out encrypted.data`  
`openssl enc -d -aes-256-cbc -pbkdf2 -in encrypted.data -out un_encrypted.data`  

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

`arr.group_by { |x| x }.map { |element, matches| [ element, matches.length ] }.to_h`

`du -hs .`  
`du -hs /* | sort -rh | head`  
`du -hsx * | sort -rh | head -10`  

`hexdump -C /dev/urandom`

`:%!xxd # hex edit vim`

`pngquant **.png --ext .png --force`

`LC_CTYPE="C.UTF-8"`

port forwarding  
`ssh -R2001:localhost:143  remote.host.net`  
`ssh -L2001:remote.net:143 remote.net`  

`find . -name "*.ext"`

rename  
`find . -name "*.ua.yml" -exec rename -v 's/\.ua\.yml$/\.uk\.yml/i' {} \;`  
`find . -name '*.txt' -print0 | xargs -0 sed -i "" "s/oldword/newword/g"`  
`find dir -name '*.rb' -type f -exec sed -i -e 's/regex/replacement/g' -- {} +`  

`tar -zcvf archive.tar.gz directory/`

Constant       O(1)  
Logarithmic    O(log N)  
Linear         O(N)  
Linearithmic   O(N log N)  
Polynomial     O(N ^ 2)  
Exponential    O(2 ^ N)  
Factorial      O(N!)  

SQL

See how much space your tables (and indexes!) are taking up space  
SELECT  
relname AS table_name,  
pg_size_pretty(pg_total_relation_size(relid)) AS total,  
pg_size_pretty(pg_relation_size(relid)) AS internal,  
pg_size_pretty(pg_table_size(relid) - pg_relation_size(relid)) AS external,  
pg_size_pretty(pg_indexes_size(relid)) AS indexes  
FROM pg_catalog.pg_statio_user_tables ORDER BY pg_total_relation_size(relid) DESC;  

select distinct(s.billing_account_id)  
from phase_switches ps  
inner join subscriptions s  
on s.id = ps.subscription_id  
where exists  
  (select subscription_id  
  from phase_switches  
  where created_at between {{from}} and {{to}}  
  and phase_id = {{phase_id}}::uuid  
  and subscription_id = ps.subscription_id)  
and ps.created_at between {{from}} and {{to}}  
and ps.phase_id = {{phase_id}}::uuid;  