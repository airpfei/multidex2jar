#!/bin/bash


if [[ $# != 2 ]]; then
  echo "useage: $0 example.apk example.jar"
  exit
fi

root=`dirname $0`
unzip_dir="$root/temp_my_d2j_unzip"
jar_dir="$root/temp_my_d2j_jar"
class_dir="$root/temp_my_d2j_class"
d2j="$root/dex2jar-2.0/d2j-dex2jar.sh"

rm -rf $unzip_dir
rm -rf $jar_dir
rm -rf $class_dir

unzip -q $1 -d $unzip_dir
mkdir $class_dir
mkdir $jar_dir


bash $d2j "$unzip_dir/classes.dex" -o "$jar_dir/1.jar"

for i in {2..1000}  
do
    dex_path="$unzip_dir/classes$i.dex"
    if [ ! -f $dex_path ]; then
        break
    fi
    bash $d2j $dex_path -o "$jar_dir/$i.jar"
done

for i in {1..1000}  
do
    jar_path="$jar_dir/$i.jar"
    if [ ! -f $jar_path ]; then
        break
    fi
    echo "$jar_path to classes"
    unzip -q $jar_path -d $class_dir
done

echo "combining..."
jar -cf $2 -C $class_dir .

rm -rf $unzip_dir
rm -rf $jar_dir
rm -rf $class_dir
