within AixLib.Fluid.Movers.Compressors.SimpleCompressors;
model RotaryCompressor
  "Model that describes a simple rotary compressor"
  extends BaseClasses.PartialCompressor;

equation
  // Connection defined in inherited models
  //
  pInl = port_a.p "Pressure at inlet";
  pOut = port_b.p "Pressure at outlet";

  hInl = actualStream(port_a.h_outflow) "Specific enthalpy at inlet";
  hOut = actualStream(port_b.h_outflow) "Specific enthalpy at outlet";

  port_a.h_outflow = inStream(port_a.h_outflow)
    "Compressor behaves as perfect valve if flow is reserved";
  port_b.h_outflow = smooth(0,noEvent(if m_flow > 0
    then hInl + dh else inStream(port_a.h_outflow)))
    "Compressor behaves as perfect valve if flow is reserved";
  /*It is assumed that the compressor works as perfectly closed valve if the 
    mass flow is reserved. Hence, specific enthalpies flowing out of the system
    will meet the specific enthalpies flowing into the system.
  */

  annotation (Icon(graphics={
        Ellipse(
          extent={{-60,40},{20,-40}},
          lineColor={0,0,0},
          fillColor={230,230,230},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-40,28},{20,-32}},
          lineColor={0,0,0},
          fillColor={182,182,182},
          fillPattern=FillPattern.CrossDiag),
        Ellipse(
          extent={{-26,6},{-14,-6}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-22,46},{-18,26}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}), Documentation(revisions="<html>
<ul>
  <li>
  October 20, 2017, by Mirko Engelpracht:<br/>
  First implementation
  (see <a href=\"https://github.com/RWTH-EBC/AixLib/issues/467\">issue 467</a>).
  </li>
</ul>
</html>"));
end RotaryCompressor;
