# iOS Tech Challenge: What to eat (Proposed solution). 

(For the challenge description see bellow)

This repository fork contains the changes implementing the challenge App. These are the highlights of this work:

- An MVP pattern was used to decouple the view from the model. 
- The 'View' project folder groups the controllers (two of them) on other supporting views used in the solution
- In the 'Model' folder are the entities and services which are used to access the Flikr endpoints. 
- The 'Presenter' folder contain the classes that respond to user actions, they are decoupled from the controllers and view thru protocols, so this layer (along with the Model) can be reused by other projects
- The App target only uses two Swift classes, the Flikr service and it's suporting http utility. The rest of the project are Objective-C classes.
- There is a unit testing target written in Swift (for productivity), within it there are two XCTestCases, one which test the Flikr service and other which test one of the presenters (partially)
- For a quick look Check the resources folder for a screen recording of the App.

Instead of adding more features I decided to focus on making the App scalable and testable, I hope this final result will show it.

# iOS Tech Challenge: What to eat. 

Welcome to the Orderbird Tech Challenge :-).

"What to eat" is an app that helps you find some food on days where you are doubting what to bring to your stomach.

It has a simple table view, which fetches images from flickr API service, and populates a title and description label in the UI.
Unfortunately one of our developers had introduced some bugs by accident and we hope that you can help to find and fix them.

**Bug Fixes:**
First task would be to implement some bug fixes some of which are minor UI cosmetics and some which may be of a more serious nature and impact performance.
We also noticed that the text within the cells seems to be truncated, would be nice to have this fixed also.


**New Feature requirements:**
We would like you to add the ability to present a detail view of a tapped image cell to display a bigger more detailed image from the API with more details and text.
Ideally this would envolve pushing to a new ViewController.

We also think that it would be nice to have the ability to sort the images by Date, perhaps this could displayed in a UISegmentedControl or have some toggle component.

Finally a re-write of the Networking layer in Swift 4 (or latest) would be required & add unit tests for the new module.

Some guidelines:

- Showcase your abilities, and use the task to demonstrate your idea of best practices, regarding coding style, project structure, patterns, design, etc.
- Don't use third party libraries.
- please do not rewrite the app completely in SWIFT ;-) (as we are more curious on how you work with the objective C codebase)
- There is no right or wrong solution, as long as it is your solution.
- If you only have time to do one thing please do it as good as you possible can. It is better to have a nice but incomplete solution rather than a mediocre "feature complete" one. We want to get a good impression of your abilities.
- Be prepared to describe your work in detail.
- Flickr photo search: <https://www.flickr.com/services/api/flickr.photos.search.html>



