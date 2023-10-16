<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="tx_addbuttons.index" %>

<%@ Register assembly="TXTextControl.Web, Version=32.0.1200.500, Culture=neutral, PublicKeyToken=6b83fe9a75cfb638" namespace="TXTextControl.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TX Text Control Sample: Adding buttons</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
        <%-- This is a dummy invisible button which is used to trap an event
             in the code behind --%>
        <asp:Button style="display: none;" ID="dummyButton"
            runat="server" Text="" OnClick="dummyButton_Click" />

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <%-- Attach a post back trigger to post back the invisible button --%>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="dummyButton" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>

        <cc1:TextControl ID="TextControl1" runat="server" />

    </div>
    </form>

    <script>
        function addButton() {
            sSaveBtn = '<div class="ribbon-group" id="newGroup"> \
                <div class="ribbon-group-content"> \
                <div id="saveButton" class="ribbon-button ribbon-button-big"> \
                <div class="ribbon-button-big-image-container"> \
                <img src="save.png" class="ribbon-button-big-image" /> \
                </div> \
                <div class="ribbon-button-big-label-container"> \
                <p class="ribbon-button-label">Save</p> \
                </div> \
                </div> \
                </div> \
                <div class="ribbon-group-label-container"> \
                <p class="ribbon-group-label">File</p> \
                </div></div>';

            // add the new button and ribbon group using HTML
            document.getElementById('ribbonGroupClipboard').insertAdjacentHTML(
                'beforebegin', sSaveBtn);

            // force a post back on the invisible button
            document.getElementById("saveButton").addEventListener(
                "click", function () { __doPostBack('<%= dummyButton.ClientID %>', ''); });
        }

        // check whether the complete ribbon is loaded
        var checkExist = setInterval(function () {
            if (document.getElementById('ribbonGroupClipboard') != null) {
                addButton();
                clearInterval(checkExist);
            }
        }, 100);

    </script>

</body>
</html>
