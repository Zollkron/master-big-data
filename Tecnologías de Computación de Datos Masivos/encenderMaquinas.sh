#!/bin/bash
for m in {NameNode,CheckPointNode,DataNode1,DataNode2,DataNode3,DataNode4}; 
do azure vm start -g HadoopGroup -n $m; 
done
