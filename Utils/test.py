import requests
from XMLReader import XMLReader
import os.path

import sys
import testrailenv_conf as conf_file

Source_Folder = conf_file.Source_Folder
File_Folder = conf_file.File_Folder

def testrail_update(filename):
  data_folder = os.path.join(Source_Folder, File_Folder)
  file_to_open = os.path.join(data_folder, filename)
  #print(run_id)
  testcase_status_dic = {}
  #testrail = Test_Rail.Test_Rail()
  XML_Reader = XMLReader()
  print("--------------")
  # run_id = testrail.get_run_id(Project_Name,Test_Run_Name)
  testcase_status_dic = XML_Reader.testcases_status(file_to_open)
  print(testcase_status_dic)
  # if testcase_status_dic > 'FAIL':
  result = 1
  url = 'https://sanjeev.app.testcollab.com/index.php/project/2/executions/run/3.json?API_KEY=671f67eb917a7bd3b2f0cfbb38c644b49c81eed1'
  payload = "{\n  \"data\": {\n    \"ExecutionRun\": {\n      \"notes\": \"Your note\",\n      \"result\": \"1\",\n      \"time_taken\": \"80\"}\n  }\n}"
  headers = {
    'Content-Type': 'application/json'
  }
  response = requests.request('POST', url, headers = headers, data = payload, allow_redirects=False, timeout=5)
  print(response.text)

testrail_update("output.xml")