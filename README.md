YBS Technical Test
Submitted by Lucas West

Overview:
Hello YBS team, and welcome to my Flickr Photos app!

Over the past week, I've dedicated between 20-24 hours to developing this app, using the Flickr public API without requiring an authenticated API key, as requested.

I adhered strictly to using only SwiftUI, Foundation, and XCTest, without importing any additional modules.

I did not focus on Unit Testing the app as I ran out of time this weekend and I wanted to ensure that the apps functionality worked as intended.
Architecture and Design:

Given the project's scope and moderate complexity, I opted against using robust architectures like VIPER or RIBS. Instead, I implemented a variation of MVVM, ensuring simplicity and readability tailored to this test.

To handle my network calls I chose to use Async/Await primarily for its simplicity and readability, which streamlines the code and makes it more maintainable. It also offers improved error handling and eliminates the need for extensive overhead code, unlike Combine.

For the views, I adhered to fundamental software engineering principles, maintaining a SwiftUI-centric approach. Additionally, I incorporated a few useful extensions (e.g., frameSquare, asyncMain) to streamline the codebase and enhance its neatness.
Features Implemented:
Navigation:
Tab Bar: A tab bar for easy navigation between the Home and Search screens.

Home Tab:
Photo List: Displays a list of photos, each featuring a UserID, UserIcon and Tags.
Tags Button: Tapping the 'Tags' button shows a list of tags related to a photo.
Tag-Specific Photos: Tapping on a specific tag displays more photos related to that tag in a grid view.
Tag Sheet: If a tag is too long and gets truncated, you can hold it to display a small sheet showing the full tag.
User Photos: Tapping on a UserID/UserIcon displays a list of photos that the user has uploaded to the Flickr platform.
Photo Detail View: Tapping on any image presents a detailed view of the photo, including:
Image
Title
Description
Date Taken
Date Published
Tags
A link to view the image on the Flickr platform
Full Screen Image: Clicking on an image in the PhotoDetailView presents it in full screen with the ability to double-tap to zoom into the centre of the image.

Search Tab:
Default Search: On first load, there is a default search for "Yorkshire" with safe_search set to safe.
Search Functionality: You can search for images using tags and UserID. Options include:
Selecting whether the tags display all or some tags.
Setting safe_search preferences.
Home Tab Features: All functionalities from the Home tab are also available on the Search tab.

Challenges Faced:

UI Design:
Designing the UI within a limited timeframe was challenging. Due to time constraints, I couldn't experiment with animation effects like MatchedGeometryEffect. I am working on improving my creativity and UI design skills, especially for larger projects. While I'm good at refining existing designs, envisioning a large project from the start proved difficult.
Coding Difficulties:
I encountered several small but interesting bugs:
ScaledToFill Stretching Behind Buttons: This bug rendered buttons unusable. Initially, I explored various solutions, including tweaking LazyVStack and experimenting with different buttons. Ultimately, I discovered the image was extending behind the button.
PhotoDetailContent Not Loading on First Launch: This issue was due to closures not redrawing views in SwiftUI, unlike UIKit. The solution was to create a PhotoViewModel to handle all the necessary bindings, ensuring the views were presented correctly. Identifying that closures were the culprit took some time.


What could be improved:

There are several aspects of the app I would like to enhance:

TabBar pressing: Tapping on a tab bar takes you to the top of the screen.
Error Handling: Implementing more robust error handling mechanisms, toast handling would be viable.
Unit Tests: Increasing the number of unit tests, including creating a mock service/repository to test data retrieval and various scenarios.
FullScreenPhotoView Enhancements: Adding drag and scrolling functionality for a smoother user experience.
Animations: Integrating animations using MatchedGeometryEffect by setting namespace IDs on all photos and tag buttons, as well as custom animations to replace the ProgressView.
Custom Views: Developing custom views such as a more feature-rich search bar that includes additional options from the API, like date posted and published.
Localization: Adding support for multiple languages.
UI Overhaul and Theming: Enhancing the overall UI with a comprehensive overhaul, including the introduction of dark/light mode.
Package Management: Using Swift Package Manager (SPM) or CocoaPods to move areas of logic into their own packages. This modular approach can simplify dependency management, improve code organisation, and facilitate easier updates and testing.
Known Issues:
Padding Issue: The PhotoGridView in SearchView, ImageSpecificTagView, and UserPhotosView slightly differs in look due to inconsistent padding.

Rendering Problem: The last 2 images in SearchView, ImageSpecificTagView, and UserPhotosView do not render correctly.
Conclusion:

Overall this was a fun challenge, thanks for setting it!

Given more time I would’ve liked to have set up the project to be able to Unit Test some areas of it. Some of these include the API service. Creating a MockFlickrService to ensure correct URL calls and response handling. Data parsing, ViewModel logic, image caching, search functionality, error handling, pagination, and UI component state updates would be areas that I would’ve liked to have tested the app.

Aside from Unit Tests I believe I made a good little app that could easily be expanded on and significantly improved. I hope it meets your expectations, I’d love to know what you thought I could improve!
