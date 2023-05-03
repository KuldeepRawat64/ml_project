Flutter Code Review Checklist
1. Naming Conventions
a) Classes, enums, typedefs, and extensions should be in UpperCamelCase.

b) Libraries, packages, directories, and source files should be in snake_case. (i.e. lowercase_with_underscores)

c) Variables, constants, parameters, and named parameters should be in lowerCamelCase.

d) Private variables names should be preceded with underscores.

e) Constants should be prefixed with ‘k’. For e.g. kPrimaryColor, kSecondaryColor.

f) Proper meaningful names should be provided.

2. Folder Structure
a) Segregation of code into a proper folder structure namely providers, models, screens / pages, utils should be followed.

b) Code should be properly formatted with trailing commas used appropriately.

c) Remove any print statements, unused, and commented code.

d) Try to make code reusable with the help of helper functions in utility files saved in the utils folder.

e) Widgets should also be designed to be reusable and can be saved in a widgets folder separately.

f) Avoid static / hard coded strings in the UI screens. Constants should be derived from a single place including color codes, validation messages etc., all saved in the constants file or folder.

3. Widget Structure and Usage
a) When working with infinite lists or very large lists. ListView builder should be used in order to improve performance.

b) Split the widget into different widgets. (i.e. Split the complex widget into various simple widgets)

c) When setState() is called on a State, all descendent widgets will rebuild. Therefore, split widget into small widgets so the setState() call rebuilds only the part of the subtree, whose UI actually needs to change.

d) Use Const in Widgets.

i) You can cache parts of your widget tree to prevent unnecessary rebuilds.

ii) The easiest way is to use dart const constructors for parts of the child tree which will not change. The widget which will not change when setState is called, we should define it as constant, to prevent the widget to rebuild so it improves the overall performance.

4. Building Method Structure should be clean and efficient.

5. Package Structure
a) When it comes to package structure, you should keep in mind that you need only a single import that re-exports all of the package’s API. Also, Flutter packages shouldn’t have private APIs (except for those prefixed with underscores) and every file in the package should be exported.

6. The Code should be Clean and Reusable.

7. Use Dart Code Metrics
a) Static code analysis tool — Some metrics are lines of executable code, number of parameters, number of methods, maximum nesting, and cyclomatic complexity, etc.,

b) Linting — Automatic checking of code by enabling the defined lint rules.

8. Reuse code whenever possible.

9. Document with Clarity.

10. Test Coverage should be high to capture all the code smells, edge cases, and to ensure safety.

11. Using Third Party Packages
a) Validate any third party package being used in the application as sometimes it might break the build or not be in sync with the current flutter version. This is especially required when you are upgrading flutter, so make sure to check all your plugins and third party packages after upgrade.

12. Proper State Management and Separation of Logic from UI
a) Use Provider as the recommended package for state management.

b) You can also choose to use any other approach for state management like Bloc.

c) Business logic should be separated from the UI.

13. Build Method Structure
a) The build method should be pure, without any side effects. This is because, it may be triggered by many external factors, such as.

i) Route pop or push.

ii) Screen resize, usually due to keyboard appearance or orientation change.

iii) Parent widget recreated its child.

iv) An InheritedWidget the widget depends on (Class.of(context) pattern) change. The build method should not have any logic to trigger an http call or modify any state.

14. Check for Boundary Cases and Handle Layout Overflows Properly.
a) The widgets should take care of responsiveness of the application.

b) Use of widgets which will handle screen overflows like Expanded to avoid overflow errors.

15. Follow Linting Rules.
a) Do avoid relative imports for files in lib/. Use package imports.

b) Follow the linting rules and enable them in the “analysis_options.yaml” file.

16. Using Provider package the right way.
a) Provide only at the needed level, instead of providing everything at the top level.

b) When using Provider.of() to consume data, listen to changes only if you need to, otherwise use listen:false if you want to consume the data only once. For e.g. making a method call.

c) When using Consumer widget, consume at the specific level in order to avoid rebuilding of the entire tree.

d) When using Consumer widget, use the child option to mark part of the independent widget tree which need not rebuild.

e) When using ChangeNotifierProvider, use the correct option of create or value based on if it’s an existing value or creating the provider value for the first time.