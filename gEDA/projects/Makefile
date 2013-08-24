PROJ=voltdiv
NTLST=gnetlist
BACKEND=spice-sdb
SIMLTR=ngspice
WAVEV=gaw
SCH=$(shell ls $(PROJ)/*.sch)
NET=$(SCH:.sch=.net)
RAW=$(SCH:.sch=.raw)
LOG=$(SCH:.sch=.log)
CMD=

.PHONY: wave sim clean

$(NET): $(SCH)
	$(NTLST) -g $(BACKEND) -o $(NET) $(SCH)
ifneq ($(CMD),)
	sed -i 's/\.end/.$(CMD)\n.end/' $(NET)
endif

wave: sim
	$(WAVEV) $(RAW) 

sim: $(NET)
	$(SIMLTR) -b $(NET) -r $(RAW) -o $(LOG)

clean:
	rm -rf *.net
	rm -rf *.log
	rm -rf *.raw
