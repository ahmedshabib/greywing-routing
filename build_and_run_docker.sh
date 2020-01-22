echo "Removing existing docker data and compiled files..."
rm docker/data/searoute.war
rm -rf docker/data/searoute
rm -rf searoute/target
echo "Compiling..."
cd searoute && mvn clean package
echo "Copying data..."
cp target/searoute.war ../docker/data/ && cp -r target/searoute ../docker/data
echo "Checking if copy completed well..."
if [[ ! -f ../docker/data/searoute.war ]] ; then
    echo 'target file doesnt exist, aborting.'
    exit
fi
echo "Building docker..."
cd ../docker
docker build -t sr-irtc .
echo "Running docker..."
docker run -d --name sr -p 8080:8080 sr-irtc
echo "Attaching to logs..."
docker logs -f sr