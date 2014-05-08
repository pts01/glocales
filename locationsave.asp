<%@LANGUAGE="JAVASCRIPT" CODEPAGE="1252"%>

<%
var MM_connIMSApps_STRING = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=T:\\webserver_data\\databases\\access\\gis\\locations.mdb"

var mkuser = Request.querystring("user");
var mkldate = Request.querystring("ldate");
var mklat = Request.querystring("lat");
var mklng = Request.querystring("lng");
var mkldesc = Request.querystring("ldesc");
var mkzoom = Request.querystring("zoom");
var mkicon = Request.querystring("icon");
var mkurl = Request.querystring("url");
var mkhtml = Request.querystring("html");

var mkrqs = " VALUES ('" + mkuser + "',";
var mkrqs = mkrqs + "'" + mkldate + "',";
var mkrqs = mkrqs + mklat + ",";
var mkrqs = mkrqs + mklng + ",";
var mkrqs = mkrqs + "'" + mkldesc + "',";
var mkrqs = mkrqs + mkzoom + ",";
var mkrqs = mkrqs + "'" + mkicon + "',";
var mkrqs = mkrqs + "'" + mkurl + "',";
var mkrqs = mkrqs + "'" + mkhtml + "')";

//var mkrqsx = " VALUES ('patt', '11/17', 13.028334300367456, 14.481774902343755, 'November 17 - Lake Chad, Chad', 11, 'exiticon', 'http://dot.ca.gov', 'caltrans')";
var mkrx = "INSERT INTO locations ( [user], ldate, lat, lng, ldesc, zoom, icon, url, html )";
mkrx = mkrx + mkrqs;

var rcLogin = Server.CreateObject("ADODB.Connection");
rcLogin.ConnectionString = MM_connIMSApps_STRING;
rcLogin.Open;
rcLogin.Execute(mkrx);
rcLogin.Close();

Response.expires=-1
Response.contenttype="text/xml"

Response.write("<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>")
Response.write("<posdata>")

Response.write("<marker ")

Response.write("resp=\"")
Response.write("ok")
Response.write("\" ")

Response.write("/>")

Response.write("</posdata>")

%>

