within AixLib.Building.BatteryModel;
model BatteryRoom
  "Thermal model of a room, which contains racks of (different) battery types"

public
   parameter Integer nBatRacks=6
   "Number of battery racks installed in the battery room" annotation (Dialog(
      descriptionLabel=true), choices(
      choice=1 "1",
      choice=2 "2",
      choice=3 "3",
      choice=4 "4",
      choice=5 "5",
      choice=6 "6",
      choice=7 "7",
      choice=8 "8",
      choice=9 "9",
      choice=10 "10",
      radioButtons = true), choicesAllMatching = true);
   parameter Integer nBatTypes=1
   "How many different battery types are installed in the room?"
      annotation (Dialog(
      descriptionLabel=true), choices(
      choice=1 "1",
      choice=2 "2",
      radioButtons = true), choicesAllMatching = true);

   parameter Boolean batType1 = true
   "Battery type of rack 1" annotation (Dialog(
      tab="Battery Rack Types", descriptionLabel=true), choices(
      choice=true "Type 1",
      choice=false "Type 2",
      radioButtons = true), choicesAllMatching = true);
   parameter Boolean batType2 = true
   "Battery type of rack 2" annotation (Dialog(
      tab="Battery Rack Types", descriptionLabel=true), choices(
      choice=true "Type 1",
      choice=false "Type 2",
      radioButtons = true), choicesAllMatching = true);
   parameter Boolean batType3 = true
   "Battery type of rack 3" annotation (Dialog(
      tab="Battery Rack Types", descriptionLabel=true), choices(
      choice=true "Type 1",
      choice=false "Type 2",
      radioButtons = true), choicesAllMatching = true);
   parameter Boolean batType4 = true
   "Battery type of rack 4" annotation (Dialog(
      tab="Battery Rack Types", descriptionLabel=true), choices(
      choice=true "Type 1",
      choice=false "Type 2",
      radioButtons = true), choicesAllMatching = true);
   parameter Boolean batType5 = true
   "Battery type of rack 5" annotation (Dialog(
      tab="Battery Rack Types", descriptionLabel=true), choices(
      choice=true "Type 1",
      choice=false "Type 2",
      radioButtons = true), choicesAllMatching = true);
   parameter Boolean batType6 = true
   "Battery type of rack 6" annotation (Dialog(
      tab="Battery Rack Types", descriptionLabel=true), choices(
      choice=true "Type 1",
      choice=false "Type 2",
      radioButtons = true), choicesAllMatching = true);
   parameter Boolean batType7 = true
   "Battery type of rack 7" annotation (Dialog(
      tab="Battery Rack Types", descriptionLabel=true), choices(
      choice=true "Type 1",
      choice=false "Type 2",
      radioButtons = true), choicesAllMatching = true);
   parameter Boolean batType8 = true
   "Battery type of rack 8" annotation (Dialog(
      tab="Battery Rack Types", descriptionLabel=true), choices(
      choice=true "Type 1",
      choice=false "Type 2",
      radioButtons = true), choicesAllMatching = true);
   parameter Boolean batType9 = true
   "Battery type of rack 9" annotation (Dialog(
      tab="Battery Rack Types", descriptionLabel=true), choices(
      choice=true "Type 1",
      choice=false "Type 2",
      radioButtons = true), choicesAllMatching = true);
   parameter Boolean batType10 = true
   "Battery type of rack 10" annotation (Dialog(
      tab="Battery Rack Types", descriptionLabel=true), choices(
      choice=true "Type 1",
      choice=false "Type 2",
      radioButtons = true), choicesAllMatching = true);

   parameter AixLib.DataBase.Batteries.RackBaseDataDefinition
    rackParameters[10]=
     {AixLib.DataBase.Batteries.RackBaseDataDefinition(
      batType=AixLib.DataBase.Batteries.LeadBattery1(),
      nParallels=0,
      nSeries=0,
      nStacked=0,
      airBetweenStacks=false,
      batArrangement=true,
      areaStandingAtWall=0),AixLib.DataBase.Batteries.RackBaseDataDefinition(
      batType=AixLib.DataBase.Batteries.LeadBattery1(),
      nParallels=0,
      nSeries=0,
      nStacked=0,
      airBetweenStacks=false,
      batArrangement=true,
      areaStandingAtWall=0),AixLib.DataBase.Batteries.RackBaseDataDefinition(
      batType=AixLib.DataBase.Batteries.LeadBattery1(),
      nParallels=0,
      nSeries=0,
      nStacked=0,
      airBetweenStacks=false,
      batArrangement=true,
      areaStandingAtWall=0),AixLib.DataBase.Batteries.RackBaseDataDefinition(
      batType=AixLib.DataBase.Batteries.LeadBattery1(),
      nParallels=0,
      nSeries=0,
      nStacked=0,
      airBetweenStacks=false,
      batArrangement=true,
      areaStandingAtWall=0),AixLib.DataBase.Batteries.RackBaseDataDefinition(
      batType=AixLib.DataBase.Batteries.LeadBattery1(),
      nParallels=0,
      nSeries=0,
      nStacked=0,
      airBetweenStacks=false,
      batArrangement=true,
      areaStandingAtWall=0),AixLib.DataBase.Batteries.RackBaseDataDefinition(
      batType=AixLib.DataBase.Batteries.LeadBattery1(),
      nParallels=0,
      nSeries=0,
      nStacked=0,
      airBetweenStacks=false,
      batArrangement=true,
      areaStandingAtWall=0),AixLib.DataBase.Batteries.RackBaseDataDefinition(
      batType=AixLib.DataBase.Batteries.LeadBattery1(),
      nParallels=0,
      nSeries=0,
      nStacked=0,
      airBetweenStacks=false,
      batArrangement=true,
      areaStandingAtWall=0),AixLib.DataBase.Batteries.RackBaseDataDefinition(
      batType=AixLib.DataBase.Batteries.LeadBattery1(),
      nParallels=0,
      nSeries=0,
      nStacked=0,
      airBetweenStacks=false,
      batArrangement=true,
      areaStandingAtWall=0),AixLib.DataBase.Batteries.RackBaseDataDefinition(
      batType=AixLib.DataBase.Batteries.LeadBattery1(),
      nParallels=0,
      nSeries=0,
      nStacked=0,
      airBetweenStacks=false,
      batArrangement=true,
      areaStandingAtWall=0),AixLib.DataBase.Batteries.RackBaseDataDefinition(
      batType=AixLib.DataBase.Batteries.LeadBattery1(),
      nParallels=0,
      nSeries=0,
      nStacked=0,
      airBetweenStacks=false,
      batArrangement=true,
      areaStandingAtWall=0)} "Parameters for the different battery racks";

  Modelica.Blocks.Interfaces.RealInput ThermalLossBat1
    "Thermal Loss of the first battery type - from external file"
    annotation (Placement(transformation(extent={{-254,64},{-182,136}}),
        iconTransformation(extent={{-200,40},{-120,120}})));
  Modelica.Blocks.Interfaces.RealInput ThermalLossBat2 if nBatTypes == 2
    "Thermal Loss of the second battery type - from external file"
    annotation (Placement(transformation(extent={{-254,-136},{-182,-64}}),
        iconTransformation(extent={{-200,-120},{-120,-40}})));

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b PortConv
    "Port for the output of convection heat"
    annotation (Placement(transformation(extent={{172,-88},{228,-32}}),
        iconTransformation(extent={{162,-58},{198,-22}})));
  Utilities.Interfaces.Star Star
    "Port for the output of radiation heat"
    annotation (Placement(transformation(extent={{178,40},{224,80}}),
        iconTransformation(extent={{160,20},{200,60}})));

  Modelica.Blocks.Interfaces.RealOutput TemperatureBat1(
      quantity="ThermodynamicTemperature",
      unit="K",
      displayUnit="degC")
    "Temperature of the first battery type"
    annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={120,210}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,180})));
  Modelica.Blocks.Interfaces.RealOutput TemperatureBat2(
      quantity="ThermodynamicTemperature",
      unit="K",
      displayUnit="degC") if nBatTypes == 2
    "Temperature of the second battery type"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={160,210}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={120,180})));

  BatteryRack BatteryRack1(
    batType=rackParameters[1].batType,
    nParallels=rackParameters[1].nParallels,
    nSeries=rackParameters[1].nSeries,
    nStacked=rackParameters[1].nStacked,
    airBetweenStacks=rackParameters[1].airBetweenStacks,
    batArrangement=rackParameters[1].batArrangement,
    areaStandingAtWall=rackParameters[1].areaStandingAtWall)
    annotation (Placement(transformation(extent={{20,180},{40,200}})));
  BatteryRack BatteryRack2(
    batType=rackParameters[2].batType,
    nParallels=rackParameters[2].nParallels,
    nSeries=rackParameters[2].nSeries,
    nStacked=rackParameters[2].nStacked,
    airBetweenStacks=rackParameters[2].airBetweenStacks,
    batArrangement=rackParameters[2].batArrangement,
    areaStandingAtWall=rackParameters[2].areaStandingAtWall) if nBatRacks > 1
    annotation (Placement(transformation(extent={{20,140},{40,160}})));
  BatteryRack BatteryRack3(
    batType=rackParameters[3].batType,
    nParallels=rackParameters[3].nParallels,
    nSeries=rackParameters[3].nSeries,
    nStacked=rackParameters[3].nStacked,
    airBetweenStacks=rackParameters[3].airBetweenStacks,
    batArrangement=rackParameters[3].batArrangement,
    areaStandingAtWall=rackParameters[3].areaStandingAtWall) if nBatRacks > 2
    annotation (Placement(transformation(extent={{20,100},{40,120}})));
  BatteryRack BatteryRack4(
    batType=rackParameters[4].batType,
    nParallels=rackParameters[4].nParallels,
    nSeries=rackParameters[4].nSeries,
    nStacked=rackParameters[4].nStacked,
    airBetweenStacks=rackParameters[4].airBetweenStacks,
    batArrangement=rackParameters[4].batArrangement,
    areaStandingAtWall=rackParameters[4].areaStandingAtWall) if nBatRacks > 3
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  BatteryRack BatteryRack5(
    batType=rackParameters[5].batType,
    nParallels=rackParameters[5].nParallels,
    nSeries=rackParameters[5].nSeries,
    nStacked=rackParameters[5].nStacked,
    airBetweenStacks=rackParameters[5].airBetweenStacks,
    batArrangement=rackParameters[5].batArrangement,
    areaStandingAtWall=rackParameters[5].areaStandingAtWall) if nBatRacks > 4
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  BatteryRack BatteryRack6(
    batType=rackParameters[6].batType,
    nParallels=rackParameters[6].nParallels,
    nSeries=rackParameters[6].nSeries,
    nStacked=rackParameters[6].nStacked,
    airBetweenStacks=rackParameters[6].airBetweenStacks,
    batArrangement=rackParameters[6].batArrangement,
    areaStandingAtWall=rackParameters[6].areaStandingAtWall) if nBatRacks > 5
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  BatteryRack BatteryRack7(
    batType=rackParameters[7].batType,
    nParallels=rackParameters[7].nParallels,
    nSeries=rackParameters[7].nSeries,
    nStacked=rackParameters[7].nStacked,
    airBetweenStacks=rackParameters[7].airBetweenStacks,
    batArrangement=rackParameters[7].batArrangement,
    areaStandingAtWall=rackParameters[7].areaStandingAtWall) if nBatRacks > 6
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  BatteryRack BatteryRack8(
    batType=rackParameters[8].batType,
    nParallels=rackParameters[8].nParallels,
    nSeries=rackParameters[8].nSeries,
    nStacked=rackParameters[8].nStacked,
    airBetweenStacks=rackParameters[8].airBetweenStacks,
    batArrangement=rackParameters[8].batArrangement,
    areaStandingAtWall=rackParameters[8].areaStandingAtWall) if nBatRacks > 7
    annotation (Placement(transformation(extent={{20,-120},{40,-100}})));
  BatteryRack BatteryRack9(
    batType=rackParameters[9].batType,
    nParallels=rackParameters[9].nParallels,
    nSeries=rackParameters[9].nSeries,
    nStacked=rackParameters[9].nStacked,
    airBetweenStacks=rackParameters[9].airBetweenStacks,
    batArrangement=rackParameters[9].batArrangement,
    areaStandingAtWall=rackParameters[9].areaStandingAtWall) if nBatRacks > 8
    annotation (Placement(transformation(extent={{20,-160},{40,-140}})));
  BatteryRack BatteryRack10(
    batType=rackParameters[10].batType,
    nParallels=rackParameters[10].nParallels,
    nSeries=rackParameters[10].nSeries,
    nStacked=rackParameters[10].nStacked,
    airBetweenStacks=rackParameters[10].airBetweenStacks,
    batArrangement=rackParameters[10].batArrangement,
    areaStandingAtWall=rackParameters[10].areaStandingAtWall) if nBatRacks > 9
    annotation (Placement(transformation(extent={{20,-200},{40,-180}})));

  Modelica.Blocks.Math.Gain LossFraction1(final k=listFractionFactors[1])
    annotation (Placement(transformation(extent={{-40,180},{-20,200}})));
  Modelica.Blocks.Math.Gain LossFraction2(final k=listFractionFactors[2]) if
       nBatRacks > 1
    annotation (Placement(transformation(extent={{-40,140},{-20,160}})));
  Modelica.Blocks.Math.Gain LossFraction3(final k=listFractionFactors[3]) if
       nBatRacks > 2
    annotation (Placement(transformation(extent={{-40,100},{-20,120}})));
  Modelica.Blocks.Math.Gain LossFraction4(final k=listFractionFactors[4]) if
       nBatRacks > 3
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Modelica.Blocks.Math.Gain LossFraction5(final k=listFractionFactors[5]) if
       nBatRacks > 4
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Math.Gain LossFraction6(final k=listFractionFactors[6]) if
       nBatRacks > 5
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Math.Gain LossFraction7(final k=listFractionFactors[7]) if
       nBatRacks > 6
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Modelica.Blocks.Math.Gain LossFraction8(final k=listFractionFactors[8]) if
       nBatRacks > 7
    annotation (Placement(transformation(extent={{-40,-120},{-20,-100}})));
  Modelica.Blocks.Math.Gain LossFraction9(final k=listFractionFactors[9]) if
       nBatRacks > 8
    annotation (Placement(transformation(extent={{-40,-160},{-20,-140}})));
  Modelica.Blocks.Math.Gain LossFraction10(final k=listFractionFactors[10]) if
       nBatRacks > 9
    annotation (Placement(transformation(extent={{-40,-200},{-20,-180}})));

  Modelica.Thermal.HeatTransfer.Components.ThermalCollector ConvCollector(
     final m=nBatRacks)
    "Collects the convection heat of the different racks"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={114,-60})));
  Utilities.Interfaces.ThermalRadiationCollector RadCollector(
     final m=nBatRacks)
    "Collects the radiation heat of the different racks"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={114,60})));

  Modelica.Blocks.Logical.Switch LossSwitch1
    annotation (Placement(transformation(extent={{-80,180},{-60,200}})));
  Modelica.Blocks.Logical.Switch LossSwitch2 if nBatRacks > 1
    annotation (Placement(transformation(extent={{-80,140},{-60,160}})));
  Modelica.Blocks.Logical.Switch LossSwitch3 if nBatRacks > 2
    annotation (Placement(transformation(extent={{-80,100},{-60,120}})));
  Modelica.Blocks.Logical.Switch LossSwitch4 if nBatRacks > 3
    annotation (Placement(transformation(extent={{-78,60},{-58,80}})));
  Modelica.Blocks.Logical.Switch LossSwitch5 if nBatRacks > 4
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Logical.Switch LossSwitch6 if nBatRacks > 5
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Modelica.Blocks.Logical.Switch LossSwitch7 if nBatRacks > 6
    annotation (Placement(transformation(extent={{-78,-80},{-58,-60}})));
  Modelica.Blocks.Logical.Switch LossSwitch8 if nBatRacks > 7
    annotation (Placement(transformation(extent={{-80,-120},{-60,-100}})));
  Modelica.Blocks.Logical.Switch LossSwitch9 if nBatRacks > 8
    annotation (Placement(transformation(extent={{-80,-160},{-60,-140}})));
  Modelica.Blocks.Logical.Switch LossSwitch10 if nBatRacks > 9
    annotation (Placement(transformation(extent={{-80,-200},{-60,-180}})));

  Modelica.Blocks.Sources.RealExpression Zero1(y=0) if
       nBatTypes == 1
    annotation (Placement(transformation(extent={{-94,166},{-88,182}})));
  Modelica.Blocks.Sources.RealExpression Zero2(y=0) if
       nBatTypes == 1 and nBatRacks > 1
    annotation (Placement(transformation(extent={{-94,126},{-88,142}})));
  Modelica.Blocks.Sources.RealExpression Zero3(y=0) if
       nBatTypes == 1 and nBatRacks > 2
    annotation (Placement(transformation(extent={{-94,86},{-88,102}})));
  Modelica.Blocks.Sources.RealExpression Zero4(y=0) if
       nBatTypes == 1 and nBatRacks > 3
    annotation (Placement(transformation(extent={{-94,44},{-88,60}})));
  Modelica.Blocks.Sources.RealExpression Zero5(y=0) if
       nBatTypes == 1 and nBatRacks > 4
    annotation (Placement(transformation(extent={{-94,4},{-88,20}})));
  Modelica.Blocks.Sources.RealExpression Zero6(y=0) if
       nBatTypes == 1 and nBatRacks > 5
    annotation (Placement(transformation(extent={{-94,-54},{-88,-38}})));
  Modelica.Blocks.Sources.RealExpression Zero7(y=0) if
       nBatTypes == 1 and nBatRacks > 6
    annotation (Placement(transformation(extent={{-94,-94},{-88,-78}})));
  Modelica.Blocks.Sources.RealExpression Zero8(y=0) if
       nBatTypes == 1 and nBatRacks > 7
    annotation (Placement(transformation(extent={{-94,-134},{-88,-118}})));
  Modelica.Blocks.Sources.RealExpression Zero9(y=0) if
       nBatTypes == 1 and nBatRacks > 8
    annotation (Placement(transformation(extent={{-94,-176},{-88,-160}})));
  Modelica.Blocks.Sources.RealExpression Zero10(y=0) if
       nBatTypes == 1 and nBatRacks > 9
    annotation (Placement(transformation(extent={{-94,-212},{-88,-196}})));

  Modelica.Blocks.Sources.BooleanExpression BatteryType1(y=batType1)
    annotation (Placement(transformation(extent={{-128,180},{-104,200}})));
  Modelica.Blocks.Sources.BooleanExpression BatteryType2(y=batType2) if
       nBatRacks > 1
    annotation (Placement(transformation(extent={{-128,140},{-104,160}})));
  Modelica.Blocks.Sources.BooleanExpression BatteryType3(y=batType3) if
       nBatRacks > 2
    annotation (Placement(transformation(extent={{-128,100},{-104,120}})));
  Modelica.Blocks.Sources.BooleanExpression BatteryType4(y=batType4) if
       nBatRacks > 3
    annotation (Placement(transformation(extent={{-128,60},{-104,80}})));
  Modelica.Blocks.Sources.BooleanExpression BatteryType5(y=batType5) if
       nBatRacks > 4
    annotation (Placement(transformation(extent={{-130,20},{-106,40}})));
  Modelica.Blocks.Sources.BooleanExpression BatteryType6(y=batType6) if
       nBatRacks > 5
    annotation (Placement(transformation(extent={{-130,-40},{-106,-20}})));
  Modelica.Blocks.Sources.BooleanExpression BatteryType7(y=batType7) if
       nBatRacks > 6
    annotation (Placement(transformation(extent={{-130,-80},{-106,-60}})));
  Modelica.Blocks.Sources.BooleanExpression BatteryType8(y=batType8) if
       nBatRacks > 7
    annotation (Placement(transformation(extent={{-130,-120},{-106,-100}})));
  Modelica.Blocks.Sources.BooleanExpression BatteryType9(y=batType9) if
       nBatRacks > 8
    annotation (Placement(transformation(extent={{-132,-160},{-108,-140}})));
  Modelica.Blocks.Sources.BooleanExpression BatteryType10(y=batType10) if
       nBatRacks > 9
    annotation (Placement(transformation(extent={{-132,-200},{-108,-180}})));

protected
  parameter Boolean listBatTypes[10]=
    {batType1, batType2, batType3, batType4, batType5,
     batType6, batType7, batType8, batType9, batType10}
     "List for the different battery types";
  parameter Integer listNBats[nBatRacks]=
    {if nBatRacks >= i
     then rackParameters[i].nParallels * rackParameters[i].nSeries *
          rackParameters[i].nStacked
     else 0
     for i in 1:nBatRacks}
    "List for the different number of batteries per rack";
  parameter Integer sumBatsType1=
    sum({if listBatTypes[i] == true
         then listNBats[i]
         else 0
         for i in 1:nBatRacks})
    "Sum of installed batteries from type 1";
  parameter Integer sumBatsType2=
    sum({if listBatTypes[i] == false
         then listNBats[i]
         else 0
         for i in 1:nBatRacks})
    "Sum of installed batteries from type 2";
  parameter Real listFractionFactors[nBatRacks]=
    {if listBatTypes[i] == true
     then listNBats[i] / sumBatsType1
     else listNBats[i] / sumBatsType2
     for i in 1:nBatRacks}
     "List of the fraction factors for the racks";

equation

  connect(LossFraction1.y, BatteryRack1.ThermalLoss)
    annotation (Line(points={{-19,190},{20,190}}, color={0,0,127}));
  connect(LossFraction2.y, BatteryRack2.ThermalLoss)
    annotation (Line(points={{-19,150},{20,150}}, color={0,0,127}));
  connect(LossFraction3.y, BatteryRack3.ThermalLoss)
    annotation (Line(points={{-19,110},{20,110}}, color={0,0,127}));
  connect(LossFraction4.y, BatteryRack4.ThermalLoss)
    annotation (Line(points={{-19,70},{20,70}}, color={0,0,127}));
  connect(LossFraction5.y, BatteryRack5.ThermalLoss)
    annotation (Line(points={{-19,30},{20,30}}, color={0,0,127}));
  connect(LossFraction6.y, BatteryRack6.ThermalLoss)
    annotation (Line(points={{-19,-30},{20,-30}}, color={0,0,127}));
  connect(LossFraction7.y, BatteryRack7.ThermalLoss)
    annotation (Line(points={{-19,-70},{20,-70}}, color={0,0,127}));
  connect(LossFraction8.y, BatteryRack8.ThermalLoss)
    annotation (Line(points={{-19,-110},{20,-110}}, color={0,0,127}));
  connect(LossFraction9.y, BatteryRack9.ThermalLoss)
    annotation (Line(points={{-19,-150},{20,-150}}, color={0,0,127}));
  connect(LossFraction10.y, BatteryRack10.ThermalLoss)
    annotation (Line(points={{-19,-190},{20,-190}}, color={0,0,127}));
  connect(BatteryRack1.PortConv, ConvCollector.port_a[1])
    annotation (Line(points={{40,186},{60,186},{60,-60},{94,-60}},
                color={191,0,0}));
  connect(BatteryRack2.PortConv, ConvCollector.port_a[2])
    annotation (Line(points={{40,146},{60,146},{60,-60},{94,-60}},
                color={191,0,0}));
  connect(BatteryRack3.PortConv, ConvCollector.port_a[3])
    annotation (Line(points={{40,106},{60,106},{60,-60},{94,-60}},
                color={191,0,0}));
  connect(BatteryRack4.PortConv, ConvCollector.port_a[4])
    annotation (Line(points={{40,66},{60,66},{60,-60},{94,-60}},
                color={191,0,0}));
  connect(BatteryRack5.PortConv, ConvCollector.port_a[5])
    annotation (Line(points={{40,26},{60,26},{60,-60},{94,-60}},
                color={191,0,0}));
  connect(BatteryRack6.PortConv, ConvCollector.port_a[6])
    annotation (Line(points={{40,-34},{60,-34},{60,-60},{94,-60}},
                color={191,0,0}));
  connect(BatteryRack7.PortConv, ConvCollector.port_a[7])
    annotation (Line(points={{40,-74},{60,-74},{60,-60},{94,-60}},
                color={191,0,0}));
  connect(BatteryRack8.PortConv, ConvCollector.port_a[8])
    annotation (Line(points={{40,-114},{60,-114},{60,-60},{94,-60}},
                color={191,0,0}));
  connect(BatteryRack9.PortConv, ConvCollector.port_a[9])
    annotation (Line(points={{40,-154},{60,-154},{60,-60},{94,-60}},
                color={191,0,0}));
  connect(BatteryRack10.PortConv, ConvCollector.port_a[10])
    annotation (Line(points={{40,-194},{60,-194},{60,-60},{94,-60}},
                color={191,0,0}));
  connect(LossSwitch1.y, LossFraction1.u)
    annotation (Line(points={{-59,190},{-42,190}}, color={0,0,127}));
  connect(LossSwitch2.y, LossFraction2.u)
    annotation (Line(points={{-59,150},{-42,150}}, color={0,0,127}));
  connect(LossSwitch3.y, LossFraction3.u)
    annotation (Line(points={{-59,110},{-42,110}}, color={0,0,127}));
  connect(LossSwitch4.y, LossFraction4.u)
    annotation (Line(points={{-57,70},{-42,70}}, color={0,0,127}));
  connect(LossSwitch5.y, LossFraction5.u)
    annotation (Line(points={{-59,30},{-42,30}}, color={0,0,127}));
  connect(LossSwitch6.y, LossFraction6.u)
    annotation (Line(points={{-59,-30},{-42,-30}}, color={0,0,127}));
  connect(LossSwitch7.y, LossFraction7.u)
    annotation (Line(points={{-57,-70},{-42,-70}}, color={0,0,127}));
  connect(LossSwitch8.y, LossFraction8.u)
    annotation (Line(points={{-59,-110},{-42,-110}}, color={0,0,127}));
  connect(LossSwitch9.y, LossFraction9.u)
    annotation (Line(points={{-59,-150},{-42,-150}}, color={0,0,127}));
  connect(LossSwitch10.y, LossFraction10.u)
    annotation (Line(points={{-59,-190},{-42,-190}}, color={0,0,127}));
  connect(Zero2.y, LossSwitch2.u3)
    annotation (Line(points={{-87.7,134},{-82,134},{-82,142}},
                color={0,0,127}));
  connect(Zero3.y, LossSwitch3.u3)
    annotation (Line(points={{-87.7,94},{-82,94},{-82,102}}, color={0,0,127}));
  connect(Zero4.y, LossSwitch4.u3)
    annotation (Line(points={{-87.7,52},{-80,52},{-80,62}}, color={0,0,127}));
  connect(Zero5.y, LossSwitch5.u3)
    annotation (Line(points={{-87.7,12},{-82,12},{-82,22}}, color={0,0,127}));
  connect(Zero6.y, LossSwitch6.u3)
    annotation (Line(points={{-87.7,-46},{-82,-46},{-82,-38}},
                color={0,0,127}));
  connect(Zero7.y, LossSwitch7.u3)
    annotation (Line(points={{-87.7,-86},{-80,-86},{-80,-78}},
                color={0,0,127}));
  connect(Zero8.y, LossSwitch8.u3)
    annotation (Line(points={{-87.7,-126},{-82,-126},{-82,-118}},
                color={0,0,127}));
  connect(Zero1.y, LossSwitch1.u3)
    annotation (Line(points={{-87.7,174},{-82,174},{-82,182}},
                color={0,0,127}));
  connect(Zero9.y, LossSwitch9.u3)
    annotation (Line(points={{-87.7,-168},{-82,-168},{-82,-158}},
                color={0,0,127}));
  connect(Zero10.y, LossSwitch10.u3)
    annotation (Line(points={{-87.7,-204},{-82,-204},{-82,-198}},
                color={0,0,127}));
  connect(BatteryType1.y, LossSwitch1.u2)
    annotation (Line(points={{-102.8,190},{-82,190}}, color={255,0,255}));
  connect(BatteryType2.y, LossSwitch2.u2)
    annotation (Line(points={{-102.8,150},{-82,150}}, color={255,0,255}));
  connect(BatteryType3.y, LossSwitch3.u2)
    annotation (Line(points={{-102.8,110},{-92,110},{-92,110},{-82,110}},
                color={255,0,255}));
  connect(BatteryType4.y, LossSwitch4.u2)
    annotation (Line(points={{-102.8,70},{-80,70}}, color={255,0,255}));
  connect(BatteryType5.y, LossSwitch5.u2)
    annotation (Line(points={{-104.8,30},{-82,30}}, color={255,0,255}));
  connect(BatteryType6.y, LossSwitch6.u2)
    annotation (Line(points={{-104.8,-30},{-82,-30}}, color={255,0,255}));
  connect(BatteryType7.y, LossSwitch7.u2)
    annotation (Line(points={{-104.8,-70},{-80,-70}}, color={255,0,255}));
  connect(BatteryType8.y, LossSwitch8.u2)
    annotation (Line(points={{-104.8,-110},{-82,-110}}, color={255,0,255}));
  connect(BatteryType9.y, LossSwitch9.u2)
    annotation (Line(points={{-106.8,-150},{-82,-150}}, color={255,0,255}));
  connect(BatteryType10.y, LossSwitch10.u2)
    annotation (Line(points={{-106.8,-190},{-82,-190}}, color={255,0,255}));
  connect(ThermalLossBat1, LossSwitch1.u1)
    annotation (Line(points={{-218,100},{-140,100},{-140,198},{-82,198}},
                color={0,0,127}));
  connect(ThermalLossBat1, LossSwitch2.u1)
    annotation (Line(points={{-218,100},{-140,100},{-140,158},{-82,158}},
                color={0,0,127}));
  connect(ThermalLossBat1, LossSwitch3.u1)
    annotation (Line(points={{-218,100},{-140,100},{-140,118},{-82,118}},
                color={0,0,127}));
  connect(ThermalLossBat1, LossSwitch4.u1)
    annotation (Line(points={{-218,100},{-140,100},{-140,78},{-80,78}},
                color={0,0,127}));
  connect(ThermalLossBat1, LossSwitch5.u1)
    annotation (Line(points={{-218,100},{-140,100},{-140,38},{-82,38}},
                color={0,0,127}));
  connect(ThermalLossBat1, LossSwitch6.u1)
    annotation (Line(points={{-218,100},{-140,100},{-140,-22},{-82,-22}},
                color={0,0,127}));
  connect(ThermalLossBat1, LossSwitch7.u1)
    annotation (Line(points={{-218,100},{-140,100},{-140,-62},{-80,-62}},
                color={0,0,127}));
  connect(ThermalLossBat1, LossSwitch8.u1)
    annotation (Line(points={{-218,100},{-140,100},{-140,-102},{-82,-102}},
                color={0,0,127}));
  connect(ThermalLossBat1, LossSwitch9.u1)
    annotation (Line(points={{-218,100},{-140,100},{-140,-142},{-82,-142}},
                color={0,0,127}));
  connect(ThermalLossBat1, LossSwitch10.u1)
    annotation (Line(points={{-218,100},{-140,100},{-140,-182},{-82,-182}},
                color={0,0,127}));
  connect(ThermalLossBat2, LossSwitch1.u3)
    annotation (Line(points={{-218,-100},{-160,-100},{-160,182},{-82,182}},
                color={0,0,127}));
  connect(ThermalLossBat2, LossSwitch2.u3)
    annotation (Line(points={{-218,-100},{-160,-100},{-160,142},{-82,142}},
                color={0,0,127}));
  connect(ThermalLossBat2, LossSwitch3.u3)
    annotation (Line(points={{-218,-100},{-160,-100},{-160,102},{-82,102}},
                color={0,0,127}));
  connect(ThermalLossBat2, LossSwitch4.u3)
    annotation (Line(points={{-218,-100},{-160,-100},{-160,62},{-80,62}},
                color={0,0,127}));
  connect(ThermalLossBat2, LossSwitch5.u3)
    annotation (Line(points={{-218,-100},{-160,-100},{-160,22},{-82,22}},
                color={0,0,127}));
  connect(ThermalLossBat2, LossSwitch6.u3)
    annotation (Line(points={{-218,-100},{-160,-100},{-160,-38},{-82,-38}},
                color={0,0,127}));
  connect(ThermalLossBat2, LossSwitch7.u3)
    annotation (Line(points={{-218,-100},{-160,-100},{-160,-78},{-80,-78}},
                color={0,0,127}));
  connect(ThermalLossBat2, LossSwitch8.u3)
    annotation (Line(points={{-218,-100},{-160,-100},{-160,-118},{-82,-118}},
                color={0,0,127}));
  connect(ThermalLossBat2, LossSwitch9.u3)
    annotation (Line(points={{-218,-100},{-160,-100},{-160,-158},{-82,-158}},
                color={0,0,127}));
  connect(ThermalLossBat2, LossSwitch10.u3)
    annotation (Line(points={{-218,-100},{-160,-100},{-160,-198},{-82,-198}},
                color={0,0,127}));
  connect(ConvCollector.port_b, PortConv)
    annotation (Line(points={{134,-60},{200,-60}}, color={191,0,0}));
  connect(BatteryRack1.TemperatureBat, TemperatureBat1)
    annotation (
      Line(points={{36,200},{36,210},{92,210},{92,160},{120,160},{120,210}},
        color={0,0,127}));
  connect(BatteryRack10.TemperatureBat, TemperatureBat2)
    annotation (
     Line(points={{36,-180},{36,-168},{160,-168},{160,210}}, color={0,0,127}));
  connect(RadCollector.Star_b, Star)
    annotation (Line(points={{133.6,60},{201,60}}, color={95,95,95}));
  connect(BatteryRack1.Star, RadCollector.Star_a[1])
    annotation (Line(points={{
          40,192},{80,192},{80,60},{94,60}}, color={95,95,95}));
  connect(BatteryRack2.Star, RadCollector.Star_a[2])
    annotation (Line(points={{
          40,152},{80,152},{80,60},{94,60}}, color={95,95,95}));
  connect(BatteryRack3.Star, RadCollector.Star_a[3])
    annotation (Line(points={{
          40,112},{80,112},{80,60},{94,60}}, color={95,95,95}));
  connect(BatteryRack4.Star, RadCollector.Star_a[4])
    annotation (Line(points={{
          40,72},{80,72},{80,60},{94,60}}, color={95,95,95}));
  connect(BatteryRack5.Star, RadCollector.Star_a[5])
    annotation (Line(points={{
          40,32},{80,32},{80,60},{94,60}}, color={95,95,95}));
  connect(BatteryRack6.Star, RadCollector.Star_a[6])
    annotation (Line(points={{
          40,-28},{80,-28},{80,60},{94,60}}, color={95,95,95}));
  connect(BatteryRack7.Star, RadCollector.Star_a[7])
    annotation (Line(points={{
          40,-68},{80,-68},{80,60},{94,60}}, color={95,95,95}));
  connect(BatteryRack8.Star, RadCollector.Star_a[8])
    annotation (Line(points={{
          40,-108},{80,-108},{80,60},{94,60}}, color={95,95,95}));
  connect(BatteryRack9.Star, RadCollector.Star_a[9])
    annotation (Line(points={{
          40,-148},{80,-148},{80,60},{94,60}}, color={95,95,95}));
  connect(BatteryRack10.Star, RadCollector.Star_a[10])
    annotation (Line(points=
         {{40,-188},{80,-188},{80,60},{94,60}}, color={95,95,95}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false,
         extent={{-200,-200},{200,200}}), graphics={Rectangle(
          extent={{-160,160},{160,-160}},
          lineColor={28,108,200},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid), Text(
          extent={{-136,40},{138,-32}},
          lineColor={28,108,200},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid,
          textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=false,
            extent={{-200,-200},{200,200}})),
    Documentation(info="<html>
<p><b><font style=\"color: #008000; \">Overview</font></b> </p>
<p>The <b>BatteryRoom</b> model represents the thermal 
behaviour of a room, which contains different battery racks. </p>
<p><b><font style=\"color: #008000; \">Concept</font></b> </p>
<p>This is a base model, which can be expanded if there are more difficult 
models needed. This base model can deal with ten battery racks and two 
different types of installed battery types. </p>
<p>The model needs an input of heat loss of the batteries and separates 
this input automatically on the different battery racks.</p>
<p><b><font style=\"color: #008000; \">Example</font></b> </p>
<p><a href=\"AixLib.Building.BatteryModel.ExampleBatteryRoom\">AixLib.Building.BatteryModel.ExampleBatteryRoom </a></p>
<p><b><font style=\"color: #008000; \">References</font></b> </p>
<p>The model uses the 
<a href=\"AixLib.Utilities.Interfaces.ThermalRadiationCollector\">AixLib.Utilities.Interfaces.ThermalRadiationCollector </a>
to collect the radiation heat of the different battery racks.
The <b>ThermalRadiationCollector</b> is based on the <b>ThermalCollector</b> 
from the Modelica Library.</p>
<p>The model uses the record 
<a href=\"AixLib.DataBase.Batteries.RackBaseDataDefinition\">AixLib.DataBase.Batteries.RackBaseDataDefinition </a>
to define the rack parameters.</p>
</html>",  revisions="<html>
<ul>
<li><i>July 26, 2017&nbsp;</i> by Paul Thiele:<br/>Implemented. </li>
</ul>
</html>"));
end BatteryRoom;