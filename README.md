# Searoute with IRTC

This is a modification of the [Searoute](https://github.com/eurostat/searoute) project, to add support for the [International Recommended Transit Corridor](https://en.wikipedia.org/wiki/International_Recommended_Transit_Corridor). A jetty-based docker server is also provided.

## How to compile and use

First, [download and install](https://maven.apache.org/download.cgi) maven to the path.

Second, run `build_and_run_docker.sh` from the repo root directory, to compile searoute, build the docker container and run it. The container is exposed to port 8080.

That's it!

## Testing

A sample route with the non-IRTC routes disabled: [http://localhost:8080/searoute.html?res=5&ser=rou&nonIRTC=0&suez=1&panama=1&opos=32.54132080099997,29.956298828&dpos=58.563720703,23.621520996000015](http://localhost:8080/searoute.html?res=5&ser=rou&nonIRTC=0&suez=1&panama=1&opos=32.54132080099997,29.956298828&dpos=58.563720703,23.621520996000015)

The same route with non-IRTC routes enabled: [http://localhost:8080/searoute.html?res=5&ser=rou&nonIRTC=1&suez=1&panama=1&opos=32.54132080099997,29.956298828&dpos=58.563720703,23.621520996000015](http://localhost:8080/searoute.html?res=5&ser=rou&nonIRTC=1&suez=1&panama=1&opos=32.54132080099997,29.956298828&dpos=58.563720703,23.621520996000015)

## Note

The IRTC detection is implemented in software, and is only tested to work for the default (20km) resolution. Forks and pull requests are welcome!