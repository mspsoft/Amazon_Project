# Title: Robotframework Output xml file Reader
# Author : Sanjeev Singh Verma
# Status:	Completed
# Type:	 Python Script
# Created:	02-Feb-2019
# Python-Version:	2.7
import xml.etree.ElementTree as ET
from collections import defaultdict


class XMLReader:
    def __init__(self):
        print ("XML Reader")
    def between(self,value, a, b):
        # Find and validate before-part.
        pos_a = value.find(a)
        if pos_a == -1: return ""
        # Find and validate after part.
        pos_b = value.rfind(b)
        if pos_b == -1: return ""
        # Return middle part.
        adjusted_pos_a = pos_a + len(a)
        if adjusted_pos_a >= pos_b: return ""
        return value[adjusted_pos_a:pos_b]


    def before(self,value, a):
        # Find first part and return slice before it.
        pos_a = value.find(a)
        if pos_a == -1: return ""
        return value[0:pos_a]

    def after(self,value, a):
        # Find and validate first part.
        pos_a = value.rfind(a)
        if pos_a == -1: return ""
        # Returns chars after the found string.
        adjusted_pos_a = pos_a + len(a)
        if adjusted_pos_a >= len(value): return ""
        return value[adjusted_pos_a:]

    def testcases_status(self,filename):
        data_dict = defaultdict(list)
        final_dict = {}
        print(filename)
        tree = ET.parse(filename)
        print(tree)
        root = tree.getroot()
        print(root)
        for child_of_root in root:
            if child_of_root.tag == "suite":
                print("TestSuite Name : " + child_of_root.attrib['name'])
                print("Suite Run Date & Time : " + root.attrib['generated'])
                for child_of_childroot in child_of_root:
                    if child_of_childroot.tag == "test":
                        for child_child_ofchildroot in child_of_childroot:
                            if child_child_ofchildroot.tag == "doc":
                                a = child_child_ofchildroot.text
                                ab = self.between(a, "[", "]")
                            if child_child_ofchildroot.tag == "status":
                                #testcase_status =  child_child_ofchildroot.text
                                b = child_child_ofchildroot.attrib['status']
                                #message = b + " : " + str(testcase_status)
                                data_dict[ab].append(b)
                #print data_dict
        for ID, status_list in data_dict.items():
            if "FAIL" in status_list:
                final_status = "FAIL"
            else:
                final_status = "PASS"
            final_dict[ID] = final_status
        #print final_dict
        return final_dict
