within AixLib.Building.Benchmark.Generation;
model Generation_Hot
//  extends AixLib.Fluid.Interfaces.PartialTwoPortInterface;
  replaceable package Medium_Water =
    AixLib.Media.Water "Medium in the component";

    parameter Modelica.SIunits.Time riseTime_valve = 0 annotation(Dialog(tab = "General"));

    parameter Real m_flow_nominal_generation_hot = 0 annotation(Dialog(tab = "General"));
    parameter Modelica.SIunits.Pressure dpValve_nominal_generation_hot = 0 annotation(Dialog(tab = "General"));

  Modelica.Fluid.Interfaces.FluidPort_b Fluid_out_Hot(redeclare package Medium =
        Medium_Water)
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{90,28},{110,48}})));
  Modelica.Fluid.Interfaces.FluidPort_a Fluid_in_Hot(redeclare package Medium =
        Medium_Water)
    "Fluid connector a (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{86,-48},{106,-28}})));

  Test.Boiler_Benchmark boiler_Benchmark(
    redeclare package Medium = Medium_Water,
    m_flow_nominal=m_flow_nominal_generation_hot,
    transferHeat=true,
    paramBoiler=DataBase.Boiler.General.Boiler_Vitogas200F_60kW(),
    TAmb=298.15)
    annotation (Placement(transformation(extent={{10,46},{30,66}})));

  Fluid.Actuators.Valves.ThreeWayLinear Valve6(
    y_start=1,
    redeclare package Medium = Medium_Water,
    m_flow_nominal=m_flow_nominal_generation_hot,
    riseTime=riseTime_valve,
    CvData=AixLib.Fluid.Types.CvTypes.OpPoint,
    dpValve_nominal=dpValve_nominal_generation_hot)
    annotation (Placement(transformation(extent={{8,26},{-12,6}})));

  Fluid.BoilerCHP.CHP cHP(
    electricityDriven=true,
    TSetIn=true,
    m_flow_small=0.01,
    redeclare package Medium = Medium_Water,
    minCapacity=24,
    m_flow_nominal=m_flow_nominal_generation_hot,
    transferHeat=true,
    TAmb=298.15,
    param=DataBase.CHP.CHP_FMB_31_GSK())
    annotation (Placement(transformation(extent={{-86,6},{-66,26}})));

  Fluid.Sources.Boundary_pT bou3(
    nPorts=2,
    p=100000,
    redeclare package Medium = Medium_Water)
              annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={26,-8})));
  BusSystem.ControlBus controlBus annotation (Placement(transformation(extent={{-60,80},
            {-20,120}}),         iconTransformation(extent={{-50,90},{-30,110}})));
  Fluid.Movers.SpeedControlled_y fan2(redeclare package Medium = Medium_Water,
      redeclare Fluid.Movers.Data.Pumps.Wilo.Stratos50slash1to12 per)
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},
        rotation=0,
        origin={-38,16})));
  Fluid.Sensors.MassFlowRate senMasFlo(redeclare package Medium = Medium_Water)
    annotation (Placement(transformation(extent={{-10,-30},{-30,-10}})));
  Fluid.Sensors.Temperature senTem1(redeclare package Medium = Medium_Water)
    annotation (Placement(transformation(extent={{-52,-20},{-32,0}})));
  Fluid.Sensors.Temperature senTem2(redeclare package Medium = Medium_Water)
    annotation (Placement(transformation(extent={{70,38},{90,58}})));
  BusSystem.measureBus measureBus annotation (Placement(transformation(extent={{
            10,70},{50,110}}), iconTransformation(extent={{30,88},{50,110}})));
equation
  connect(Valve6.port_3, boiler_Benchmark.port_a)
    annotation (Line(points={{-2,26},{-2,56},{10,56}}, color={0,127,255}));
  connect(Valve6.port_1, Fluid_out_Hot) annotation (Line(points={{8,16},{70,16},
          {70,38},{100,38}}, color={0,127,255}));
  connect(boiler_Benchmark.port_b, Fluid_out_Hot) annotation (Line(points={{30,
          56},{70,56},{70,38},{100,38}}, color={0,127,255}));
  connect(bou3.ports[1], Fluid_in_Hot)
    annotation (Line(points={{26.8,-12},{26.8,-38},{96,-38}},
                                                           color={0,127,255}));
  connect(boiler_Benchmark.isOn, controlBus.OnOff_boiler) annotation (Line(
        points={{25,47},{25,40},{-39.9,40},{-39.9,100.1}},
                                                       color={255,0,255}));
  connect(cHP.on, controlBus.OnOff_CHP) annotation (Line(points={{-73,7},{-73,0},
          {-50,0},{-50,40},{-39.9,40},{-39.9,100.1}},
                                                  color={255,0,255}));
  connect(Valve6.y, controlBus.Valve6) annotation (Line(points={{-2,4},{-2,-2},{
          -20,-2},{-20,40},{-40,40},{-40,70},{-39.9,70},{-39.9,100.1}},
                                                 color={0,0,127}));
  connect(cHP.elSet, controlBus.ElSet_CHP) annotation (Line(points={{-83,22},{-88,
          22},{-88,40},{-39.9,40},{-39.9,100.1}}, color={0,0,127}));
  connect(cHP.TSet, controlBus.TSet_CHP) annotation (Line(points={{-83,10},{-88,
          10},{-88,0},{-50,0},{-50,40},{-39.9,40},{-39.9,100.1}},
                                                              color={0,0,127}));
  connect(boiler_Benchmark.TSet, controlBus.TSet_boiler)
    annotation (Line(points={{13,63},{-39.9,63},{-39.9,100.1}},
                                                            color={0,0,127}));
  connect(fan2.port_b, Valve6.port_2)
    annotation (Line(points={{-30,16},{-12,16}}, color={0,127,255}));
  connect(fan2.port_a, cHP.port_b)
    annotation (Line(points={{-46,16},{-66,16}}, color={0,127,255}));
  connect(fan2.y, controlBus.Pump_Hotwater_CHP_y) annotation (Line(points={{-38,
          25.6},{-38,40},{-39.9,40},{-39.9,100.1}},
                                                color={0,0,127}));
  connect(senMasFlo.port_a, bou3.ports[2]) annotation (Line(points={{-10,-20},{25.2,
          -20},{25.2,-12}}, color={0,127,255}));
  connect(senMasFlo.port_b, cHP.port_a) annotation (Line(points={{-30,-20},{-86,
          -20},{-86,16}}, color={0,127,255}));
  connect(senMasFlo.port_b, senTem1.port)
    annotation (Line(points={{-30,-20},{-42,-20}}, color={0,127,255}));
  connect(senTem2.port, Fluid_out_Hot)
    annotation (Line(points={{80,38},{100,38}}, color={0,127,255}));
  connect(senTem2.T, measureBus.generation_hot_out) annotation (Line(points={{87,
          48},{92,48},{92,80},{30.1,80},{30.1,90.1}}, color={0,0,127}));
  connect(senTem1.T, measureBus.generation_hot_in) annotation (Line(points={{-35,
          -10},{-34,-10},{-34,-2},{-20,-2},{-20,40},{30.1,40},{30.1,90.1}},
        color={0,0,127}));
  connect(senMasFlo.m_flow, measureBus.generation_hot_massflow) annotation (
      Line(points={{-20,-9},{-20,40},{30.1,40},{30.1,90.1}}, color={0,0,127}));
  connect(fan2.P, measureBus.Pump_generation_hot_power) annotation (Line(points=
         {{-29.2,23.2},{-20,23.2},{-20,40},{30.1,40},{30.1,90.1}}, color={0,0,
          127}));
  connect(cHP.electricalPower, measureBus.Electrical_power_CHP) annotation (
      Line(points={{-81,25},{-81,40},{30.1,40},{30.1,90.1}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Generation_Hot;
