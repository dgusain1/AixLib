within AixLib.Utilities.Communication.SocketCommunication.Functions.TCP;
function SocketReceive "External C function to receive data on current socket"

output String buffer "buffer where incoming message is saved";
input Integer length "Maximum length of incoming message";
input Integer socketHandle "SocketHandle";
output Integer state
    "State of Function, No. of bytes received if fine, -1 if failed";

external "C" state=SocketReceive(buffer,length,socketHandle) annotation (
Include="#include \"TCP_Lib.h\"",
 IncludeDirectory="modelica://ConnectivityTCP/Resources/Include");

annotation (Documentation(info="<html>

<p>
Function that receives incoming data on current socket. The received telegram is returned.
</p>
<h4>Usage of Function</h4>

This code snippet will create a local socket and connect to server with IP 0.11.11.11 on port 1234
and send the message \"I am a message!\" with the length of 15 characters to the server
 every 1 second. If the server sends something after receiving the send message it will receive 
 this message and safe it into bufferRecv.
 <p>
<pre>

model dummyUsage

  Integer state \"Return variable of functions 0 == OK!, 1 == Error\";
  Modelica.SIUnits.Time sampleTrigger=1 \" Sampletime how often per second telegram is send\";
  parameter Interger maxLen = 512 \"Limits the maximum number of characters receiveable\";
  String bufferRecv \"Variable where received message\";
  
initial algorithm 

  state := TCPConstructor(\"0.11.11.11\",\"1234\");

equation

algorithm

  when {sampleTrigger} then

    state = SocketSend(\"I am a message!\", 15);
    (bufferRecv, state) = SocketReceive(maxLen);
  
  end when;

end dummyUsage;


</pre>

<h4>Errors</h4>
state == 0, everything fine, state == 1, error where an error message will be reported in the 
Dymola messages window. Error codes and descriptions can be found in UsersGuide.

<h4>C Source Code of SocketReceive()</h4>

Source code of SocketReceive().
<p>
<pre>
int SocketReceive(char **buffer, int maxLen)
{
        int iResult;
        char *answerBuffer;
        answerBuffer = ModelicaAllocateString(maxLen);
        iResult = recv(gConnectSocket, answerBuffer, maxLen, 0);
        *buffer = answerBuffer;
        return iResult;
}
</pre>

</html>"));
end SocketReceive;
