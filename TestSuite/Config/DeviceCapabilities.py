import json
import os
import inspect
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
debug = True

class DeviceCapabilities:

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    fileLoaded = False

    def __init__(self):
        self.loadArguments()
        self.loadJSONFile()
        self.getJSONData()

    def loadArguments(self):
        try:
            # get some of the environment variables from the argument file
            # TODO change when not debugging
            if debug:
                self.testdeviceName = "MotoG5"
            else:
                self.testdeviceName = BuiltIn().get_variable_value("${testdeviceName}")
        except Exception as error:
            if not debug:
                logger.console("Something went wrong with arguments.")
                logger.console(error)

    def loadJSONFile(self):
        try:
            # Get json file
            jsonFile = os.path.join(os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe()))), 'Devices.json')

            # Load data from the file
            with open(jsonFile) as json_file:
                self.__loadedEnvironmentList = json.load(json_file)
                DeviceCapabilities.fileLoaded = True
        except IOError as error:
            logger.console("Something went wrong with JSON file.")
            logger.console(error)


    def getJSONData(self):
        try:
            if DeviceCapabilities.fileLoaded:
                # based on the argument file get environment variables
                for dev in self.__loadedEnvironmentList['devices']:

                    if str(self.testdeviceName).lower() == str(dev['device']).lower():

                        # Get capabilities
                        self.remoteUrl = dev['capabilities']['remoteUrl']
                        self.automationName = dev['capabilities']['automationName']
                        self.platformName = dev['capabilities']['platformName']
                        self.platformVersion = dev['capabilities']['platformVersion']
                        self.deviceName = dev['capabilities']['deviceName']
                        self.appPackage = dev['capabilities']['appPackage']
                        self.appActivity = dev['capabilities']['appActivity']
                        self.appPath = dev['capabilities']['appPath']

        except AssertionError as error:
            logger.console(error)

    def getMirthHost(self):
        return self.mirthHost

    def getMirthPort(self):
        return int(self.mirthPort)

if debug:
    env = DeviceCapabilities()
    print(env.remoteUrl)
    print(env.appPath)