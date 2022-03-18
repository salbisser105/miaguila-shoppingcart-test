# miaguila-shoppingcart-test
This repo is being made for the test application that is being asked by Mi aguila Team. 


# About 
This is a basic shopping cart application where the state is going to be handled with BLoC. Features will look to keep the consistency of the data in the app. 

#How to use

**Step 1:**
Download or clone this repo by using the link below: 

```
https://github.com/salbisser105/miaguila-shoppingcart-test.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 
```
flutter pub get 
```
## Mi Aguila features:
In the aplication we have different features that are being used. 
* BLoC for state Management.
* For the routing of the aplication we use BLoC Navigator.
* Different own widgets for handling bottom bar navigation, alert dialog. 

## Up-coaming features:
* Local database.(Dio)
* Implementation of Cart BLoC.

## Libraries used.
* RxDart
* http
### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```
Here is the folder structure we have been using in this project.

lib/
| - blocs    /
| - entities /
| - helpers  /
| - models   /
| - ui       /
    |- pages /
    |- widgets/
| - bloc_central.dart
| - bloc_navigator.dart
| - main.dart

Now, lets dive into the lib folder which has the main code for the application.
```
1- blocs - Contains all the blocs that we will create in our application for handling the logic of our application.
2- entities - Here we handle our abstract class of our BLoC and stablish the basic functions.
3 - helpers - the files inside this class are used for handling the list of items. They work as helpers.
4 - Models - Here we handle the different models that we implement in our application.
5 - UI - Here we find the items related with the UI, we have 2 more folders inside this one. 1. for the pages of our app and the other one for the widgets that can be used in the application.  This helps us to have a better control and a better code.

```

## Conclusion
Due to the time there are some functionalities missing, what I did in order to solve this was handling those missing functionalities with Alert dialogs, there is some refactor to be done inside the code to have a better control with state management and there are some features that could be implemented in a future version such as local database.

I am sure I can be a good asset to the team, feel free to contact me if you have any questions you may have on this approach. I will be happy to answer.
