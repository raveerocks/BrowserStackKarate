Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * def session = { capabilities: { browserName: 'chrome' }, desiredCapabilities: { "os" : "Windows", "os_version" : "10", "browserName" : "Chrome", "browserstack.user" : "princetonbaretto_7D2Tbt", "browserstack.key" : "qWi4tAEhsqyYmD7aAFR4"} }
    * configure driver = { type: 'chromedriver', webDriverSession: '#(session)', start: false, webDriverUrl: 'http://hub-cloud.browserstack.com/wd/hub' }



  Scenario: google search, land on the YouTube, and search for knoldus.

    Given driver 'https://www.bstackdemo.com/signin'
    And input('input[id=react-select-2-input]',"fav_user")
    And input('input[id=react-select-3-input]',"testingisfun99")
    And click('button[id=login-btn]')
    And match driver.title == 'StackDemo'
    * def markTest = 
    """
    function(){
      var BStackRunner = Java.type('examples.users.BStackRunner');
      var bStack = new BStackRunner();
      return bStack.markTestStatus(driver)
      }
    """
    * def results = call markTest
    Then print results
