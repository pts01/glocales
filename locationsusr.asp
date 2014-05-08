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
rsmarks.Source = "select distinct user as luser from locations" & wh
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
response.write(rsmarks("luser"))
response.write(""" ")

response.write("/>")

cnt = cnt + 1

rsmarks.MoveNext()
loop 'rsmarks

response.write("</posdata>")

rsmarks.close()

%>

