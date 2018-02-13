within AixLib.Fluid.HeatExchangers.ActiveWalls.BaseClasses;
function logUnderDT "calculate undertermperature for cooling"

  import Modelica.Math.log;

input Modelica.SIunits.Temperature Temp_in[3];
output Modelica.SIunits.Temperature Temp_out;

algorithm
Temp_out :=(Temp_in[2] - Temp_in[1])/log(abs((Temp_in[1] - Temp_in[3])/(Temp_in[2] -
    Temp_in[3])));

    annotation (Documentation(revisions="<html>
<ul>
<li><i>June 15, 2017&nbsp;</i> by Tobias Blacha:<br/>
Moved into AixLib</li>
<li><i>August 03, 2014&nbsp;</i> by Ana Constantin:<br/>
Implemented.</li>
</ul>
</html>"));
end logUnderDT;