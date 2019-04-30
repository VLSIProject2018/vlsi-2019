#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Wed Feb 27 12:17:20 2019                #
#                                                     #
#######################################################

#@(#)CDS: Encounter v10.12-s181_1 (32bit) 07/28/2011 22:56 (Linux 2.6)
#@(#)CDS: NanoRoute v10.12-s010 NR110720-1815/10_10_USR2-UB (database version 2.30, 124.2.1) {superthreading v1.15}
#@(#)CDS: CeltIC v10.12-s013_1 (32bit) 07/27/2011 04:13:10 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: AAE 10.12-s001 (32bit) 07/28/2011 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: CTE 10.12-s010_1 (32bit) Jul 18 2011 23:05:29 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: CPE v10.12-s007

win
setUIVar rda_Input ui_gndnet VSS
setUIVar rda_Input ui_leffile muddlib.lef
setUIVar rda_Input ui_netlist controller_synth_syn.v
setUIVar rda_Input ui_topcell controller_synth
setUIVar rda_Input ui_pwrnet VDD
commitConfig
fit
setDrawView fplan
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core -r 0.894039735099 0.699779 30 30 30 30
uiSetTool select
getIoFlowFlag
fit
saveDesign controller_synth_floorplan.enc
addRing -spacing_bottom 1.8 -width_left 9.9 -width_bottom 9.9 -width_top 9.9 -spacing_top 1.8 -layer_bottom metal1 -center 1 -stacked_via_top_layer metal3 -width_right 9.9 -around core -jog_distance 1.5 -offset_bottom 1.5 -layer_top metal1 -threshold 1.5 -offset_left 1.5 -spacing_right 1.8 -spacing_left 1.8 -offset_right 1.5 -offset_top 1.5 -layer_right metal2 -stacked_via_bottom_layer metal1 -layer_left metal2
sroute -connect { blockPin padPin padRing corePin } -layerChangeRange { metal1 metal3 } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer metal1 -allowLayerChange 1 -targetViaTopLayer metal3 -crossoverViaTopLayer metal3 -targetViaBottomLayer metal1
saveDesign controller_synth_powerRings.enc
setPlaceMode -fp false
placeDesign -noPrePlaceOpt
setDrawView place
saveDesign controller_synth_cellsPlaced.enc
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
getFillerMode -quiet
addFiller -cell fill_1_wide -prefix FILLER
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -viaOverlap false -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000 -warning 50
verifyGeometry
verifyConnectivity -type all -error 1000 -warning 50
saveDesign controller_synth_final.enc
global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.5
defOut -floorplan -netlist -routing controller_synth.def
set dbgLefDefOutVersion NULL
