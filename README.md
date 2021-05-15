# Develop an image classifier mobile application with Flutter, using custom TensorFlow Lite model

# Description

Artificial Intelligence and machine learning have transformed the mobile app development landscape,<br/>
we can now run ML algorithms on mobile devices without the need of high-powered GPU machines.<br/>

In this project we create a Flutter mobile application to classify photovoltaic cells images between two classes:<br/>
functional or defected,using TensorFlow Lite framework that provide us with pre-trained machine learning models <br/>
as well as tools to train and import our own custom models.

# Requirements

- _TensorFlow Lite_
- _Image Picker_
- _Flutter Speed Dial_
- _Animated Splash Screen_

Add the packages in your `pubspec.yaml` file under dependencies:<br/>

![image](https://user-images.githubusercontent.com/84082577/118360297-de004b00-b57e-11eb-9775-6542ad89321b.png)

and run this command in your terminal: `flutter pub get`<br/>

# Get Started
After we have our trained TFLite model we can start developing our Flutter application.<br/>
**Note** : in this project we use the `EfficientNetv4` model, but you can deploy your own.

First, create an `assets` folder inside the project folder and copy the downloaded model<br/>
and the corresponding labels file into that folder, also we have to add the assets in the `pubspec.yaml`.<br/>

![image](https://user-images.githubusercontent.com/84082577/118361501-a8119580-b583-11eb-8ca9-72a77bfcc42c.png)  ![image](https://user-images.githubusercontent.com/84082577/118361960-6bdf3480-b585-11eb-8052-6be300288ab1.png).


The `lib` folder contains three files :
- `main.dart`: this file contains the main function which shall load the app layout on the screen.
- `splash_screen.dart` : in this file we manage animations using the ` animated_splash_screen` package.
-  `DetectionWidget.dart`:

      We need to initiate three variables : 

      - **List  _outputs** : to recieve the output.
      - **File  _image** : to store the uploaded image.
      - **bool  _loading** : to catch loading errors.<br/>
   
      Now we can load our model with the `loadModel` function, and using `getImageFromGallery` and `getImageFromCamera`<br/>
      we can pick images either from the gallery (this includes cloud storage) or from the device camera,<br/>
      then pass this image on to the `classifyImage` function to complete the classification process.
      
 















 
 
