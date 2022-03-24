  
quietly xtreg LFDI LGDP Open Infl Totaltaxr mobsub CPI,fe
estimates store CPIFE
quietly xtreg LFDI LGDP Open Infl Totaltaxr mobsub CPI,re
estimates store CPIRE
quietly xtreg LFDI LGDP Open Infl Totaltaxr mobsub ContofCorrupt ,fe
estimates store ContofCorruptFE
quietly xtreg LFDI LGDP Open Infl Totaltaxr mobsub ContofCorrupt ,re
estimates store ContofCorruptRE
quietly xtreg LFDI LGDP Open Infl Totaltaxr mobsub ruleoflaw ,fe
estimates store  ruleoflawFE
quietly xtreg LFDI LGDP Open Infl Totaltaxr mobsub ruleoflaw ,re
estimates store  ruleoflawRE
quietly xtreg LFDI LGDP Open Infl Totaltaxr mobsub PolStab ,fe
estimates store PolStabFE
quietly xtreg LFDI LGDP Open Infl Totaltaxr mobsub PolStab ,re
estimates store PolStabRE
outreg2 [CPIRE* ContofCorruptRE* ruleoflawRE* PolStabRE* ] using REresults.doc, replace stats(coef pval)
outreg2 [CPIFE* ContofCorruptFE* ruleoflawFE* PolStabFE* ] using FEresults.doc, append stats(coef pval)
outreg2 [CPIFE* ContofCorruptFE* ruleoflawFE* PolStabFE* ] using FEresults.doc, replace stats(coef pval)
quietly xtdpdsys LFDI LGDP Open Infl Totaltaxr mobsub CPI, lags(1) artests(2)
estimates store CPIGMM
quietly xtdpdsys LFDI LGDP Open Infl Totaltaxr mobsub ContofCorrupt , lags(1) artests(2)
estimates store ContofCorruptGMM
quietly xtdpdsys LFDI LGDP Open Infl Totaltaxr mobsub ruleoflaw , lags(1) artests(2)
estimates store ruleoflawGMM
quietly xtdpdsys LFDI LGDP Open Infl Totaltaxr mobsub PolStab, lags(1) artests(2)
estimates store PolStabGMM
outreg2 [CPIGMM* ContofCorruptGMM* ruleoflawGMM* PolStabGMM* ] using GMMresults.doc, replace stats(coef pval)
asdoc summarize LFDI LGDP Open Infl Totaltaxr mobsub CPI ruleoflaw PolStab ContofCorrupt,

outreg2 [CPIGMM* ContofCorruptGMM* ruleoflawGMM* PolStabGMM* ] using GMMresults.doc, replace stats(coef pval)
