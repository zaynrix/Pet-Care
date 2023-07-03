
## Design


Pet Care [Mobile](([https://www.figma.com/file/jMdYnGJmZ61VYUrSxkRly4/Petito-Pet-Care-App?type=design&node-id=2%3A8865&mode=design&t=2AnSjZS5e20gYykS-1](https://www.figma.com/file/jMdYnGJmZ61VYUrSxkRly4/Petito-Pet-Care-App?type=design&node-id=1-4&mode=design&t=R8nl4DIWNdBUgihL-0))) .

 


## Pet Care



Folder Structure 
By Feature inside every features will be MVC.



```
 |-lib|
     |     
     | Registration | models -> All models that conceren with this feature 
                    | screens -> If the feature has many sub features you can divide it with sub folder if needed
                    | providers -> All providers that needed in this feature 
                    | repositories -> For every provider should have his repo
                    | widgets -> Just the widget that concern with this feature 
```

## Usage
If you wanna access resources manger:


```dart
# colors
ColorManager.primary;

# images
ImageAssets.splashLogoPng;
SVGAssets.homeSvg;
IconAssets.arrowRight;

# fontWeightManager
FontWeightManager.black;

# text Strings
AppString.bankWithdraw;
```



# For navigation the project built based on OnGenerateRoute:


```dart
# pushNamed
sl<NavigationService>().navigateTo(Routes.home);

# pushNamedAndRemoveUntil
sl<NavigationService>().navigateToAndRemove(Routes.home);

# pop;
sl<NavigationService>().pop();
```
