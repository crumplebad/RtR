# RtR

RentTheRunway(RtR) iOS application does the following 
- downloads a list of dress designers and accessory designers in form of JSON. 
- merges the list and displays them in an alphabetical order.
- a product list is also downloaded and the products tied to the respective designers.
- users can favorite a designer and these favorites are persisted across sessions.
 
### Architecture
RtR uses VIPER (View, Interactor, Presenter, Entity, Router) sans Router instead of the much loved and hated MVC (Model View Controller), which results in Massive View Controllers. Use of StoryBoard makes having Router challenging and less relevant. Other modifications to VIPER includes SharedDataManager, which fetches the data from server for both the Designers Scene as well as Products Scene, hence the name SharedDataManager. Products Scene also has a dedicated DataManger, called ProductsDatManager, which fetches the data from the Data Model instead of the web, thus the DataManager abstracts the data source from the view-controller.

### Compromises

An array of products returned from the web-service was converted to a NSDictionary in the inti method of the entity collection, instead of manipulating the data in the ProductsInteractor class, for sake of efficiency at the cost of not so clean design. In contrast, for Designers Scene all the data manipulation is done in DesignersInteractor as per VIPER guidelines.

### Enhancements
> Keep improving.

I would like to make following enhancements:
- improve the pattern to use Realm in multi-threaded environment. Accessing (no simultaneously) Realm objects from multiple  thread causes app to crash.
- follow TDD to create better code-coverage instead of adding test cases after the development. 
- add UI testing.

### Version
1.0.0

### Tech

RtR uses a number of open source projects namely:

* [Realm] - For persisting data locally.
* [Carthage] - For dependency management.
* [ Dillinger] - Online Mark Down editor to prepare ReadMe.md

### Installation/Run
RtR use iOS 9.3 SDK and Xcode 7.3 (Xcode 7.3.1 had issues launching Simulator on macOS Sierra)
You need to install Carthage before compiling RtR

```sh
$ cd <to project folder>
$ carthage update --platform iOS
```
I used Carthage instead of CocoaPods for the simplicity and ease of use. Its very easy to replace Carthage by other dependency managers, unlike CocoaPods .


[Realm]: <https://realm.io>
[Carthage]:<https://github.com/Carthage/Carthage>
[ Dillinger]: <http://dillinger.io>

