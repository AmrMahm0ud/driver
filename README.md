# Driver Flutter Project
This project is a Flutter application for managing driver tasks.


# Project Architecture
This project follows the Clean Architecture pattern, which separates the application into distinct layers that are responsible for specific tasks. The layers are as follows:

Presentation Layer: This layer is responsible for handling user interface-related tasks such as rendering views and responding to user input.

Domain Layer: This layer represents the business logic and rules of the application. It should be independent of any specific user interface or data storage technology.

Data Layer: This layer is responsible for handling data storage and retrieval. It should also be independent of any specific user interface or business logic.
Clean Architecture emphasizes the importance of dependency inversion, which means that higher-level layers should not depend on lower-level layers.
Each layer should define interfaces that define the communication between layers, making it easier to change one layer without affecting the others.

By following the Clean Architecture pattern, this project aims to be more scalable, maintainable, and testable. Separating concerns and defining clear interfaces between layers makes it easier to understand, modify, and extend the application over time.

# Getting Started
To get started with this project, you'll need to have the Flutter SDK installed on your machine. You can download the SDK and follow the installation instructions on the Flutter website.

Once you have Flutter installed, you can clone the "driver" project from the GitHub repository:

git clone https://github.com/AmrMahm0ud/driver.git


After cloning the project, you'll need to run the following command to install the project's dependencies:

flutter pub get

# Running the App

to run the Driver app

flutter run --flavor driver -t lib/main_driver.dart

to run the Driver admin app

flutter run --flavor driver -t lib/main_driver_admin.dart




