# Diving between unilateral VPNs, bilateral VPNs and optic lobe neurons.
# Common code to several figures that use the VPN, optic lobe and central brain neurons.

clusterp0=as.data.frame(apres16k.p0)

# Collecting OL neurons
# Dividing all exemplars between central brain neurons (cb neurons) and optic lobe ones, k=3:
ex <- names(apres16k.p0@exemplars)
AP_score_mat <- load_si_data("AP_score_mat.rds")
exemhc <- hclustfc(ex, scoremat=AP_score_mat)
exemhc$height <- sqrt(exemhc$height)
exemhcd <- colour_clusters(exemhc, k=3, groupLabels=c("A", "B", "C"))
labels(exemhcd) <- NULL

# Selecting a few neurons from central brain group that were OL.
exol <- subset(exemhc, k=3, groups=1)
olneuron <- c("FruMARCM-F000057_seg001", "TPHMARCM-F001806_seg001")
olneuron2 <- c("THMARCM-466F_seg2", "DvGlutMARCM-F003807_seg001", "DvGlutMARCM-F002964_seg001", "FruMARCM-F001388_seg001")
olneuron3 <- c("TPHMARCM-1126M_seg1", "TPHMARCM-1098F_seg1", "DvGlutMARCM-F1088_seg1")
olneuron4 <- c("DvGlutMARCM-F004312_seg001", "FruMARCM-M002003_seg001")
olextra <- c(olneuron, olneuron2, olneuron3, olneuron4)
exol <- c(exol, olextra)
oln <- subset(clusterp0, exemplar %in% exol)$item

# Divide optic lobe neurons into VPNs and intrinsic.
# Define optic lobe neuropils
oll <- c("LO_L", "LOP_L", "ME_L", "AME_L")
olr <- c("LO_R", "LOP_R", "ME_R", "AME_R")
ol <- c(oll, olr)
allneuropils <- getRegionsFromSurf(FCWBNP.surf)
centralbrain <- setdiff(allneuropils, c(oll, olr))
x <- subset(spatdist_jfrc, rownames(spatdist_jfrc) %in% oln)
vpns <- rownames(x)[rowSums(x[, centralbrain]) > 2]
inol <- setdiff(oln, vpns)

# Remove bilateral neurons: neurons with innervation in both left and right OL (LO, LOP, ME and AME).
# There will still be contralateral neurons that have innervation in the right OL.
x2 <- subset(spatdist_jfrc, rownames(spatdist_jfrc) %in% vpns)
bilvpns <- rownames(x2)[rowSums(x2[, olr]) > 2 & rowSums(x2[, oll]) > 2]
uvpns <- setdiff(vpns, bilvpns)

#Collect central brain neurons: groups 2 and 3
excb <- subset(exemhc, k=3, groups=c(2, 3))
excb <- setdiff(excb, olextra)
