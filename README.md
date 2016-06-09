# Logstash Plugin

## Download
git clone https://github.com/hahni8090/logstash-filter-commands.git

## Install
bin/logstash-plugin install /<"path-to-plugin">/logstash-filter-commands-0.1.0.gem

## Run
```sh
bin/logstash -e 'input { stdin{} } filter { commands { command => [<attribute>, <your-script>] } } output {stdout { codec => rubydebug }}'
```

```sh
bin/logstash -e 'input { stdin{} } filter { commands { parameter1 => "<param1>" command => [<attribute>, <your-script>] } } output {stdout { codec => rubydebug }}'
```

Script should be global on your machine!

You have 5 parameters

Plugin execute: your-script.sh param1 ... param5

Response of <your-script> must be json ({"hello":"world"})!

Result in Logstash:

```sh
...
"<attribute>" => {
        "hello" => "world"
    }
...
```
