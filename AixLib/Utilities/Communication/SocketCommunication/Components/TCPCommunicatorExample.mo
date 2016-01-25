within AixLib.Utilities.Communication.SocketCommunication.Components;
model TCPCommunicatorExample
  "Example model to show TCP-Communication with simple server"
  extends Internal.TCPCommunicatorBasic(
          final nin = nSend,
          final nout = nRecv,
          final samplePeriod = samplePeriodExample,
          final startTime=startTimeExample,
          final IP_Address=IP_AddressExample,
          final port=portExample); //Extends basic TCP communication model

  /**************** necessary Input ****************************/
  parameter Modelica.SIunits.Time samplePeriodExample = 1
    "Sample period how often a telegram is send";
  parameter Modelica.SIunits.Time startTimeExample = 0
    "Start time when sampling starts";
  parameter String IP_AddressExample = "127.0.0.1"
    "IP address or name of Server";
  parameter String portExample="27015" "Port on Server";
  parameter Integer nSend = 1 "Number of datapoints to be written";
  parameter Integer nRecv = 1 "Number of datapoints to be read";

  parameter Integer maxLen = 512
    "Maximum number of single characters receiveable per message";
  String message "Variable for the message to be send";
  Integer intLength "integer value of length of message";
  Integer stateExample
    "dummy variable to check state of function, 0 == OK, 1 == errror";
  String messageRecv "Variable to host received message";
equation

algorithm
  when {sampleTrigger} then

     intLength := Modelica.Utilities.Strings.length(String(u[1]));// Evaluate length of input u[1]
     message := String(u[1]);// Insert String of u[1]
     stateExample :=Functions.TCP.SocketSend(message, intLength);    // send message

/************************* In between for expalanation ******************************/
  Modelica.Utilities.Streams.print("MySocketSend(): Send message");
  Modelica.Utilities.Streams.print("The message send is:");
  Modelica.Utilities.Streams.print(String(u[1]));
/************************* In between for expalanation ******************************/

   (messageRecv, stateExample) :=Functions.TCP.SocketReceive(maxLen);   // receive message, server directly responses

    y[1] :=Functions.Utilities.convertStrtoDbl(messageRecv);

/************************* In between for expalanation ******************************/
  Modelica.Utilities.Streams.print("MySocketReceive(): Message received");
  Modelica.Utilities.Streams.print("messageRecv is:");
  Modelica.Utilities.Streams.print(messageRecv);
/************************* In between for expalanation ******************************/

 end when;

annotation(Documentation(revisions="<html>
<ul>
  <li><i>June 01, 2013&nbsp;</i>
         by Georg Ferdinand Schneider:<br>
         Implemented</li>

 <li><i>September 03, 2013&nbsp;</i>
         by Georg Ferdinand Schneider:<br>
         Revised and updated </li>
 <li><i>September 03, 2013&nbsp;</i>
         by Georg Ferdinand Schneider:<br>
         Revised and updated to segmented type</li>
</ul>
</html>", info="<html>
<p>
</p>

<h4>Simple TCP Communicator Example</h4>

This is a small example Block which allows to establish a TCP Connection between a Client (i.e. Dymola) 
and a Server (External) it sends the value of input u[1] as a string to the server and receives a string message.
This received string message should only contain a real number as it is converted into a Real value afterwards and
forwarded to output y[1]. Check TCP_Communication.Examples.Example_Client_Loop for a executable example.
<p>
</p>
An example server to connect to also used in this example can be downloaded here:
<p>
</p>
http://msdn.microsoft.com/de-de/library/windows/desktop/ms737591%28v=vs.85%29.aspx
  

</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-88,66},{-30,30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{26,66},{84,30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-88,22},{-30,10}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{26,22},{84,10}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-38,10},{28,-36}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="TCP"),
        Polygon(
          points={{-50,-10},{-96,-46},{-50,-80},{-50,-10}},
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-50,-38},{40,-52}},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-86,64},{-32,32}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{28,64},{82,32}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{40,-10},{86,-42},{40,-80},{40,-10}},
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None)}));
end TCPCommunicatorExample;
