﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AJAXCS2008Seadragon._Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <style type="text/css">
        .seadragon
        {
            background-color: black;
            border: 1px solid black;
            color: white; /* text color for messages */
        }
        .overlay
        {
            background-color: white;
            opacity: 0.7;
            filter: alpha(opacity=70);
            border: 1px solid red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    
    <div>
    

    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" 
        CombineScripts="false" ScriptMode="Debug"  runat="server" />
    
    <div class="demoarea">
        <div class="demoheading">
            Seadragon control with default properties
        </div>
        <ajaxToolkit:Seadragon ID="Seadragon" CssClass="seadragon" runat="server" SourceUrl="sample.xml">
        </ajaxToolkit:Seadragon>
        
        <p>
        Click on the buttons to zoom in, zoom out, reset zoom, and make the image full screen.
        You also can drag the image with your mouse or double-click to zoom.
        </p>
        <p>
        The Seadragon control is written in pure JavaScript. It works with all popular modern browsers.
        </p>
        <p>
        Learn how to create images that work with the Seadragon control by visiting the 
        Microsoft Live Labs website at <a href="http://livelabs.com/seadragon-ajax/">http://livelabs.com/seadragon-ajax/</a>.
        </p>
        
    </div>
    <div class="demobottom">
    </div>
    <br />
    <br />
    <div class="demoarea">
        <div class="demoheading">
            Seadragon with a scalable overlay and a regular control
        </div>
        <ajaxToolkit:Seadragon ID="Seadragon2" CssClass="seadragon" runat="server" SourceUrl="dzc_output.xml">
            <ControlsCollection>
                <ajaxToolkit:SeadragonControl ID="SeadragonControl1" runat="server" Anchor="TOP_RIGHT">
                    <asp:Menu ID="Menu1" runat="server" BackColor="#FFFBD6" DynamicHorizontalOffset="2" Font-Names="Verdana"
                        Font-Size="10px" ForeColor="#990000" Orientation="Horizontal" StaticSubMenuIndent="10px"
                        Font-Bold="True">
                        <StaticSelectedStyle BackColor="#FFCC66" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
                        <DynamicMenuStyle BackColor="#FFFBD6" />
                        <DynamicSelectedStyle BackColor="#FFCC66" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticHoverStyle BackColor="#990000" ForeColor="White" />
                        <Items>
                            <asp:MenuItem Text="Menu" Value="Menu" />
                            <asp:MenuItem Text="Control" Value="Control" />
                            <asp:MenuItem Text="Over" Value="Over" />
                            <asp:MenuItem Text="Seadragon" Value="Seadragon" />
                        </Items>
                    </asp:Menu>
                </ajaxToolkit:SeadragonControl>
            </ControlsCollection>
            <OverlaysCollection>
                <ajaxToolkit:SeadragonScalableOverlay ID="SeadragonScalableOverlay1" runat="server" Rect-Height="0.24"
                    Rect-Width="0.26" CssClass="overlay" 
                    Rect-Point-X="0.14" Rect-Point-Y="0.06">
                </ajaxToolkit:SeadragonScalableOverlay>
            </OverlaysCollection>
        </ajaxToolkit:Seadragon>


    
    <p>
    This sample demonstrates two overlays that appear on top of the Seadragon control.
    The first overlay contains a standard ASP.NET Menu control. When you pan or zoom
    the image, the overlay remains static.
    </p>
    <p>
    The second overlay is a scalable overlay. It changes size when you zoom in and out
    of the image.
    </p>



    </div>
    
    <div class="demobottom">





    </div>
    <asp:Panel ID="Description_HeaderPanel" runat="server" Style="cursor: pointer;">
        <div class="heading">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" ImageUrl="~/images/collapse.jpg"
                AlternateText="collapse" />
            Seadragon Description
        </div>
    </asp:Panel>
    <asp:Panel ID="Description_ContentPanel" runat="server" Style="overflow: hidden;">
        <p>
            The Seadragon control can be used for interactively viewing images. Use your mouse to pan and zoom around the image.
        </p>
        <p>
            Learn how to create images that work with the Seadragon control by visiting the
            Microsoft Live Labs website at <a href="http://livelabs.com/seadragon-ajax/">http://livelabs.com/seadragon-ajax/</a>.
        </p>
        
    </asp:Panel>
    <asp:Panel ID="Properties_HeaderPanel" runat="server" Style="cursor: pointer;">
        <div class="heading">
            <asp:ImageButton ID="Properties_ToggleImage" runat="server" ImageUrl="~/images/expand.jpg"
                AlternateText="expand" />
            Seadragon Properties
        </div>
    </asp:Panel>
    <asp:Panel ID="Properties_ContentPanel" runat="server" Style="overflow: hidden;"
        Height="0px">
        <p>
            First example above is initialized with this code.
        </p>
        <pre>
&lt;ajaxToolkit:Seadragon ID="Seadragon"
	runat="server"
	SourceUrl="sample.xml"&gt;
	CssClass="seadragon"
&lt;/ajaxToolkit:Seadragon&gt;
</pre>
        <p>
            Second example above is initialized with this code.
        </p>
        <pre>
&lt;ajaxToolkit:Seadragon ID="Seadragon2"
  runat="server"
  CssClass="seadragon"
  SourceUrl="dzc_output.xml"&gt;
  &lt;ControlsCollection&gt;
    &lt;ajaxToolkit:SeadragonControl runat="server"
      Anchor="TOP_RIGHT"&gt;
      &lt;asp:Menu runat="server" ...&gt;
        <i>set menu style</i>
        &lt;Items&gt;
          &lt;asp:MenuItem Text="Menu" Value="Menu" /&gt;
          &lt;asp:MenuItem Text="Control" Value="Control" /&gt;
          &lt;asp:MenuItem Text="Over" Value="Over" /&gt;
          &lt;asp:MenuItem Text="Seadragon" Value="Seadragon" /&gt;
        &lt;/Items&gt;
      &lt;/asp:Menu&gt;
    &lt;/ajaxToolkit:SeadragonControl&gt;
  &lt;/ControlsCollection&gt;
  &lt;OverlaysCollection&gt;
    &lt;ajaxToolkit:SeadragonScalableOverlay 
      runat="server"
      Rect-Height="0.24"
      Rect-Width="0.26" 
      CssClass="overlay" 
      Rect-Point-X="0.14" 
      Rect-Point-Y="0.06"     
    &lt;/ajaxToolkit:SeadragonScalableOverlay&gt;
  &lt;/OverlaysCollection&gt;
&lt;/ajaxToolkit:Seadragon&gt;
</pre>
        <ul>
            <li><strong>animationTime </strong>- The amount of time in seconds that animations should
                last. Default is 1.5. </li>
            <li><strong>blendTime</strong> - The amount of time in seconds that new tiles take to
                blend from transparent to opaque. Default is 0.5. </li>
            <li><strong>alwaysBlend</strong> - Whether tiles should always blend in and out, not
                just when they're first loaded. Default is false. </li>
            <li><strong>autoHideControls</strong> - Whether controls should get automatically hidden
                when the user's mouse is off the viewer and the image has stopped animating. Default
                is true. </li>
            <li><strong>immediateRender</strong> - Whether the most appropriate tiles should always
                be rendered first, before any lower-res tiles are rendered. This loses the "sharpening"
                effect and instead creates a very visible "tiling" effect. Default is false.
            </li>
            <li><strong>minZoomDimension</strong> - The minimum size (in screen pixels) of either
                dimension that can result from zooming out. Default is 16. </li>
            <li><strong>maxZoomPixelRatio</strong> - The maximum pixel ratio (screen pixel to content
                pixel) that can result from zooming in. Default is 4. </li>
            <li><strong>visibilityRatio</strong> - The minimum portion of the viewport that must
                show visible content in both dimensions. Default is 0.1. </li>
            <li><strong>springStiffness</strong> - Determines how sharply the springs used for animations
                move. Default is 5.0. </li>
            <li><strong>imageLoaderLimit</strong> - The maximum number of concurrent image downloads
                that can be performed by each viewer. Default is 2. </li>
            <li><strong>clickTimeThreshold</strong> - The maximum number of milliseconds that can
                pass between a mousedown and a mouseup for the action to still be considered a "quick"
                click. Default is 200. </li>
            <li><strong>clickDistThreshold</strong> - The maximum number of pixels the mouse can
                move between a mousedown and a mouseup for the action to still be considered a "quick"
                click. Default is 5. </li>
            <li><strong>zoomPerClick</strong> - The factor by which images should zoom when clicked
                on. Default is 2. </li>
            <li><strong>zoomPerSecond</strong> - The factor by which images should zoom over each
                second when the zoom buttons are held down. Default is 2. </li>
            <li><strong>sourceUrl</strong> - The path for all UI images. This can be absolute or
                relative. If relative, it must be relative to the HTML page. A change to this value
                will only affect new viewers. Default is "img/". </li>
            <li><strong>showNavigationControl</strong> - Whether navigation buttons should be shown.
            </li>
        </ul>
    </asp:Panel>
    <ajaxToolkit:CollapsiblePanelExtender ID="cpeDescription" runat="Server" TargetControlID="Description_ContentPanel"
        ExpandControlID="Description_HeaderPanel" CollapseControlID="Description_HeaderPanel"
        Collapsed="False" ImageControlID="Description_ToggleImage" />
    <ajaxToolkit:CollapsiblePanelExtender ID="cpeProperties" runat="Server" TargetControlID="Properties_ContentPanel"
        ExpandControlID="Properties_HeaderPanel" CollapseControlID="Properties_HeaderPanel"
        Collapsed="True" ImageControlID="Properties_ToggleImage" />


        
    </div>
    </form>
</body>
</html>
