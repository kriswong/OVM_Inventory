## Set of Cmd useful to understand the topology and details for Oracle policies
## Get  thread/core/socket topology info for the host
xenpm get-cpu-topology
## Example
# xenpm get-cpu-topology
#CPU     core    socket  node
#CPU0     0       0       0
#CPU1     0       0       0
#CPU2     1       0       0
#CPU3     1       0       0
# This helps to establish cpu association to pCores
# On intel chips it also helps to confirm Hyper-Threading is enabled or disabled

xm info
##Example
# xm info
#nr_cpus                : 12
#nr_nodes               : 1
#cores_per_socket       : 6
#threads_per_core       : 2
# This help you understand the full scope of the host server
# In this example there is 1 socket, 6 pCores, and 12 threads.
# Thus each CPU = 1 Thread in this example and if you run CPUQ, that is the conjtext needed

xm list
##Example
# xm list
#Name                                        ID   Mem VCPUs      State   Time(s)
#0004fb00000600003a6acd33269210a4            14 20003     8     -b----  28241.3
#0004fb0000060000cff0a9dcd88d8a8f            13 20003     8     r-----   5197.5
#Domain-0                                     0  1973    20     r-----  64202.2
# This list all the domains on the host which are usually assocaited with one or more guest VMs

xm vcpu-list
## Example
# xm vcpu-list
#Name 								ID	VCPU	CPU	State	Time(s)	CPU Affinity
#0004fb0000060000524f9d3e43fd71f3 	4 	0		1	-b-		70.9	0-1
#0004fb0000060000524f9d3e43fd71f3 	4	1		0	-b-		22.5	0-1
#Domain-0 0 0 1 -b- 255.5 any cpu
#Domain-0 0 1 3 -b- 385.1 any cpu
#Domain-0 0 2 2 -b- 237.5 any cpu
#Domain-0 0 3 0 r-- 335.8 any cpu
# This list the domains and the associated CPU affinity
# Remeber that CPU maybe = thread or core depending on the findins os XM info
# If domains are "hard-partitioned" then they will have CPU affinity set to specific CPUIDs
# If this is not the case, then consider the OVM as softparitioned