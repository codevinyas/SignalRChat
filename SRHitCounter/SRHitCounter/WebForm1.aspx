<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SRHitCounter.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="hitCount"></div>
        Name : <input type="text" id="user" /> <br /> <br />
        Message : <input type="text" id="message" />  <input type="button" id="hitButton" value="Send" /> <br />
        <ul id="messageReceived"></ul> <br />
       
    </div>
    </form>

    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="Scripts/jquery.signalR-2.1.2.js"></script>
    <script src='<%: ResolveClientUrl("~/signalr/hubs") %>'></script>

    <script>        
        $(function () {
            var hub = $.connection.hitCounter;
            hub.client.updateCounter = function(name, message) {
                $('#messageReceived').append("<li>" + name + " : " + message + "</li>");
            };
            //var con = $.hubConnection();
            //var hub = con.createHubProxy('hitCounter');
            //hub.on('updateCounter', function (i) {
            //    $('#hitCount').text(i);
            //});

            $.connection.hub.start();

            $("#hitButton").click(function () {
                hub.server.recordHit($("#user").val(), $("#message").val());
                $("#message").val('').focus();
            })
        })
        
    </script>

</body>
</html>
