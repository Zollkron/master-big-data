#!/bin/bash
for m in {DataNode4,DataNode3,DataNode2,DataNode1,CheckPointNode,NameNode}; 
do azure vm deallocate -g HadoopGroup -n $m; 
done
