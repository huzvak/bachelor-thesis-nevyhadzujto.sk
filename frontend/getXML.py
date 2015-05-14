import urllib
import xml.etree.ElementTree as ET


class getXML(object):
    
    #@param url_link:URL address from which XML file is requested
    #@return: File:XML File is returned
    def run(self, url_link):
        
        url_link = urllib.quote(url_link.encode("utf-8"), safe="%/:=&?~#+!$,;'@()*[]")
        
        url = urllib.urlopen(url_link)
        xmldoc = ET.parse(url)
        url.close()
        
        return xmldoc
