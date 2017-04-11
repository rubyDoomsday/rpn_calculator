# Bibliography

## Reference
[What is the best way to define main method?](http://stackoverflow.com/questions/582686/should-i-define-a-main-method-in-my-ruby-scripts)

[How do I use RSPEC to test regular ruby scripts?](http://patrikbona.com/blog/how-to-test-ruby-scripts-with-rspec/)

[Number regex](http://stackoverflow.com/questions/12883086/regular-expression-to-match-number-formats)

[Enumerable Ruby Docs](https://apidock.com/ruby/Enumerable)

[Colorize Gem Docs](https://github.com/fazibear/colorize)

[String Ruby Docs](https://ruby-doc.org/core-2.2.0/String.html)

[What's the best way to test puts statement?](http://stackoverflow.com/questions/17709317/how-to-test-puts-in-rspec)

## Documentation
[Building sequence diagrams](https://github.com/rubyDoomsday/sequence_it)

# Issues
1. Calculating separate lines of input is problematic. Allowing the user to enter an input in series is not a valid contract from my perspective. If this should be able to change to a RESTful user interface in the future, this concept would not be maintainable as outlined. without further consideration (see example series below). The input of `2 3` would fail to produce a valid output or default last integer in the list. This would then ladder up to the following expression of `+` which would break the contract with the calculator. **RESULT** I have allowed the calculator to default to returning the last integer entered in scenarios when no operator is provided to adhere to the other input contracts within the scenario.
```
POST /calculator&input=4 5 + -> 200 { result: 9.0 }
POST /calculator&input=4 -> 200 { result: 4.0 }
POST /calculator&input=5 -> 200 { result: 5.0 }
POST /calculator&input=2 3 -> 400 { result: ? }
POST /calculator&input=+ -> 400 { result: ? }
```

2. The synopsis states to allow a user to enter a `/` to run the division operator. However this is not in line with ruby/rails best practices. Forward slashes in a user input opens up your program to [XSS attacks](http://stackoverflow.com/questions/29898302/rails-security-allowing-slash-as-user-input) and is not advised..

# Project Tracking
| Date       | Start | End   | Description                                       |
| ---------- | ----- | ----- | ------------------------------------------------- |
| 2017-04-10 | 16:00 | 16:30 | Received code test scenario, and outlined story   |
| 2017-04-10 | 16:30 | 17:45 | Setup up project, documentation and diagrams      |
| 2017-04-10 | 17:45 | 18:00 | Interface operational and tested                  |
| 2017-04-11 | 08:00 | 09:00 | Setup basic math operations                       |
| 2017-04-11 | 09:00 | 09:30 | Refactor calculator class, unchained math working |
| 2017-04-11 | 01:00 | 02:00 | Refactor all tests passing, calculator working    |
| 2017-04-11 | 04:00 | 05:00 | Update interface, added tests, error handling     |
| 2017-04-11 | 05:00 | 05:30 | clean up docs, added 'ctrl-D' exception handling  |
