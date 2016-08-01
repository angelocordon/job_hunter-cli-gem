<!-- 1. Plan Gem, imagine my interface
2. Start with the project structure, google
3. Start with the entry point - the file run
4. Force that to build the CLI interface
5. Stub out the interface
6. Start making things real
7. discover objects
8. program
how to auto create the structure of a gem
bundle gems "name of gem" -->

1. create a gem that takes input from user through prompted options:

2. Each option will be the job's attributes / attr_accessor

3. the information is parsed in as XML from the indeed.com API

4. In order to customize the job search the http API link must be able to change dynamically based
  on what the user inputs in the command line. To do this each assigned key word / letter from the
  http link provided by the API will be an optional argument (key/value of a hash).

  A new Scraper object is instantiated / when the user enters input into
  the options in the CLI returning a custom search. Each option in the CLI will be associated with a key from the
  Scraper's hash arguments in it's initialize method. In other words when a user chooses and option they are
  really creating the value of the Scraper hash key.

5. Wrap the input inside of an instance of the Scraper object as the value of the key(option)

4. Use Nokogiri to parse in the XML

5. save information in a hash

6. The #initialize method should take in an argument of a hash and use metaprogramming to assign the newly
created job attributes and values in accordance with the key/value (indeed.com API key words / letters ) pairs
of the hash. Use the #send method to achieve this.

7. The user will be able create a custom search changing the value of the XML return depending on what the user
types into the command line when prompted. In turn this will change the http request and send a different XML
response with different information based on the search.

8. each key word or letter from the indeed.com API will be saved as key pair values in a  
doc = Nokogiri::HTML(open(index_url))
end
