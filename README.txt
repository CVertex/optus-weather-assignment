Optus Weather Assignment - by Vijay Santhanam, May 17

This assignment loads current weather info for Sydney, Melbourne and Brisbane in a UITableViewController and in a separate screen, present weather details.

Implemented in MVVM (sans data binding) and without libraries, this is how I like to write my iOS apps and a style I like to maintain.
MVVM provides clear separation of concerns which enables a greater level of testability than conventional MVC. 

It's built in layers starting with Model (and service), then ViewModel and finally View layers. Model and ViewModel are unit tested.

The View layer uses Storyboards for screen flow and XIBs for auxilliary views like Loading and Error. The list view is a standard UITableViewController. The details screen uses UIStackView for convenient layout and simple and elegant animation. 

Finally, I used swiftlift using GitHub rules to style and format the code.
