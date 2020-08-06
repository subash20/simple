#!/usr/bin/env python

from xml.dom.minidom import parse
import xml.dom.minidom

# Open XML document using minidom parser
DOMTree = xml.dom.minidom.parse("/var/log/httpd/test.xml")
collection = DOMTree.documentElement
#if collection.hasAttribute("xsi:schemaLocation"):
#   print "Root element : %s" % collection.getAttribute("xsi:schemaLocation")

# Get all the data from AuditRecord
audit_record = collection.getElementsByTagName("AuditRecord")

# Print detail of each AUdit Record
for item in audit_record:
  # print "*****Audit Record*****"
   #if movie.hasAttribute("title"):
   #   print "Title: %s" % movie.getAttribute("title")

   db_user = item.getElementsByTagName('DB_User')[0]
   print "DB_User: %s" % db_user.childNodes[0].data
   userhost=item.getElementsByTagName('Userhost')[0]
   print "Userhost:%s" % userhost.childNodes[0].data
   session_id = item.getElementsByTagName('Session_Id')[0]
   print "Session_Id: %s" % session_id.childNodes[0].data
   sql_text = item.getElementsByTagName('Sql_Text')[0]
   print "Sql_Text: %s" % sql_text.childNodes[0].data
   extended_timestamp = item.getElementsByTagName('Extended_Timestamp')[0]
   print "Extended_Timestamp: %s\n" % extended_timestamp.childNodes[0].data
   
   #extended_time = item.getElementsByTagName('Extended_Timestamp')[0]
  # print "EntryId: %s" % extended_time.childNodes[0].data
 
  # db_user=item.getElementsByTagName('DB_User')[0]
  # print "DB_User:%s" % db_user.childNodes[0].data
 
   
