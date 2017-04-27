within AixLib.Fluid.FixedResistances;
model HydraulicResistance
  "Simple model for a hydraulic resistance using a pressure loss factor"
  extends AixLib.Fluid.BaseClasses.PartialResistance(
    final m_flow(start=m_flow_start),
    final dp(start=dp_start),
    final dp_nominal=
      8 * zeta * m_flow_nominal * m_flow_nominal /
      (rho_default * Modelica.Constants.pi * Modelica.Constants.pi *
      diameter * diameter * diameter * diameter),
    final m_flow_turbulent=100*m_flow_nominal);
  // No usage of m_flow_turbulent since zeta approach does not distinguish between laminar and turbulent flow.
  parameter Real zeta(min=0, unit="")
    "Pressure loss factor for flow of port_a -> port_b";
  parameter Modelica.SIunits.Diameter diameter "Diameter of component";
  parameter Modelica.SIunits.PressureDifference dp_start(displayUnit="Pa") = 0
    "Guess value of dp = port_a.p - port_b.p"
    annotation (Dialog(tab="Advanced"));
  parameter Medium.MassFlowRate m_flow_start=0
    "Guess value of m_flow = port_a.m_flow" annotation (Dialog(tab="Advanced"));

protected
  final parameter Real k(min=0, unit="") = Modelica.Fluid.Fittings.BaseClasses.lossConstant_D_zeta(D=diameter,zeta=zeta) "Calculate loss coefficient based on diameter and zeta";

  final parameter Modelica.SIunits.PressureDifference dp_small = 1E-4*abs(dp_nominal) "Small pressure difference for regularization of zero pressure difference";

  final parameter Modelica.SIunits.Density rho_default = Medium.density(state_default)
    "Density at nominal condition";

  Modelica.SIunits.Density rho_a "Density of the fluid at port_a";
  Modelica.SIunits.Density rho_b "Density of the fluid at port_b";

initial equation
  assert(m_flow_nominal_pos > 0, "m_flow_nominal_pos must be non-zero. Check parameters.");
equation

  rho_a = Medium.density(Medium.setState_phX(
    p=port_a.p,
    h=inStream(port_a.h_outflow),
    X=inStream(port_a.Xi_outflow)));

  rho_b = Medium.density(Medium.setState_phX(
    p=port_b.p,
    h=inStream(port_b.h_outflow),
    X=inStream(port_b.Xi_outflow)));

  // Pressure drop calculation

  if linearized then
    m_flow*m_flow_nominal_pos = k*k*dp;
  else
    if homotopyInitialization then
      if from_dp then
        m_flow = homotopy(actual=
          Modelica.Fluid.Utilities.regRoot2(
          dp,
          dp_small,
          rho_a/k,
          rho_b/k),
          simplified=m_flow_nominal_pos*dp/dp_nominal_pos);
      else
        dp = homotopy(actual=
          Modelica.Fluid.Utilities.regSquare2(
          m_flow,
          m_flow_small,
          k/rho_a,
          k/rho_b),
          simplified=dp_nominal_pos*m_flow/m_flow_nominal_pos);
      end if;
      // from_dp
    else
      // do not use homotopy
      if from_dp then
        m_flow = Modelica.Fluid.Utilities.regRoot2(
          dp,
          dp_small,
          rho_a/k,
          rho_b/k);
      else
        dp = Modelica.Fluid.Utilities.regSquare2(
          m_flow,
          m_flow_small,
          k/rho_a,
          k/rho_b);
      end if;
      // from_dp
    end if;
    // homotopyInitialization
  end if;
  // linearized

  annotation (Icon(graphics={Rectangle(
          extent={{-80,40},{80,-40}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          radius=45), Text(
          extent={{32,20},{-30,-16}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          textString="Zeta=%zeta")}), Documentation(revisions="<html>
  <ul>
  <li><i>April 25, 2017&nbsp;</i>
     by Philipp Mehrfeld:<br/>
     Delete standard parameterization</li>
  <li><i>April 2016&nbsp;</i>
     by Peter Matthes:<br/>
     Improved formulation of flow equation according to issue #232.</li>
  <li><i>November 2014&nbsp;</i>
     by Marcus Fuchs:<br/>
     Changed model to use Annex 60 base class</li>
  <li><i>November 1, 2013&nbsp;</i>
     by Ana Constantin:<br/>
     Implemented</li>
  </ul>
 </html>", info="<html>
<p><b><span style=\"color: #008000;\">Overview</span></b> </p>
<p>Very simple model for a hydraulic resistance with the pressureloss modelled with the pressure loss factor <code>zeta</code>. </p>
<p><b><span style=\"color: #008000;\">Concept</span></b> </p>
<p>Values for pressure loss factor zeta can be easily found in tables. </p>
<p><b><span style=\"color: #008000;\">Example Results</span></b> </p>
<p><a href=\"AixLib.Fluid.FixedResistances.Examples.CompareFixedResistances\">AixLib.Fluid.FixedResistances.Examples.CompareFixedResistances</a> </p>
<p><a href=\"AixLib.Fluid.FixedResistances.Examples.CompareFixedResistances\">AixLib.Fluid.FixedResistances.Examples.PerformanceHydraulicResistance2</a> </p>
</html>"));
end HydraulicResistance;
