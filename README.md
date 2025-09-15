
[![DashStackPoster](https://github.com/user-attachments/assets/7e26ff78-7af4-4635-9095-db86202671d4)](https://dashstack.notion.site/Ravi-Vithani-e65c362e335d45ef993225687e4aacb8?pvs=143)

# Animated Search TextField 

A customizable and animated search text field widget for Flutter.

It expands smoothly when tapped, shows a search input, and collapses back with a customizable back button.

## ✨ Features
🔄 Smooth expand/collapse animation with search textfield.

🎨 Customizable colors, icons, and styles.

⌨️ Pass your own TextField for full control.

🛠️ Easy integration into any screen.

⚡  Replace default FAB with your custom FloatingActionButton

---
## How to use it ?

### 1. Add dependency
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  animated_search_textfield: <latest_version>
```  

### 2. Install it You can install packages from the command line: 

with pub :
```
$ pub get
```
with Flutter : 
```
$ flutter pub get
```
### 3. Import it

Now in your `Dart` code, you can use :

```
import 'package:animated_search_textfield/animated_search_textfield.dart';

```

### 4. Use it

Sample app demonstrates how simple the usage of the library actually is.

Using PriceText in your project is super simple.

You just need to add the widget with an amount and currency type, and it will handle formatting for you.

### 🎨 Customization Options

| Parameter              | Type                    | Default               | Description                              |
| ---------------------- | ----------------------- | --------------------- | ---------------------------------------- |
| `searchTextField`      | `TextField?`            | `null`                | Custom `TextField` widget.               |
| `expandedWidth`        | `double`                | `300`                 | Width of the search bar when expanded.   |
| `duration`             | `Duration`              | `600ms`               | Animation duration.                      |
| `searchIcon`           | `IconData`              | `Icons.search`        | Icon when collapsed.                     |
| `backIcon`             | `IconData`              | `Icons.arrow_forward` | Icon when expanded.                      |
| `iconColor`            | `Color?`                | `Colors.white`        | Color of the search/back icon.           |
| `searchTextFieldColor` | `Color?`                | `Colors.white`        | Background color of the text field.      |
| `iconBackgroundColor`  | `Color?`                | `Colors.deepOrange`   | Background color of the default FAB.     |
| `iconSize`             | `double?`               | `24`                  | Icon size.                               |
| `floatingActionButton` | `FloatingActionButton?` | `null`                | Provide a custom FAB instead of default. |

# Basic usage

🔍 Collapsed Mode → Shows a circular FAB with a search icon.

📏 Tap the FAB → Expands into a search bar (expandedWidth) and shows your TextField.

⬅️ Back Icon → Appears when expanded; tap to collapse again.

🧹 When collapsing, it also clears text input automatically.

### How to usage?

```
 AnimatedSearchTextField(
     expandedWidth: 300, // The width when expanded
      /// searchTextField: The TextField widget to be displayed when expanded
      searchTextField: TextField(
        readOnly: false,
        decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Search here...",
        hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 16),
      cursorColor: Colors.deepOrange,
      ),
      iconSize: 30, // The size of icon
      iconBackgroundColor: Colors.yellow, // The background color of icon
      iconColor: Colors.black, // The color of icon
      /// floatingActionButton: You can provide your own FloatingActionButton widget
      floatingActionButton: FloatingActionButton.large(
      backgroundColor: Colors.yellowAccent,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      ),
      onPressed: () {},
      child: const Icon(Icons.search, color: Colors.black),
      ),
      searchTextFieldColor: Colors.grey, // The background color of TextField
      backIcon: Icons.arrow_back, // back icon
      searchIcon: Icons.search, // search icon
      duration:  const Duration(milliseconds: 300), // duration of animation
  ),
```

## 📸 Example
| withoutAnyCustomization DefultScreen| with customization Screen |
|-------------------|-----------------------------|
| ![custom](https://github.com/user-attachments/assets/af31d110-b5c8-4fc3-b6e5-cfcffac86503) | ![nocustom](https://github.com/user-attachments/assets/dd4ab357-98d5-49c8-a468-d4fc2d208a44)  |


# Bugs and Feedback 
We welcome and appreciate any suggestions you may have for improvement.
For bugs, questions, and discussions please use the [GitHub Issues](your link).

# Acknowledgments 
It extends Flutter’s foundation to provide a ready-to-use, customizable currency formatter widget.While Flutter and intl provide the base, animated_search_textfield simplifies the process by combining widgets and formatting logic into a single package you can drop into any app.
 
# Contribution 
The DashStack team enthusiastically welcomes contributions and project participation!
There are a bunch of things you can do if you want to contribute!
The Contributor Guide has all the information you need for everything from reporting bugs to contributing new features.
  
# Credits 
`animated_search_textfield` is owned and maintained by the `Dashstack team`.
Follow us for updates and new releases 🚀.

