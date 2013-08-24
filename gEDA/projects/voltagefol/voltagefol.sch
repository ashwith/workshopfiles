v 20121123 2
C 47000 46100 1 0 0 LM741.sym
{
T 47200 47200 5 10 0 0 0 0 1
footprint=SO8
T 47000 47000 5 10 1 1 0 0 1
refdes=X2
T 47800 46900 5 10 1 1 0 0 1
device=LM741
T 47000 46100 5 10 0 1 0 0 1
model-name=LM741
}
C 45800 46700 1 270 0 voltage-3.sym
{
T 46500 46500 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 46300 46200 5 10 1 1 0 0 1
refdes=V1
T 44500 45900 5 10 1 1 0 0 1
value=AC SIN(0 5 10K)
}
N 46000 46700 47000 46700 4
{
T 46000 46700 5 10 1 1 0 0 1
netname=input
}
N 47000 46300 47000 45500 4
N 47000 45500 48200 45500 4
N 48200 45500 48200 46500 4
{
T 48200 46500 5 10 1 1 0 0 1
netname=output
}
N 48200 46500 48000 46500 4
C 45900 45300 1 0 0 gnd-1.sym
C 48800 46500 1 270 0 voltage-3.sym
{
T 49500 46300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 49200 46000 5 10 1 1 0 0 1
refdes=V2
T 49200 45800 5 10 1 1 0 0 1
value=15
}
C 49800 46500 1 270 0 voltage-3.sym
{
T 50500 46300 5 8 0 0 270 0 1
device=VOLTAGE_SOURCE
T 50200 46000 5 10 1 1 0 0 1
refdes=V3
T 50200 45800 5 10 1 1 0 0 1
value=-15
}
C 49900 45300 1 0 0 gnd-1.sym
C 48900 45300 1 0 0 gnd-1.sym
C 48800 46500 1 0 0 vcc-1.sym
C 47300 46900 1 0 0 vcc-1.sym
C 47700 46100 1 180 0 vee-1.sym
C 49800 46500 1 0 0 vee-1.sym
N 46000 45600 46000 45800 4
C 46000 47500 1 0 0 spice-model-1.sym
{
T 46100 48200 5 10 0 1 0 0 1
device=model
T 46100 48100 5 10 1 1 0 0 1
refdes=A1
T 47300 47800 5 10 1 1 0 0 1
model-name=LM741
T 46500 47600 5 10 1 1 0 0 1
file=../../models/LM741.mod
}