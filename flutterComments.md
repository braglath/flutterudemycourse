# **Hello There**

# lets us learn flutter

# **there is a class called Widget**

- # two subclasses
  **StatelessWidget** - used if this widget will never contain its own data
  **StatefulWidget** - used if this widget is going to maintain some data source
  _never use stateless if we need to add in a variable/data to the widget like adding_
  # var <x= 'hello';>

# **HTTP Request**

# import 'package:http/http.dart';

# **Model Classes - working with json file type**

**When we have a json, lets say for a http request , first thing we need to do is to decode the raw json file into a map(readable file formal) by parsing the json data**

<void main (){
var rawJson = '{"url":"http://blah.jpg", "id":1}';
_now we are decoding the raw json data into a readable format_
var parsedJson=json.decode(rawJson);}>

- in order to tell dart what type of object we are dealing with we need to create a model class stating the type
  in model class
  <class ImageModel{
  <Int id;
  <String url;
  <ImageModel(this.id, this.url);
  <ImageModel.fromJson(Map<String, dynamic>parsedJson){
  id= parsedJson['id'];
  url= parsedJson['url'];
  }}

# **Future**

future is as same as promises as in java
_a future is meant to help with code that take some amount of time to execute a request_
_future (which we get back from a get function) \_is a object that will notify us when our data has been fetched_
_get function always returns a future_

- <import 'dart:async';>
- this is to import the future features

**typical get function code**
Future<String> get<String url>{
return new Future.delayed(new
Duration(seconds:3),(){
return 'Got the data!';
});
}

main(){
print ('About to fetch data..');
get('http:/somelink.com/').then((result){print(result);});
}
**output**
first we will get About to fetch data...
then after 3 sec we will get Got the data!

# **typical get function** **best method**

main() async {
print ('About to fetch data..');
var result = await get('http:/somelink.com/');
print(result);
}
Future<String> get<String url>{
return new Future.delayed(new
Duration(seconds:3),(){
return 'Got the data!';
});
}

**async and await** _the function contains a future and wait for it to resolve and then post the result_

response we get from a http request will contain many things along with Json data
so when we get a response from a http request we need to decode it
so the code will be
<ImageModel.fromJson(json.decode(response.body));>

_always a create a list type for image model as there will be more than one json data_

List<ImageModel> images = [];
_the above code - it is a list with the type of ImageModel_
_so all the elements inside images will be the type of ImageModel_

# **Set State Method**

_any time the widget state class's data changes chall the setstate method to update the widgets_

# **Instance Variables**

\*instance variables is a variable declared inside the class but outside any function(method) or any block of code\*\*

if only the parent widget is responsible of changing the variable then we can use the variable in a stateless widget

# ** To pass a variable to another dart file**

# example

app.dart to imagelist.dart
in app.dart add the imagelist.dart class name like below
<body: ImageList()>
inside the bracket add the variable name you want to pass
<body: ImageList(images)>
the above code will pass the value of images to the class ImageList which is in imagelist.dart file
in imagelist.dart file inside ImageList class add
Final List<ImagesModel> images;
<ImageList(this.images);>

# ** Keywords that declare variables**

**var** - this is used to denote that the variable is subject to change
<var myname = 'hello'
myname = 'yes there'>

**final** - this is used to denote that the variable is never going to change
<final myname = 'hello'>
myname can only be set once!!!!!!

# **ListView**

<ListView> - generates a list with pre-given details
<ListView.builder> - generates a list automatically according to the details (Best Used)

# **Images**

[Images class](https://api.flutter.dev/flutter/widgets/Image-class.html)
<Image.network> - display an image from a URL
<Image.file> - display an image from a file
<Image> - display an image from a ImageProvider

# **Single child layout**

# **Container**

[Container class/widget](https://api.flutter.dev/flutter/widgets/Container-class.html)

**for margin we need to EdgeInsets**
_we can also use EdgeInsets for Padding as well_
[edge insets](https://api.flutter.dev/flutter/painting/EdgeInsets-class.html)
<EdgeInsets.all(8.0)> - for all sides
<EdgeInsets.symmetric(vertical: 8.0)> - only top and bottom
<EdgeInsets.only(left: 40.0)> - only for left

**Decoration**
_we cannot use container color property when using decoration_
<BoxDecoration> - _to decorate the container_
[BoxDecoration](https://api.flutter.dev/flutter/painting/BoxDecoration-class.html)
<BoxDecoration(border: Border.all(color: Colors.black))> - _this will set a border to our container_

<FlutterLogoDecoration> - [](https://api.flutter.dev/flutter/painting/FlutterLogoDecoration-class.html)

<ShapeDecoration> - _we can create custom shapes by using this_
[ShapeDecoration](https://api.flutter.dev/flutter/painting/ShapeDecoration-class.html)

<UnderlineTabIndicator> - _we can customize the underline(often we can see in tabs)_ [UnderlineTabIndiactor](https://api.flutter.dev/flutter/material/UnderlineTabIndicator-class.html)

**Padding** - a widget that insets its child by the given padding
_same as we add padding to a container but this padding gets its own child property
where we can add anything and give it a padding property with EdgeInsets_

# **Multi-child layout**

**check this** - [SliverAppBar](https://api.flutter.dev/flutter/material/SliverAppBar-class.html)

# **Column**

_stacking widgets one below another_

# **Opened formValidation folder under lib folder**

# **State Management in Flutter** - two approaches of state management in general

_StatefulWidget_ - Doesn't scale to large apps, but easier to understand
_BLOC Pattern_ - Recommended by Flutter team, but complicated

# **Form**

_An optional container for grouping together multiple form field widgets (e.g. TextField widgets)_
_the values in the form always gets stored in FormState_

[FormClass](https://api.flutter.dev/flutter/widgets/Form-class.html)

you can create a global key above the main build widget, this help in validation of the form, check the code below

<final GlobalKey<FormState> formkey = GlobalKey<FormState>();>

**Key**
_this takes in the GlobalKey we created with the FormState_
<key: GlobalKeyName,>

# **TextFormField**

_A FormField that contains a TextField_
[TextFormField class](https://api.flutter.dev/fltter/material/TextFormField-class.html)

**KeyboardType**
_to customize the keyboard layout according to the form field_
<keyboardType: TextInputType.emailAddress,>

**decoration**
_this takes in InputDecoration()_

**InputDecoration**

- <labelText> - this is a String, it displays a text which will be on top left
  <labelText: 'Email',>

* <hintText> - this is a String, it displays a text which will be inside the form greyed out
  <hintText: 'you@gmail.com',>

**validator**
_this is to validate the values inside the form_
_GlobalKey validation uses this function to validate_
<validator: (value){
we return null if the value is valid or we return a string if the value is invalid
here you can put if statements for validation like
if(value.isempty()){
return 'cannot be empty'
}
}>

**onSaved**
_this saves the value inside the form-field_
_GlobalKey save function uses this to save the values_

# **GlobalKey**

_A key that is unique across the entire app_
[global key](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)
use the _FormState_ - this is where the value of the form are gets stored
_create a GlobalKey associated with the FormState_
<Final GlobalKey<FormState> nameit = GlobalKey<FormState>();>
and then pass the GlobalKey to the Form

# **FormState**

_State associated with a Form widget_
[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)

# **OnPressed function when submit button is pressed**

_we can use the global key to validate or do more functions when the button is tapped_

**reset**
<onPressed: (){
formkey.currentState?. reset(); - this resets all the value in the form
}>

**validate**
<onPressed: (){
formkey.currentState?. validate(); - _this check the validation property in every single child inside the form_
}>

**save**
_validate first and then save the value_
<onPressed: () {
if (formkey.currentState!.validate()) {
formkey.currentState?.save();
};}>

# **Mixin**

_a Mixin is a class that contains methods for use by other classes without having to be the parent class of those other classes.” In other words mixins are normal classes from which we can borrow methods(or variables) from without extending the class_
[mixin class](https://medium.com/flutter-community/https-medium-com-shubhamhackzz-dart-for-flutter-mixins-in-dart-f8bb10a3d341#:~:text=%E2%80%9CIn%20object%2Doriented%20programming%20languages,from%20without%20extending%20the%20class.)

**Step 1** - create a dart file with a class
**Step 2** - inside the class create different validation class as Strings
**Step 3** - in the main class where you want to call the validation functions, after the extends add with and the mixin dart file name
**Step 4** - then you can reference the mixin individual validation class names in validation

_Mixin dart file code_
class validationMixin {
String? validateEmail(value) {
if (!value!.contains('@')) {
return 'Please enter a valid email';
}
return null;
}

<String? validatePassword(value) {
if (value!.isEmpty) {
return 'password cannot be empty';
}
if (value.length < 4) {
return 'minimum 4 characters required';
}
return null;
}
}>

# **Streams**

_Streams are a source of asynchronous data events_
