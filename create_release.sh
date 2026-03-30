#!/usr/bin/env bash
#Check last tag and creates new release
yy=False
zz=False
x=$( git tag | tail -n1 | awk -F"." '{print $(NF)}')
y=$( git tag | tail -n1 | awk -F"." '{print $(NF-1)}')
z=$( git tag | tail -n1 | awk -F"." '{print $(NF-2)}' | awk -F'v' '{print $NF}')

#Check x
if [ $x -lt 9 ];then
    x=$(($x+1))
else
    yy=True
    x=0
fi

#Check y
if [ "$yy" ==  True ];then
    if [ $y -lt 9 ];then
	y=$(($y+1))
    else 
	zz=True
        y=0
    fi
fi

#Check z
if [ "$zz" ==  True ];then
    z=$(($z+1))
fi

echo git tag v${z}.${y}.${x}
git tag v${z}.${y}.${x}
echo git push --tags
git push --tags
