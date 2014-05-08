<%
dim MM_connIMSApps_STRING
dim rsmarks
dim cnt
dim mkuser
dim wh

wh = ""

mkuser = request.querystring("user")

if mkuser <> "" then
    wh = " where user = '" + mkuser + "'"
end if

cnt = 0

MM_connIMSApps_STRING = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=T:\\webserver_data\\databases\\access\\gis\\locations.mdb"

Set rsmarks = Server.CreateObject("ADODB.Recordset")
rsmarks.ActiveConnection = MM_connIMSApps_STRING
rsmarks.Source = "select user, ldate, lat, lng, ldesc, zoom, icon, url, html from locations"
rsmarks.Source = rsmarks.Source + wh
rsmarks.CursorLocation = 2
rsmarks.LockType = 1
rsmarks.Open()

Response.expires=-1
Response.contenttype="text/xml"

response.write("<?xml version=""1.0"" encoding=""ISO-8859-1""?>")
response.write("<posdata>")

do while (not rsmarks.EOF) 

response.write("<marker ")

response.write("user=""")
response.write(rsmarks("user"))
response.write(""" ")

response.write("ldate=""")
response.write(rsmarks("ldate"))
response.write(""" ")

response.write("lat=""")
response.write(rsmarks("lat"))
response.write(""" ")

response.write("lng=""")
response.write(rsmarks("lng"))
response.write(""" ")

response.write("ldesc=""")
response.write(rsmarks("ldesc"))
response.write(""" ")

response.write("zoom=""")
response.write(rsmarks("zoom"))
response.write(""" ")

response.write("icon=""")
response.write(rsmarks("icon"))
response.write(""" ")

response.write("url=""")
response.write(rsmarks("url"))
response.write(""" ")

response.write("html=""")
response.write(rsmarks("html"))
response.write(""" ")

response.write("/>")

cnt = cnt + 1

rsmarks.MoveNext()
loop 'rsmarks

response.write("</posdata>")

rsmarks.close()

%>

