# AmondoSDK
The AmondoSDK provides access to the Amondo Imprint database, and allows all of the Imprint functionality to be integrated and used within your app, with a single ```present``` method.

## Installation

### Swift Version
#### Amondo SDK is compiled with Swift 4.2
When building the project, make sure that for Pods project, AmondoSDK target, Swift 4.2 is selected under Build Settings > Swift Compiler Language > Swift Language Version.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.4+ is required to build the AmondoSDK.

To integrate Amondo into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Amondo/AmondoSDKPodSpec.git'

platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'AmondoSDK', '~> 0.7.3'
end
```

Then, run the following command:

```bash
$ pod install
```

If you are updating from a previous version, run this method beforehand:
```bash
$ pod repo update
```

## Usage

### Connecting to the SDK

To connect to the AmondoSDK, you need to call the initialise function, which (among other things) gets an access token from our servers, to authenticate your future requests.

```swift
import AmondoSDK

AmondoSDK.initialise(appID: <YOUR_APP_ID>, secretKey: <YOUR_SECRET_KEY>)
```

> The initial SDK initialisation is done _asynchronously_. It should therefore be carried out at a suitable location before the SDK is needed. After the first app launch the SDK will remain initialised.

If you ever need to disconnect from the SDK, you can use: 

```swift
AmondoSDK.deinitialise()
```

### Loading Imprints

To connect to the Amondo database and load all Imprints associated with your Amondo account, use:

```swift

AmondoSDK.sharedInstance()?.loadAllImprints(completion: { (error:Error?, imprints:[AMDImprintItem]?) in
            
            if error == nil {
                // dragons be here 
                }
            } else {
                print(error)
            }
        })
```
Or you can load specific Imprints from your available Imprints by inputting the relevant IDs:

```swift

AmondoSDK.sharedInstance()?.loadImprintsWithIds(ids: [1200,1060,1062,1063,1068], completion: { (error, imprints) in
           
            if error == nil {
                
                for imprint in imprints! {
                    // dragons be here       
                }
                
            } else {
                print(error)
            }

        })
        
```

To load just a single Imprint use:

```swift

AmondoSDK.sharedInstance()?.loadSingleImprint(id: id, completion: { (error, imprint) in
                
                if error == nil {
                    // dragons be here
                }  else {
                    print(error)
                }
                
            })
            
```

## The Imprint View Controller

An Imprint is presented in a stand alone ```UIViewController```, which is presented modally on top of the specified ```owner``` view controller. Customisation of an Imprint is done with ```ImprintGridStyle``` and it is passed in as ```style```:

```swift
AmondoSDK.sharedInstance()?.presentImprint(item: item!, animated: true, owner: self, gridStyle: style, completionDone: {
                
            })
```
Once an Imprint has been presented, all functionality is contained within that view controller, and its children view controllers. When a user closes the Imprint, it is dismissed and removed from ```the owner``` view controller.

## Imprint View Controller Styling

Imprints can be customised with a few options by creating a custom style and setting custom values for available options:
```swift
let style: ImprintGridStyle = ImprintGridStyle()
style.presentSplash =  false
style.tileBackgroundColor = UIColor.red
```

Default options are:
```swift
    tileBackgroundColor: UIColor = Colors.transparent
    presentSplash: Bool = true
    headerTitleFont = Fonts.condensedBoldWithSize(size: 20)
    headerTitleFontLarge = Fonts.condensedBoldWithSize(size: 36)
    headerInfoFont = Fonts.interBold(size: 10)
    tileUsernameFont = Fonts.sfSemiBold(size: 14)
    tileInfoFont = Fonts.sfSemiBold(size: 10)
    tileDescriptionFont = Fonts.sfRegular(size: 16)
    buttonActionFont = Fonts.sfSemiBold(size: 15)
```
