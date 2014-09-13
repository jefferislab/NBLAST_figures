# NBLAST a trace against Fly Circuit neurons
# Code used for demo video:
# NBLAST: How to find the most similar FlyCircuit neurons to a GAL4 tracing

source("R/StartUp.R")
# using the tracing of a Janelia GAL4 line (R18C12) made in Vaa3D

# read  neuron
R18C12=read.neuron(file.choose()) # /GD/LMBD/Papers/2012NBlast/R/R18C12_voxdims.am
# transform to FCWB
R18C12.FCWB=xform_brain(R18C12,sample=JFRC2, ref=FCWB)

# plot the tracing
nopen3d()
plot3d(FCWB)
plot3d(R18C12.FCWB,lwd=2,col='black')

# load dpscanon
dpscanon=read.neurons(dps)

# blast the trace against the FC neurons
R18C12.fc.sc.norm=nblast(dotprops(R18C12.FCWB,resample=1, k=5), normalised=T, target=dpscanon)

# collect top tree hits
R18C12.fc.sc.norm.top3=dps[names(sort(R18C12.fc.sc.norm, dec=T))[1:3]]

# plot top 3 hits
clear3d()
plot3d(FCWB)
plot3d(R18C12.FCWB, col='black')
plot3d(R18C12.fc.sc.norm.top3, soma=T)
