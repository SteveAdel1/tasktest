# tasktest

By wrapping the double parsing in a future, and using Future.value(doubleValue), I ensure that I passing a Future<double?> to the MainHome constructor, resolving the error you're facing. The FutureBuilder in MainHome will handle the loading and display of the value appropriately.

and implement the CustomProgressBar using Cubit instead of Provider,

Create a Cubit Class: This class will handle the state related to the progress.
Modify CustomProgressBar to use Cubit: Replace the Provider logic with Cubit logic.
Update the main widget to provide the Cubit.

after that  update the CustomProgressBar to use the ProgressCubit
Finally, I maked sure I provide the ProgressCubit in the widget tree. 

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
