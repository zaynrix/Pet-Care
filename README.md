
## Design


Pet Care [Mobile](([https://www.figma.com/file/jMdYnGJmZ61VYUrSxkRly4/Petito-Pet-Care-App?type=design&node-id=2%3A8865&mode=design&t=2AnSjZS5e20gYykS-1](https://www.figma.com/file/jMdYnGJmZ61VYUrSxkRly4/Petito-Pet-Care-App?type=design&node-id=1-4&mode=design&t=R8nl4DIWNdBUgihL-0))) .

 



# Pet Care
![Detail Images 7 1](https://github.com/zaynrix/products/assets/28483872/aa7b4466-35f6-4ea1-8a9f-af8191c106c8)

![Detail Images 3](https://github.com/zaynrix/products/assets/28483872/ea47b075-c6e9-408a-9fea-e99997ceb3e9)
![Detail Images 5](https://github.com/zaynrix/products/assets/28483872/23ed8e50-05b9-407e-85af-52a8da81c41e)


# APK
<p align="center">
<a href="https://drive.google.com/file/d/1xl7bkY9usKwP4Yg2Z31stLjcxOEkE6yD/view?usp=sharing" target="_blank"><img src="screenShots/download.png" width="300"></a>
 </p>

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
