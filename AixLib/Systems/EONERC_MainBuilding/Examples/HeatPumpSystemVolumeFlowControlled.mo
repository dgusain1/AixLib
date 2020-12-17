within AixLib.Systems.EONERC_MainBuilding.Examples;
model HeatPumpSystemVolumeFlowControlled "Validation of HeatpumpSystem"
  extends Modelica.Icons.Example;
    package Medium = AixLib.Media.Water
    annotation (choicesAllMatching=true);

  Fluid.Sources.Boundary_pT          boundary(
    redeclare package Medium = Medium,
    nPorts=1,
    T=303.15) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-100,20})));
  Fluid.Sources.MassFlowSource_T        boundary5(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1,
    m_flow=1,
    T=300.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,-20})));
  Fluid.Sources.Boundary_pT          boundary2(
    redeclare package Medium = Medium,
    T=285.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={100,-22})));
  Fluid.Sources.MassFlowSource_T        boundary3(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    m_flow=4,
    use_T_in=true,
    T=291.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,20})));
  HeatpumpSystem heatpumpSystem(redeclare package Medium = Medium,
    T_start_hot=311.15,
    T_start_cold=284.15)
    annotation (Placement(transformation(extent={{-80,-40},{80,28}})));
  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-126,-14})));
  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin1 annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={126,30})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin2
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},
        rotation=0,
        origin={-70,-70})));
  Controller.HeatPumpSystemVolumeFlowControl heatPumpSystemVolumeFlowControl
    annotation (Placement(transformation(extent={{-28,66},{-8,98}})));
  Modelica.Blocks.Sources.Constant const(k=30)
    annotation (Placement(transformation(extent={{-78,86},{-64,100}})));
  Modelica.Blocks.Sources.Constant const1(k=5)
    annotation (Placement(transformation(extent={{-88,54},{-74,68}})));
  Modelica.Blocks.Sources.Constant const2(k=20)
    annotation (Placement(transformation(extent={{-110,-76},{-96,-62}})));
  Modelica.Blocks.Sources.Constant const3(k=20)
    annotation (Placement(transformation(extent={{-146,10},{-132,24}})));
  Modelica.Blocks.Sources.Constant const4(k=5)
    annotation (Placement(transformation(extent={{-132,44},{-118,58}})));
  Modelica.Blocks.Sources.Constant const5(k=15)
    annotation (Placement(transformation(extent={{122,-20},{136,-6}})));
  Modelica.Blocks.Sources.Constant const6(k=0)
    annotation (Placement(transformation(extent={{-58,48},{-44,62}})));
  Modelica.Blocks.Sources.Constant const7(k=20)
    annotation (Placement(transformation(extent={{74,50},{88,64}})));
  Modelica.Blocks.Sources.Constant const8(k=1)
    annotation (Placement(transformation(extent={{8,62},{22,76}})));
  BaseClasses.HeatPumpSystemBus heatPumpSystemBus1
    annotation (Placement(transformation(extent={{2,36},{22,56}})));
equation
  connect(boundary5.ports[1], heatpumpSystem.port_a2) annotation (Line(points={
          {-90,-20},{-80,-20},{-80,-9.77778}}, color={0,127,255}));
  connect(boundary.ports[1], heatpumpSystem.port_b2) annotation (Line(points={{
          -90,20},{-80,20},{-80,5.33333}}, color={0,127,255}));
  connect(toKelvin.Kelvin, boundary5.T_in)
    annotation (Line(points={{-126,-20.6},{-116,-20.6},{-116,-16},{-112,-16}},
                                                       color={0,0,127}));
  connect(toKelvin1.Kelvin, boundary3.T_in) annotation (Line(points={{126,23.4},
          {126,16},{112,16}},          color={0,0,127}));
  connect(prescribedTemperature.port, heatpumpSystem.T_outside) annotation (
      Line(points={{-20,-70},{-20,-54},{0,-54},{0,-36.2222}}, color={191,0,0}));
  connect(boundary3.ports[1], heatpumpSystem.port_a1) annotation (Line(points={{90,20},
          {88,20},{88,5.33333},{80,5.33333}},        color={0,127,255}));
  connect(heatpumpSystem.port_b1, boundary2.ports[1]) annotation (Line(points={{80,
          -9.77778},{80,0.11111},{90,0.11111},{90,-22}},     color={0,127,255}));
  connect(toKelvin2.Kelvin, prescribedTemperature.T)
    annotation (Line(points={{-61.2,-70},{-42,-70}}, color={0,0,127}));
  connect(heatPumpSystemVolumeFlowControl.heatPumpSystemBus1, heatpumpSystem.heatPumpSystemBus)
    annotation (Line(
      points={{-8,82.1},{0,82.1},{0,28}},
      color={255,204,51},
      thickness=0.5));
  connect(const.y, heatPumpSystemVolumeFlowControl.pElHP) annotation (Line(
        points={{-63.3,93},{-46.65,93},{-46.65,93.1},{-27.9,93.1}}, color={0,0,
          127}));
  connect(const1.y, heatPumpSystemVolumeFlowControl.vSetHS) annotation (Line(
        points={{-73.3,61},{-60.65,61},{-60.65,89},{-28,89}}, color={0,0,127}));
  connect(heatPumpSystemVolumeFlowControl.vSetCS,
    heatPumpSystemVolumeFlowControl.vSetHS) annotation (Line(points={{-28,78.2},
          {-48,76},{-48,75},{-46.65,75},{-46.65,89},{-28,89}}, color={0,0,127}));
  connect(heatPumpSystemVolumeFlowControl.vSetRecool,
    heatPumpSystemVolumeFlowControl.vSetHS) annotation (Line(points={{-28,75.4},
          {-38,75.4},{-38,78},{-58,78},{-58,75},{-46.65,75},{-46.65,89},{-28,89}},
        color={0,0,127}));
  connect(const2.y, toKelvin2.Celsius) annotation (Line(points={{-95.3,-69},{
          -87.65,-69},{-87.65,-70},{-79.6,-70}}, color={0,0,127}));
  connect(const3.y, toKelvin.Celsius) annotation (Line(points={{-131.3,17},{
          -131.3,6.5},{-126,6.5},{-126,-6.8}}, color={0,0,127}));
  connect(const4.y, boundary5.m_flow_in) annotation (Line(points={{-117.3,51},{
          -117.3,19.5},{-112,19.5},{-112,-12}}, color={0,0,127}));
  connect(const5.y, boundary3.m_flow_in) annotation (Line(points={{136.7,-13},{
          136.7,-1.5},{112,-1.5},{112,12}}, color={0,0,127}));
  connect(const6.y, heatPumpSystemVolumeFlowControl.vSetFreeCool) annotation (
      Line(points={{-43.3,55},{-43.3,62.5},{-28,62.5},{-28,71}}, color={0,0,127}));
  connect(const7.y, toKelvin1.Celsius) annotation (Line(points={{88.7,57},{
          107.35,57},{107.35,37.2},{126,37.2}}, color={0,0,127}));
  connect(heatpumpSystem.heatPumpSystemBus, heatPumpSystemBus1) annotation (
      Line(
      points={{0,28},{4,28},{4,44},{12,44},{12,46}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(const8.y, heatPumpSystemBus1.busThrottleCS.valveSet) annotation (Line(
        points={{22.7,69},{22.7,57.5},{12.05,57.5},{12.05,46.05}}, color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (experiment(StopTime=23400), __Dymola_Commands(file(
          ensureSimulated=true)=
        "Resources/Scripts/Dymola/Systems/EONERC_MainBuilding/Validation/Simulate_and_plot_HeatpumpSystemValidation.mos"
        "Simulate and plot"));
end HeatPumpSystemVolumeFlowControlled;
